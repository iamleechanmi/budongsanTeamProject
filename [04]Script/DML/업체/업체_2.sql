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
-- 승인 업체 목록 조회 시 총 페이지수 계산하는 함수
-------------------------------------------------------------------------------
create or replace function fnApprovalFMaxPage(
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwApprovalF) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 전문 업체 전체 목록 조회(회원이 업체를 조회한다. 최근에 등록된 순, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace procedure procListApprovalF(
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 번호
                        id, -- 업체명(아이디)
                        categoryNum, -- 카테고리
                        address, -- 주소
                        introduction, -- 소개글
                        portfolio -- 포트폴리오
                    from (select rownum as rnum, af.* from vwApprovalF af)
                        where rnum between 10*(fnApprovalFMaxPage(ppage)-1)+1 and fnApprovalFMaxPage(ppage)*10;
end procListApprovalF;

--declare
--    vcursor sys_refcursor;
--    vseq vwApprovalF.seq%type;
--    vid vwApprovalF.id%type;
--    vcn vwApprovalF.categoryNum%type;
--    va vwApprovalF.address%type;
--    vi vwApprovalF.introduction%type;
--    vp vwApprovalF.portfolio%type;
--begin
--    procListApprovalF(1, vcursor);
--    loop
--        fetch vcursor into vseq, vid, vcn, va, vi, vp;
--        exit when vcursor%notfound;
--        DBMS_OUTPUT.PUT_LINE(vseq||' '||vid||' '||vcn||' '||va||' '||vi||' '||vp);
--        end loop;
--end;
-------------------------------------------------------------------------------    
-- 특정 업체 조회(필요에 따라 where절로 조건을 더 걸어 조회한다.)
-------------------------------------------------------------------------------
select seq, id, categoryNum, email, address, tel, introduction, portfolio
from (select af.*, rownum as rnum from vwApprovalF af where categoryNum like '%카테고리명(시공/청소)%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
-------------------------------------------------------------------------------
-- 업체 견적서 작성(업체가 견적서를 작성한다.)
-------------------------------------------------------------------------------
create or replace procedure procAddEstimate1th(
    paseq number, -- 승인 업체 번호
    prseq number, -- 고객 요청서 번호
    pcost number, -- 예상 비용
    pcontent varchar2 -- 견적서 내용
)
is
begin
    -- 업체 견적서 테이블에 추가
    insert into tblEstimate1th 
        values (seqEstimate1th.nextVal, default, paseq, prseq, pcost, pcontent, 0);
    commit;
exception
    when others then
        rollback;
end procAddEstimate1th;
-------------------------------------------------------------------------------    
-- 특정 업체 견적서 조회(업체가 자기가 보낸 견적서 내역을 확인할 수 있다. 승인업체번호 필요)
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
-- 업체가 보낸 견적서를 고객이 조회(회원이 업체가 나에게 보낸 견적서를 조회한다. 최근에 받은 견적서 순)
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
-- 고객 요청서 작성(회원이 요청서를 작성한다.)
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
    -- 고객 요청서 테이블에 추가
    insert into tblRequest 
        values (seqRequest.nextVal, default, paddress, pshape, pdesiredDay, pdetail, parea, (select seq from tblService where stype = pstype), pseq);
    commit;
exception
    when others then
        rollback;
end procAddRequest;
-------------------------------------------------------------------------------
-- 1:1 온라인 상담 내역 조회(특정 견적서 하나에 대해 나눈 상담 전체 내용을 확인한다. 업체견적서번호 필요)
-------------------------------------------------------------------------------
select 
    decode(whoFlag, 1, '업체', 0, '회원') as whoFlag, -- 작성자
    chatContent, -- 글 내용
    to_char(timeSent, 'hh24:mi') as timeSent -- 발송 시간
from tblChatAsk
    where estimate1thSeq = 업체견적서번호;    
    
--select 
--    decode(whoFlag, 1, '업체', 0, '회원') as whoFlag, -- 작성자
--    chatContent, -- 글 내용
--    to_char(timeSent, 'hh24:mi') as timeSent -- 발송 시간
--from tblChatAsk
--    where estimate1thSeq = 1;    
-------------------------------------------------------------------------------
-- 전체 고객 요청서 목록 조회를 위한 뷰
-------------------------------------------------------------------------------
create or replace view vwRequest
as
select
    m.seq as mseq, -- 회원 번호
    m.email as email, -- 회원 이메일(id)
    r.seq as rseq, -- 고객 요청서 번호
    s.stype as stype, -- 서비스 품목
    r.address as address, -- 주소지
    r.shape as shape, -- 가옥 구조
    r.desiredDay as desiredDay, -- 서비스 시작일
    r.detail as detail, -- 상세 전달사항
    r.area as area, -- 면적
    r.regDate as regDate -- 작성일
from tblMember m
    inner join tblRequest r
        on m.seq = r.memberSeq
            inner join tblService s
                on s.seq = r.serviceSeq
                    where m.delFlag = 0
                        order by r.regDate desc;
-------------------------------------------------------------------------------
-- 고객 요청서 전체 목록 조회(업체가 요청서 전체롤 조회한다. 최신글 순)
-------------------------------------------------------------------------------
select mseq, email, rseq, stype, address, shape, desiredDay, detail, area, regDate
from (select rownum as rnum, vr.* from vwRequest vr)
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;

--select mseq, email, rseq, stype, address, shape, desiredDay, detail, area, regDate
--from (select rownum as rnum, vr.* from vwRequest vr)
--    where rnum between 10*(1-1)+1 and 1*10;
-------------------------------------------------------------------------------
-- 업체 견적서를 바탕으로 한 회원과 업체 관련 뷰
-------------------------------------------------------------------------------
create or replace view vwEstimate1th
as
select
    af.seq as aseq, -- 승인 업체 번호
    f.id as id, -- 업체 아이디(업체명)
    m.seq as mseq, -- 회원 번호
    r.seq as rseq, -- 고객 요청서 번호
    e1.seq as eseq, -- 업체 견적서 번호
    e1.adoptFlag as adoptFlag -- 견적서 채택 여부
from tblEstimate1th e1
    inner join tblApprovalF af
        on e1.approvalFSeq = af.seq
            inner join tblFirm f
                on f.seq = af.firmSeq
                    inner join tblRequest r
                        on r.seq = e1.requestSeq
                            inner join tblMember m
                                on m.seq = r.memberSeq
                                    where f.delFlag = 0 and m.delFlag = 0
                                        order by e1.regDate desc;

select * from vwEstimate1th;
-------------------------------------------------------------------------------
-- 1:1 온라인 상담 내역 조회(회원은 어떤 업체들과 상담했는지 업체명을 목록으로 확인한다. 회원번호 필요)
-------------------------------------------------------------------------------
select
    distinct ve.id as id -- 업체 아이디(업체명)
from vwEstimate1th ve
    inner join tblChatAsk ca
        on ve.eseq = ca.estimate1thSeq
            where ve.mseq = 회원번호;
            
--select
--    distinct ve.id as id -- 업체 아이디(업체명)
--from vwEstimate1th ve
--    inner join tblChatAsk ca
--        on ve.eseq = ca.estimate1thSeq
--            where ve.mseq = 1;
-------------------------------------------------------------------------------
-- 1:1 온라인 상담(회원이 업체에게 메시지 작성하면 db에 저장된다. 업체견적서번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procMemberChatAsk(
    peseq number, -- 업체 견적서 번호
    pchatContent varchar2 -- 글 내용    
)
is
begin
    -- 1:1 온라인 상담 테이블에 추가
    insert into tblChatAsk values (seqChatAsk.nextVal, default, peseq, pchatContent, 0);
    commit;
exception
    when others then
        rollback;
end procMemberChatAsk;
-------------------------------------------------------------------------------
-- 1:1 온라인 상담(업체가 회원에게 메시지 작성하면 db에 저장된다. 업체견적서번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procFirmChatAsk(
    peseq number, -- 업체 견적서 번호
    pchatContent varchar2 -- 글 내용    
)
is
begin
    -- 1:1 온라인 상담 테이블에 추가
    insert into tblChatAsk values (seqChatAsk.nextVal, default, peseq, pchatContent, 1);
    commit;
exception
    when others then
        rollback;
end procFirmChatAsk;
-------------------------------------------------------------------------------
-- 일정 등록(업체가 일정 등록 시 해당 업체견적서 테이블의 채택 여부가 1로 수정된다. 업체견적서번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddPlan(
    peseq number, -- 업체 견적서 번호
    ppState varchar2, -- 일정 진행 상태(예정, 진행, 완료)
    pserviceDate date, -- 서비스 제공일
    pestimateURL varchar2 -- 견적서 사본(jpg)
)
is
begin
    -- 업체 견적서 테이블의 채택 여부 수정
    update tblEstimate1th set adoptFlag = 1 where seq = peseq;
    
    -- 일정 등록 테이블에 추가
    insert into tblPlan 
        values (seqPlan.nextVal, pserviceDate, pestimateURL, (select seq from tblProgress where pState = ppState), peseq);
    commit;
exception
    when others then
        rollback;
end procAddPlan;

--begin
--    procAddPlan(4, '예정', to_date('2021/02/10', 'yyyy/mm/dd'), 'estimate0001.jpg');
--end;
-------------------------------------------------------------------------------
-- 일정 등록 테이블의 진행 상태 수정(숫자가 아닌 문자(예정/진행/완료)로 수정한다. 숫자가 편하면 서브쿼리를 수정)
-------------------------------------------------------------------------------
update tblPlan set progressSeq = (select seq from tblProgress where pState = '진행상태(예정/진행/완료)')
    where seq = 일정등록번호;

--update tblPlan set progressSeq = (select seq from tblProgress where pState = '예정')
--    where seq = 21;
-------------------------------------------------------------------------------
-- 서비스 완료 등록(업체가 완료 등록을 하면 일정등록 테이블의 진행 상태가 완료로 수정된다. 업체견적서번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddCompletion(
    peseq number, -- 업체 견적서 번호
    pcharge number, -- 금액
    preceiptURL varchar2 -- 영수증 사본(jpg)
)
is
begin
    -- 서비스 완료 테이블에 추가
    insert into tblCompletion
        values (seqCompletion.nextVal, peseq, pcharge, preceiptURL);
    
    -- 일정 등록 테이블의 일정 진행 상태를 완료로 수정
    update tblPlan set progressSeq = 3 where estimate1thSeq = peseq;
    commit;
exception
    when others then
        rollback;
end procAddCompletion;

--begin
--    procAddCompletion(4, 1000000, 'aaa.jpg');
--end;
-------------------------------------------------------------------------------
-- 후기 작성(둘 중 하나 사용)
-------------------------------------------------------------------------------
-- 1. 회원이 이용했던 업체는 또 이용할 수 없을 때 (회원번호, 승인업체번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddServiceReview(
    pmseq number, -- 회원 번호
    paseq number, -- 승인 업체 번호
    previewContent varchar2, -- 후기 내용
    pcontentURL varchar2 -- 후기 사진
)
is
    vseq number; -- 서비스 완료 번호를 저장할 변수
begin
    -- 회원 번호와 승인 업체 번호를 받아 서비스 완료 번호를 알아내 저장한다.
    select seq into vseq 
    from tblCompletion 
    where estimate1thSeq = (select eseq from vwEstimate1th where aseq = paseq and mseq = pmseq);
    
    -- 후기 테이블에 추가
    insert into tblServiceReview
        values (seqServiceReview.nextVal, vseq, default, previewContent, pcontentURL, 0, pmseq);
    commit;
exception
    when others then
        rollback;
end procAddServiceReview;

--begin
--    procAddServiceReview(1, 6, '사장님이 잘해주셨습니다', 'review0001.jpg'); -- 회원번호, 승인업체번호, 후기내용, 후기사진
--end;
-------------------------------------------------------------------------------
-- 2. 회원이 이용했던 업체를 또 이용할 수 있을 때 (회원번호, 서비스완료번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddServiceReview(
    pmseq number, -- 회원 번호
    pcseq number, -- 서비스 완료 번호
    previewContent varchar2, -- 후기 내용
    pcontentURL varchar2 -- 후기 사진
)
is
begin
    -- 후기 테이블에 추가
    insert into tblServiceReview
        values (seqServiceReview.nextVal, pcseq, default, previewContent, pcontentURL, 0, pmseq);
    commit;
exception
    when others then
        rollback;
end procAddServiceReview;

--begin
--    procAddServiceReview(1, 1, '만족합니다. 사장님이 친절합니다.', 'review0002.jpg'); -- 회원번호, 서비스완료번호, 후기내용, 후기사진
--end;

-- 회원번호1, 승인업체번호6, 서비스완료번호1, 견적서번호1
-------------------------------------------------------------------------------
-- 견적 상담(업체견적서번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddEstimate(
    peseq number, -- 업체 견적서 번호
    pcType varchar2, -- 견적 상담 형태(방문/전화/진행무산)
    pestimateDay date -- 견적 상담 일자
)
is
begin
    -- 견적 상담 테이블에 추가
    insert into tblEstimate
        values (seqEstimate.nextVal, peseq, (select seq from tblConsultation where cType = pcType), pestimateDay);
    commit;
exception
    when others then
        rollback;
end procAddEstimate;

--begin
--     procAddEstimate(1, '전화', sysdate);
--end;