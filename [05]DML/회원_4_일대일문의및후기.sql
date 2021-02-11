-- 작성자 : 이찬미
-- [회원] 1:1문의, 후기 DML
-------------------------------------------------------------------------------
-- 1:1문의내역 총 페이지수 계산하는 함수
-- where memberSeq로 수정하기
-------------------------------------------------------------------------------
create or replace function fnChatMemberMaxPage(
    pseq number, -- 회원 번호를 받는다.
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 자기가 쓴 문의글의 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from tblChatList where memeberSeq = pseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 1:1문의 관련 뷰
-------------------------------------------------------------------------------
create or replace view vwChatMember
as
select
    c.seq as seq, -- 1:1 문의 번호
    ab.seq as abseq, -- 승인중개사 번호
    m.seq as mseq, -- 회원 번호
    b.businessName as bname, -- 사업자상호
    c.subject as subject, -- 제목
    c.content as content, -- 내용
    cl.regDate as regDate, -- 문의일
    to_char(c.regDate, 'hh24:mi') as regTime -- 문의 시각
    from tblChatList cl 
        inner join tblChat c 
            on cl.seq = c.chatListSeq
                inner join tblApproBroker ab
                    on ab.seq = cl.approBrokerSeq
                        inner join tblBroker b
                            on b.seq = ab.brokerSeq
                                inner join tblMember m
                                    on m.seq = cl.memeberSeq
                                        where m.delFlag = 0 and b.delFlag = 0
                                            order by cl.regDate desc;
                                            
select * from vwChatMember;
-------------------------------------------------------------------------------
-- 1:1문의내역 목록 조회(최대 10개의 회원 본인이 작성한 글만 조회한다. 최신글 순, 회원번호, 페이지수 필요)
-- 문의내역 목록에는 [번호, 사업자상호(회원이 문의한 대상), 제목, 문의일]이 출력된다.
-- tblChatList의 memberSeq 스펠링 수정
-- on m.seq = cl.memeberSeq; -> on m.seq = cl.memberSeq;
-------------------------------------------------------------------------------
create or replace procedure procListChatMember(
    pmseq number, -- 회원 번호
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 1:1문의 번호
                        bname, -- 사업자상호
                        subject, -- 제목
                        regDate -- 문의일
                    from (select rownum as rnum, cm.* from vwChatMember cm where cm.mseq = pmseq)
                        where rnum between 10*(fnChatMemberMaxPage(pmseq, ppage)-1)+1 and fnChatMemberMaxPage(pmseq, ppage)*10;
end procListChatMember;

declare
    vcursor sys_refcursor;
    vseq vwChatMember.seq%type;
    vbname vwChatMember.bname%type;
    vsubject vwChatMember.subject%type;
    vregDate vwChatMember.regDate%type;
begin
    procListChatMember(4, 1, vcursor);
    loop
        fetch vcursor into vseq, vbname, vsubject, vregDate;
        exit when vcursor%notfound;
        DBMS_OUTPUT.PUT_LINE(vseq||' '||vbname||' '||vsubject||' '||vregDate);
        end loop;
end;
-------------------------------------------------------------------------------
-- 특정 1:1문의내역 보기(회원번호, 1:1문의번호 필요)
-------------------------------------------------------------------------------
select
    seq, -- 1:1문의 번호
    bname, -- 사업자상호
    subject, -- 제목
    content, -- 내용
    regDate, -- 문의일
    regTime -- 문의 시각
from vwChatMember
    where mseq = 회원번호 and seq = 1:1문의번호;
-------------------------------------------------------------------------------
-- 1:1문의하기(회원번호, 승인중개사번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddChatMember(
    pmseq number, -- 회원 번호
    pabseq number, -- 승인중개사 번호
    psubject varchar2, -- 제목
    pcontent varchar2 -- 내용
)
is
begin
    -- 1:1문의내역 테이블에 추가
    insert into tblChatList
        values (seqChatList.nextVal, sysdate, pmseq, pabseq);
        
    -- 1:1문의 테이블에 추가
    insert into tblChat
        values (seqChat.nextVal, psubject, pcontent, sysdate, seqChatList.currVal);
    commit;
exception
    when others then
        rollback;
end procAddChatMember;

--begin
--    procAddChatMember(1, 1, '전화 상담 받고 싶어요', '연락주세요');
--end;
-------------------------------------------------------------------------------
-- 후기/평점 관련 뷰
-------------------------------------------------------------------------------
create or replace view vwBrokerReview
as
select
    br.seq as seq, -- 후기 번호
    ab.seq as abseq, -- 승인중개사 번호
    m.seq as mseq, -- 회원 번호
    b.businessName as bname, -- 사업자상호
    decode(br.star, 1, '★☆☆☆☆', 2, '★★☆☆☆', 3, '★★★☆☆', 4, '★★★★☆', 5, '★★★★★') as star, -- 평점
    br.content as content, -- 후기 내용
    br.imgURL as imgURL, -- 계약서 이미지 경로
    br.regDate as regDate -- 날짜
from tblBrokerReview br
    inner join tblApproBroker ab
        on ab.seq = br.approBrokerSeq
            inner join tblBroker b
                on b.seq = ab.brokerSeq
                    inner join tblMember m
                        on m.seq = br.memberSeq
                            where m.delFlag = 0 and br.delFlag = 0 and b.delFlag = 0
                                order by br.regDate desc;

select * from vwBrokerReview;
-------------------------------------------------------------------------------
-- 내가 남긴 후기/평점 목록 보기(회원번호 필요)
-------------------------------------------------------------------------------
select
    seq, -- 후기 번호
    bname, -- 사업자상호
    content, -- 후기 내용
    star, -- 평점
    regDate -- 날짜
from vwBrokerReview
    where mseq = 회원번호;
-------------------------------------------------------------------------------
-- 후기/평점 상세 보기(후기번호 필요)
-------------------------------------------------------------------------------
select
    seq, -- 후기 번호
    bname, -- 사업자상호
    content, -- 후기 내용
    star, -- 평점
    imgURL, -- 계약서 이미지 경로
    regDate -- 날짜
from vwBrokerReview
    where seq = 후기번호;
-------------------------------------------------------------------------------
-- 후기/평점 작성하기(회원번호, 승인중개사번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddBrokerReview(
    pmseq number, -- 회원 번호
    pabseq number, -- 승인중개사 번호
    pcontent varchar2, -- 후기 내용
    pstar number, -- 평점
    pimgURL varchar2 -- 계약서 이미지 경로
)
is
begin
    -- 후기/평점 테이블에 추가
    insert into tblBrokerReview
        values (seqBrokerReview.nextVal, sysdate, pcontent, pstar, pimgURL, pmseq, pabseq, 0);
    commit;
exception
    when others then
        rollback;
end procAddBrokerReview;

--begin
--    procAddBrokerReview(2, 1, '좋은 방 좋은 가격에 구했네요', 5, 'img0001.jpg');
--end;
--select * from vwBrokerReview;