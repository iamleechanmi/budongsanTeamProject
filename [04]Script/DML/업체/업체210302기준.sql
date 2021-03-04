--업체
-- 현재까지 구현한 기능에 대한 insert, view, procedure 
-- 오라클 sql에 바로 적용하느라 정렬x.


--1. 고객 요청서 insert문
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-02','yyyy-mm-dd'), '서울특별시 강남구 삼성동 25-12', '아파트', to_date('2021-01-05','yyyy-mm-dd'), '욕실 수리를 희망합니다.', 30, 2, 1);


--2. 내가 받은 견적서 select문
create or replace view vwEstimate1th
as
select
a.memberSeq as mseq, --회원번호
b.*,
(select tblFirm.id from tblFirm where c.firmseq = tblFirm.seq) as firmName,
(select tblFirm.portfolio from tblFirm where c.firmseq = tblFirm.seq) as portfolio
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
         inner join tblApprovalF c
            on c.seq = b.approvalfseq;

--3. 견적서 채택 및 온라인1:1상담 시작
create or replace procedure procAdopt (
    peseq number --채택하는 견적서의 번호
)
is
begin

        INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, default, peseq, '보내주신 견적서를 채택하였습니다. 1:1온라인 상담을 시작해주세요',0);
        update tblEstimate1th SET adoptFlag = 1 where seq = peseq;
        commit;

EXCEPTION 
    WHEN OTHERS THEN
    rollback; 
end;


--4. 채팅 글. 견적서 매개 변수로 쓸 view 
create or replace view vwChatLog
as
select
d.*,
(select name from tblMember where a.memberSeq = tblMember.seq) as memberName,
(select seq from tblMember where a.memberSeq = tblMember.seq) as memberSeq,
(select id from tblFirm where c.firmSeq = tblFirm.seq) as firmName,
(select seq from tblFirm where c.firmSeq = tblFirm.seq) as firmSeq,
c.seq as approvalFSeq
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
         inner join tblApprovalF c
            on c.seq = b.approvalfseq
                inner join tblChatAsk d
                    on d.estimate1thSeq = b.seq
                        where b.adoptFlag = 1; --채택받은 것만
                        --where b.seq = 46; -- 업체 견적서 번호로 조회

-- 업체기준에서 채팅내용 log 보려면 승인번호, 견적서번호를 매개변수로 받아서 출력.(위의 뷰를 활용한 select문)
select * from vwChatLog where approvalFSeq = 5 and estimate1thSeq = 46 order by timesent asc;



--5. 4번 뷰에 대한 중복값 제거한 채팅상대 조회문(업체 기준에서 고객 조회 시)

--뷰 만들고, 아래 조회문을 jdbc에서 sql문으로 쓰기
--이렇게 하면 해당 업체번호에 맞는 멤버명과 업체 이름, 견적서번호가 모두 뜬다
--채택 받은 조건을 걸어야함..
select distinct estimate1thSeq, membername, firmname from vwChatlog  where approvalFSeq = 5 order by estimate1thSeq, membername, firmname;

--6.채팅 인서트문(업체 기준)
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, default, ?, ?, ?);

--7. 일정관리 조회 시, 필요한 view (업체 기준)
create or replace view vwPlan
as
select 
(select tblFirm.id from tblFirm where tblFirm.seq = c.firmSeq) as firmName,
c.seq as approvalFSeq,
(select tblMember.name from tblMember where a.memberSeq = tblMember.seq) as memberName,
a.memberSeq as memberSeq,
(select tblProgress.pstate from tblProgress where tblProgress.seq = d.progressSeq) as progress,
d.*
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
            inner join tblApprovalF c 
                on c.seq = b.approvalFseq
                    inner join tblPlan d
                        on d.estimate1thSeq = b.seq
                            where adoptFlag = 1;       
--업체명, 업체승인번호, 고객명, 고객번호, 진행상태, 일정번호, 진행일, 견적서URL, 견적서번호       
select * from vwplan where ApprovalFseq = 1;


--업체 상세조회 시, (storeview get메서드) 코멘트 select문
create or replace view vwSumInfoReview
as
select
a.seq as approvalFseq,
(select tblFirm.id from tblFirm where tblFirm.seq = a.firmSeq) as firmName,
(select tblFirm.introduction from tblFirm where tblFirm.seq = a.firmSeq) as introduction,
(select tblFirm.email from tblFirm where tblFirm.seq = a.firmSeq) as email,
(select tblFirm.address from tblFirm where tblFirm.seq = a.firmSeq) as address,
(select tblFirm.tel from tblFirm where tblFirm.seq = a.firmSeq) as tel,
(select tblFirm.portfolio from tblFirm where tblFirm.seq = a.firmSeq) as portfolio,
d.*,
(select tblMember.name from tblMember where tblMember.seq = d.memberSeq) as memberName,
(select tblRequest.address from tblRequest where tblRequest.seq = b.requestSeq) as serviceArea
from tblApprovalF a
    inner join tblEstimate1th b
        on a.seq = b.approvalFSeq
            inner join tblCompletion c
                on c.estimate1thSeq = b.seq 
                    inner join tblServiceReview d
                        on d.completionSeq = c.seq
                            where d.delflag = 0;
                            
-- 해당 업체 정보 1줄
create or replace view vwFirmInfo
as
select 
a.seq as ApprovalFseq,
b.* 
from tblApprovalF a
    inner join tblFirm b
        on a.firmseq = b.seq
            where b.delflag = 0;


-- 요청서 목록 출력 시, 필요한 view
create or replace view vwRequest
as
select
    r.approvalFSeq as approvalFSeq, 
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


-- 일정등록된 목록
create or replace view vwRegistredList
as
select
b.*,
(select name from tblMember where a.memberSeq = tblMember.seq) as memberName,
(select seq from tblMember where a.memberSeq = tblMember.seq) as memberSeq,
(select id from tblFirm where c.firmSeq = tblFirm.seq) as firmName,
(select seq from tblFirm where c.firmSeq = tblFirm.seq) as firmSeq
--c.seq as approvalFSeq
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
         inner join tblApprovalF c
            on c.seq = b.approvalfseq
                inner join tblPlan d
                    on d.estimate1thSeq = b.seq
                        where b.adoptFlag = 1;
                        --where b.seq = 46; -- 업체 견적서 번호로 조회

--일정이 등록된 목록 & 등록되지 않은 목록 합집합
create or replace view vwPossibleList
as
select
b.*,
(select name from tblMember where a.memberSeq = tblMember.seq) as memberName,
(select seq from tblMember where a.memberSeq = tblMember.seq) as memberSeq,
(select id from tblFirm where c.firmSeq = tblFirm.seq) as firmName,
(select seq from tblFirm where c.firmSeq = tblFirm.seq) as firmSeq
--c.seq as approvalFSeq
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
         inner join tblApprovalF c
            on c.seq = b.approvalfseq
                        where b.adoptFlag = 1;
                        
--여집합 구하기
select * from vwPossibleList where approvalFSeq = 5 MINUS select * from vwRegistredList where approvalFSeq = 5;


-- 완료된 목록 구하기
-- 완료 정보 입력되지 않은 여집합 구하기
create or replace view vwCompletionList
as
select
b.approvalFSeq as approvalFSeq,
--d.*,
(select name from tblMember where a.memberSeq = tblMember.seq) as memberName,
(select seq from tblMember where a.memberSeq = tblMember.seq) as memberSeq,
(select id from tblFirm where c.firmSeq = tblFirm.seq) as firmName,
(select seq from tblFirm where c.firmSeq = tblFirm.seq) as firmSeq
--c.seq as approvalFSeq
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
         inner join tblApprovalF c
            on c.seq = b.approvalfseq
                inner join tblCompletion d
                    on d.estimate1thSeq = b.seq
                        where b.adoptFlag = 1;
                        --where b.seq = 46; -- 업체 견적서 번호로 조회
select * from vwCompletionList;

create or replace view vwCompletableList
as
select
b.approvalFseq,
(select name from tblMember where a.memberSeq = tblMember.seq) as memberName,
(select seq from tblMember where a.memberSeq = tblMember.seq) as memberSeq,
(select id from tblFirm where c.firmSeq = tblFirm.seq) as firmName,
(select seq from tblFirm where c.firmSeq = tblFirm.seq) as firmSeq
--c.seq as approvalFSeq
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
         inner join tblApprovalF c
            on c.seq = b.approvalfseq
                        where b.adoptFlag = 1;


select * from vwCompletableList where approvalFSeq = 5 MINUS select * from vwCompletionList where approvalFSeq = 5;


--후기 조회
create or replace view vwServiceReview
as
select
a.approvalFSeq as approvalFSeq,
(select tblMember.name from tblMember where tblmember.seq = c.seq) as memberName,
(select tblRequest.address from tblRequest where tblRequest.seq = a.seq) as address,
(select tblFirm.id from tblFirm where tblFirm.seq = d.firmSeq) as firmName,
c.*
from 
tblEstimate1th a
    inner join tblCompletion b
        on a.seq = b.estimate1thseq
            inner join tblServiceReview c
                on c.completionseq = b.seq
                    inner join tblApprovalF d
                        on d.seq = a.approvalFSeq
                            where c.delflag = 0;


-- 로그인한 회원이 후기 작성을 위해 서비스 완료받은 업체 리스트 조회하기
create or replace view vwMembersCompletion
as
select
d.seq as CompletionSeq,
b.approvalFSeq as approvalFSeq,
--d.*,
(select name from tblMember where a.memberSeq = tblMember.seq) as memberName,
(select seq from tblMember where a.memberSeq = tblMember.seq) as memberSeq,
(select id from tblFirm where c.firmSeq = tblFirm.seq) as firmName,
(select seq from tblFirm where c.firmSeq = tblFirm.seq) as firmSeq
--c.seq as approvalFSeq
from tblRequest a
    inner join tblEstimate1th b
        on a.seq = b.requestSeq
         inner join tblApprovalF c
            on c.seq = b.approvalfseq
                inner join tblCompletion d
                    on d.estimate1thSeq = b.seq
                        where b.adoptFlag = 1;
commit;