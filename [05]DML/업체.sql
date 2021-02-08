-- 업체.sql

-- 회원 가입
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

-- 아이디 찾기 
select email from tblFirm where id = '업체명' and tel = '연락처';

-- 비밀번호 찾기
select pw from tblFirm where email = '이메일' and tel = '연락처';

-- 승인 업체 관련 뷰
create or replace view vwApprovalF
as
select
    f.seq as seq, -- 업체 번호
    af.seq as aseq, -- 승인 업체 번호
    c.categoryNum as category, -- 업체 카테고리
    f.address as address, -- 업체 주소
    f.tel as tel, -- 업체 연락처
    f.introduction as introduction, -- 업체 소개글
    f.portfolio as portfolio, -- 업체 포트폴리오
    f.availablePoint as availablePoint, -- 보유 포인트
    ul.seq as ulSeq, -- 포인트 사용 기록 번호
    ul.useAmount as useAmount, -- 포인트 사용액
    pl.seq as plSeq, -- 포인트 결제 기록 번호
    pl.payment as payment, -- 포인트 결제액
    af.approvalDate as approvalDate -- 승인 업체 승인 일자
from tblFirm f
    inner join tblCategory c
        on c.seq = f.categorySeq
            inner join tblApprovalF af
                on f.seq = af.firmSeq
                    inner join tblUsageLog ul
                        on af.seq = ul.approvalFSeq
                            inner join tblPaymentLog pl
                                on af.seq = pl.approvalFseq
                                    where f.delFlag = 0
                                        order by af.seq asc;
                                        
select * from vwApprovalF;

-- 포인트 충전
-- 결제와 사용 로그 테이블은 있는데 결제 받는 곳이 어디인지 보고 작성

-- 업체 견적서 관련 뷰
create or replace view vwEstimate1th
as
select 
    f.seq as seq, -- 업체 번호
    af.seq as aseq, -- 승인 업체 번호
    e1.seq as eseq, -- 업체 견적서 번호
    r.seq as rseq, -- 고객 요청서 번호
    m.seq as mseq, -- 고객(회원) 번호
    s.stype as type, -- 서비스 품목(청소/시공)
    r.address as address, -- 주소지
    r.shape as shape, -- 가옥 구조
    r.desiredDay as desiredDay, -- 서비스 시작일
    r.detail as detail, -- 상세 전달사항
    r.area as area, -- 면적
    r.regDate as rregDate, -- 고객요청서 작성일
    e1.estimatedCost as estimatedCost, -- 예상 비용
    e1.econtent as econtent, -- 견적서 내용
    e1.adoptFlag as adoptFlag, -- 채택 여부
    e1.regDate as eregDate -- 업체 견적서 작성일
from tblEstimate1th e1
    inner join tblApprovalF af
        on e1.approvalFSeq = af.seq
            inner join tblFirm f
                on f.seq = af.firmSeq
                    inner join tblRequest r
                        on r.seq = e1.requestSeq
                            inner join tblService s
                                on s.seq = r.serviceSeq
                                    inner join tblMember m
                                        on m.seq = r.memberSeq
                                            where m.delFlag = 0 and f.delFlag = 0
                                                order by e1.seq;

select * from vwestimate1th;
    
    


select * from tblApprovalF;
select * from tblFirm;

select * from tblCategory;

select * from tblUsageLog;

select * from tblPaymentLog;

-- drop
drop view vwApprovalF;
drop view vwEstimate1th;