-- 업체.sql
-------------------------------------------------------------------------------
-- 회원 가입
-------------------------------------------------------------------------------
insert into tblFirm values (seqFirm.nextVal,
                            '아이디', 
                            '비밀번호', 
                            '이메일',
                            '주소', 
                            '연락처', 
                            '소개글', 
                            '포트폴리오 이미지 주소', 
                            0, 
                            0,
                            0, 
                            (select seq from tblCategory where categoryNum = '카테고리명(청소/시공)'));
-------------------------------------------------------------------------------
-- 아이디 찾기 
-------------------------------------------------------------------------------
select email from tblFirm where id = '업체명' and tel = '연락처';
-------------------------------------------------------------------------------
-- 비밀번호 찾기
-------------------------------------------------------------------------------
select pw from tblFirm where email = '이메일' and tel = '연락처';
-------------------------------------------------------------------------------
-- 승인 업체 관련 뷰
-------------------------------------------------------------------------------
create or replace view vwApprovalF
as
select
    f.seq as seq, -- 업체 번호
    af.seq as aseq, -- 승인 업체 번호
    f.id as id, -- 업체명(아이디)
    c.categoryNum as categoryNum, -- 카테고리
    f.email as email, -- 이메일
    f.address as address, -- 주소
    f.tel as tel, -- 연락처
    f.introduction as introduction, -- 소개글
    f.portfolio as portfolio -- 포트폴리오
from tblFirm f
    inner join tblCategory c
        on c.seq = f.categorySeq
            inner join tblApprovalF af
                on af.firmSeq = f.seq
                    where f.delFlag = 0
                        order by f.seq desc;
                                                
select * from vwApprovalF;     
-------------------------------------------------------------------------------
-- 전문 업체 전체 목록 조회
-- 최근에 등록된 업체 순
-------------------------------------------------------------------------------
select seq, id, categoryNum, email, address, tel, introduction, portfolio
from (select af.*, rownum as rnum from vwApprovalF af)
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
-------------------------------------------------------------------------------    
-- 특정 업체 조회
-------------------------------------------------------------------------------
select seq, id, categoryNum, email, address, tel, introduction, portfolio
from (select af.*, rownum as rnum from vwApprovalF af where categoryNum like '%카테고리명(시공/청소)%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
-------------------------------------------------------------------------------
-- 업체 견적서 등록 시 포인트 차감 트리거
-- 하루 3번 무료, 이후 등록 시 500포인트 차감
-------------------------------------------------------------------------------
create or replace trigger trgUsePoint
    before
    insert on tblEstimate1th
    for each row
declare
    vfirmSeq number;
    vcnt number := 0; -- 오늘 몇번 등록했는지 셀 카운트 변수
begin
    select firmSeq into vfirmSeq from tblApprovalF where seq = :new.approvalFSeq;
    
    -- 업체 견적서 테이블에서 오늘 몇번 등록했는지 세서 vcnt에 저장
    select nvl(max(count(approvalFSeq)), 0) into vcnt from tblEstimate1th 
        where approvalFSeq = :new.approvalFSeq and to_char(regDate, 'yyyymmdd') = to_char(sysdate, 'yyyymmdd') 
            group by approvalFSeq;
        
    -- 3번 이상일 경우 포인트 차감
    if vcnt >= 3 then
        -- 포인트 사용 기록 테이블에 추가
        insert into tblUsageLog values (seqUsageLog.nextVal, default, 500, :new.approvalFSeq);
    
        -- 업체 테이블의 보유 포인트 수정
        update tblFirm set availablePoint = availablePoint - 500 where seq = vfirmSeq;
    end if;
end;
-------------------------------------------------------------------------------
-- 업체 견적서 작성
-------------------------------------------------------------------------------
create or replace procedure procAddEstimate1th(
    paseq number, -- 승인 업체 번호
    prseq number, -- 고객 요청서 번호
    pcost number, -- 예상 비용
    pcontent varchar2 -- 견적서 내용
)
is
begin
    insert into tblEstimate1th 
        values (seqEstimate1th.nextVal, default, paseq, prseq, pcost, pcontent, 0);
    commit;
exception
    when others then
        rollback;
end procAddEstimate1th;
-------------------------------------------------------------------------------
-- 포인트 충전
-------------------------------------------------------------------------------
create or replace procedure procAddPaymentLog(
    paseq number, -- 승인 업체 번호
    ppayment number -- 결제액
)
is
begin
    -- 포인트 결제 기록 테이블에 추가
    insert into tblPaymentLog 
        values (seqPaymentLog.nextVal, default, ppayment, paseq);
    
    -- 업체 테이블의 보유 포인트 추가
    update tblFirm set availablePoint = availablePoint + ppayment
        where seq = (select firmSeq from tblApprovalF where seq = paseq);
    commit;
exception
    when others then
        rollback;
end procAddPaymentLog;
-------------------------------------------------------------------------------
-- 포인트 충전 내역 조회 (길어지면 where절 추가)
-------------------------------------------------------------------------------
select
    seq, -- 포인트 결제 기록 번호
    payment, -- 포인트 결제액
    paymentDate -- 포인트 결제 일자
from (select seq, payment || 'p' as payment, paymentDate, approvalFSeq, rownum as rnum 
        from tblPaymentLog where approvalFSeq = 승인업체번호);
-------------------------------------------------------------------------------
-- 포인트 사용 내역 조회
-------------------------------------------------------------------------------
select 
    seq, -- 포인트 사용 기록 번호
    useAmount, -- 포인트 사용액
    usageDate -- 포인트 사용 일자
from (select seq, useAmount, usageDate, approvalFSeq, rownum as rnum 
        from tblUsageLog where approvalFSeq = 승인업체번호);
--    where rnum between 2 and 5;
-------------------------------------------------------------------------------    
-- 특정 업체 견적서 조회
-------------------------------------------------------------------------------
select
    e1.seq as seq, -- 업체 견적서
    va.id as id, -- 업체 아이디(업체명)
    e1.estimatedCost as estimatedCost, -- 견적 예상 비용
    e1.econtent as econtent, -- 견적서 내용
    e1.regDate as regDate, -- 작성일
    decode(e1.adoptFlag, 1, '채택', 0, '미채택') as adoptFlag -- 채택 여부
from vwApprovalF va
    inner join tblEstimate1th e1
        on va.aseq = e1.approvalFSeq
            where va.aseq = 승인업체번호
                order by regDate desc;
-------------------------------------------------------------------------------
-- 업체가 보낸 견적서를 고객이 조회
-- 가장 최근에 받은 견적서가 제일 상단에
-------------------------------------------------------------------------------
create or replace procedure procFindEstimate1th(
    prequestSeq number, -- 고객 요청서 번호
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                            seq, -- 업체 견적서 번호
                            (select id from vwApprovalF where aseq = approvalFSeq) as id, -- 업체명(아이디)
                            (select portfolio from vwApprovalF where aseq = approvalFSeq) as portfolio, -- 포트폴리오
                            estimatedCost, -- 예상 비용
                            econtent, -- 견적서 내용
                            regDate -- 견적서 작성일
                    from tblEstimate1th
                        where requestSeq = prequestSeq
                            order by seq desc;
end procFindEstimate1th;
-------------------------------------------------------------------------------
-- 고객 요청서 작성
-------------------------------------------------------------------------------
create or replace procedure procAddRequest(
    pseq number, -- 회원 번호
    paddress varchar2, -- 주소
    pshape varchar2, -- 가옥 구조
    pdesiredDay date, -- 서비스 시작일
    pdetail varchar2, -- 상세 전달 사항
    parea number, -- 면적
    pstype varchar2 -- 서비스 품목
)
is
begin
    insert into tblRequest 
        values (seqRequest.nextVal, default, paddress, pshape, pdesiredDay, pdetail, parea, (select seq from tblService where stype = pstype), pseq);
    commit;
exception
    when others then
        rollback;
end procAddRequest;
-------------------------------------------------------------------------------
-- 1:1 온라인 상담 내역 조회 - 특정 견적서에 한해
-------------------------------------------------------------------------------
select 
    decode(whoFlag, 1, '업체', 0, '회원') as whoFlag, -- 작성자
    chatContent, -- 글 내용
    to_char(timeSent, 'hh24:mi') as timeSent -- 발송 시간
from tblChatAsk
    where estimate1thSeq = 업체견적서번호;
-------------------------------------------------------------------------------
-- 업체 견적서를 바탕으로 한 회원과 업체 관련 뷰
-------------------------------------------------------------------------------
create or replace view vwEstimate1th
as
select
    af.aseq as aseq, -- 승인 업체 번호
    af.id as id, -- 업체 아이디(업체명)
    e1.seq as eseq, -- 업체 견적서 번호
    m.seq as mseq, -- 회원 번호
    r.seq as rseq -- 고객 요청서 번호
from vwApprovalF af
    inner join tblEstimate1th e1
        on af.seq = e1.approvalFSeq
            inner join tblRequest r
                on r.seq = e1.requestSeq
                    inner join tblService s
                        on s.seq = r.serviceSeq
                            inner join tblMember m
                                on m.seq = r.memberSeq
                                    order by e1.regDate desc;

select * from vwEstimate1th;
-------------------------------------------------------------------------------
-- 1:1 온라인 상담 내역 조회 - 업체별 목록 조회
-------------------------------------------------------------------------------
select
    distinct ve.id as id -- 업체 아이디(업체명)
from vwEstimate1th ve
    left outer join tblChatAsk ca
        on ve.eseq = ca.estimate1thSeq
            where ve.mseq = 회원번호(18);
-------------------------------------------------------------------------------
-- 1:1 온라인 상담 - 회원이 메시지 작성
-------------------------------------------------------------------------------
create or replace procedure procMemberChatAsk(
    peseq number, -- 업체 견적서 번호
    pchatContent varchar2 -- 글 내용    
)
is
begin
    insert into tblChatAsk values (seqChatAsk.nextVal, default, peseq, pchatContent, 0);
    commit;
exception
    when others then
        rollback;
end procMemberChatAsk;
-------------------------------------------------------------------------------
-- 1:1 온라인 상담 - 업체가 메시지 작성
------------- 위랑 같은 프로시저인데 일단... 이걸로 하고 보류...
-------------------------------------------------------------------------------
create or replace procedure procFirmChatAsk(
    peseq number, -- 업체 견적서 번호
    pchatContent varchar2 -- 글 내용    
)
is
begin
    insert into tblChatAsk values (seqChatAsk.nextVal, default, peseq, pchatContent, 1);
    commit;
exception
    when others then
        rollback;
end procFirmChatAsk;

-------------------------------------------------------------------------------
-- drop
-------------------------------------------------------------------------------
drop view vwApprovalF;
drop trigger trgUsePoint;
drop procedure procAddEstimate1th;
drop procedure procAddPaymentLog;
drop procedure procFindEstimate1th;
drop procedure procAddRequest;
drop view vwEstimate1th;
drop procedure procMemberChatAsk;
drop procedure procFirmChatAsk;