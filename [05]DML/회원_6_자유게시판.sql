-- 작성자 : 이찬미
-- [회원] 자유게시판 DML
-------------------------------------------------------------------------------
-- 청강님 view vwFree를 먼저 생성해야 합니다.
-------------------------------------------------------------------------------
create or replace view vwFree
as
select
    fr.seq as seq, /* 자유글 번호 */
    case
        when frb.seq is not null then 0
        when frb.seq is null then 1
    end as zeroBoneM, /* 중개사가 쓴 글이면 0, 회원이 쓴 글이면 1을 반환합니다. */
    case
        when frb.seq is not null then brk.seq
        when frb.seq is null then m.seq
    end as authorSeq, /* 작성자의 기본키(시퀀스), 중개사 시퀀스 따로, 회원 시퀀스 따로라 같은 값이 나올 수 있습니다.(zeroBoneM을 활용) */
    case
        when frb.seq <> 0 then brk.businessName
        when frb.seq is null then m.name
    end as authorName, /* 작성자의 이름 */
    fr.subject as subject,
    fr.detail as detail,
    fr.regDate as regDate
from tblFree fr
    left outer join tblFreeBroker frb
        on fr.seq = frb.freeSeq
            left outer join tblApproBroker abk
                on abk.seq = frb.approBrokerSeq
                    left outer join tblBroker brk
                        on brk.seq = abk.BrokerSeq
                            left outer join tblFreeMember frm
                                on fr.seq = frm.freeSeq
                                    left outer join tblMember m
                                        on m.seq = frm.memberSeq
where fr.delFlag <> 1 and (brk.delFlag <> 1 or m.delFlag <> 1)
order by regDate desc;
-------------------------------------------------------------------------------
-- 자유게시판 총 페이지수 계산하는 함수
-------------------------------------------------------------------------------
create or replace function fnFreeMaxPage(
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwFree) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 자유게시판 글 목록 조회(최대 10개 목록 출력된다. 최신글 순, 페이지수 필요)
-- 자유게시판 목록에는 [번호, 글제목, 작성자, 작성일]이 출력된다.
-------------------------------------------------------------------------------
create or replace procedure procListFree(
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 번호
                        subject, -- 글제목
                        authorName, -- 작성자
                        to_char(regDate, 'yy/mm/dd') as regDate -- 작성일
                    from (select rownum as rnum, f.* from vwFree f)
                        where rnum between 10*(fnFreeMaxPage(ppage)-1)+1 and fnFreeMaxPage(ppage)*10;
end procListFree;
-------------------------------------------------------------------------------
-- 자유게시판 글 작성(회원이 작성한다. 회원번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddFreeMember(
    pmseq number, -- 회원 번호
    psubject varchar2, -- 제목
    pdetail varchar2 -- 내용
)
is
begin
    -- 자유게시판 테이블에 추가
    insert into tblFree
        values (seqFree.nextVal, psubject, pdetail, sysdate, 0);
    
    -- 작성한자유_회원 테이블에 추가
    insert into tblFreeMember
        values (seqFreeMember.nextVal, seqFree.currVal, pmseq);
    commit;
exception
    when others then
        rollback;
end procAddFreeMember;

--begin
--    procAddFreeMember(1, '요즘 집값이 어마어마하네요...', '이래서 집을 살 수 있을까요?');
--end;
-------------------------------------------------------------------------------
-- 자유게시판 글 수정(자유게시판글번호 필요)
-------------------------------------------------------------------------------
update tblFree set subject = '수정할제목', detail = '수정할내용' where seq = 자유게시판글번호;
-------------------------------------------------------------------------------
-- 자유게시판 글 삭제(자유게시판글번호 필요)
-------------------------------------------------------------------------------
update tblFree set delFlag = 1 where seq = 자유게시판글번호;
-------------------------------------------------------------------------------
-- 자유게시판 댓글 작성(회원이 작성한다. 회원번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procCommentMember(
    pmseq number, -- 회원 번호
    pfreeSeq number, -- 자유게시판글 번호
    pdetail varchar2 -- 내용
)
is
begin
    -- 자유게시판 댓글 테이블에 추가
    insert into tblFreeComment
        values (seqFreeComment.nextVal, pdetail, sysdate, pfreeSeq, 0);
    
    -- 작성한댓글_회원 테이블에 추가
    insert into tblCommentMember
        values (seqCommentMember.nextVal, seqFreeComment.currVal, pmseq);
    commit;
exception
    when others then
        rollback;
end procCommentMember;

--begin
--    procCommentMember(2, 41, '맞아요 저희 동네도 엄청 올랐더라고요');
--end;
-------------------------------------------------------------------------------
-- 자유게시판 댓글 수정(자유게시판댓글번호 필요)
-------------------------------------------------------------------------------
update tblFreeComment set detail = '수정할내용' where seq = 자유게시판댓글번호;
-------------------------------------------------------------------------------
-- 자유게시판 댓글 삭제(자유게시판댓글번호 필요)
-------------------------------------------------------------------------------
update tblFreeComment set delFlag = 1 where seq = 자유게시판댓글번호;
-------------------------------------------------------------------------------
-- 특정 자유게시판 글 보는 것과 댓글 보는 것은 청강님 거 그대로 가면 될 것 같습니다.