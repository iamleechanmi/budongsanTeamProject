-- 작성자 : 이찬미
-- [회원] 자유게시판 DML
-------------------------------------------------------------------------------
-- 자유게시판에 조회수 컬럼 추가
alter table tblFree
    add (readCount number default 0 not null);
    select * from tblmember;
-------------------------------------------------------------------------------
-- 자유게시판 조회를 위한 뷰
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
    fr.regDate as regDate,
    fr.readCount as readCount, -- 조회수
    (sysdate - fr.regdate) * 24 as gap, -- 시간 차
    (select count(*) from tblFreeComment where freeSeq = fr.seq and delflag = 0) as ccount -- 댓글 수
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
-------------------------------------------------------------------------------
create or replace procedure procListFree(
    ppage number, -- 페이지수
    psearch varchar2, -- 검색어
    pcursor out sys_refcursor
)
is
begin

    if psearch is null then 
        open pcursor for select
                            seq, -- 번호
                            subject, -- 글제목
                            authorName, -- 작성자
                            to_char(regDate, 'yy/mm/dd') as regDate, -- 작성일
                            readcount, -- 조회수
                            gap, -- 시간 차
                            ccount, -- 댓글 수
                            zerobonem -- 중개사/회원 구분
                        from (select rownum as rnum, f.* from vwFree f)
                            where rnum between 10*(fnFreeMaxPage(ppage)-1)+1 and fnFreeMaxPage(ppage)*10;
                            
    elsif psearch is not null then
        open pcursor for select
                            seq, -- 번호
                            subject, -- 글제목
                            authorName, -- 작성자
                            to_char(regDate, 'yy/mm/dd') as regDate, -- 작성일
                            readcount, -- 조회수
                            gap, -- 시간 차
                            ccount, -- 댓글 수
                            zerobonem
                        from (select rownum as rnum, f.* from vwFree f)
                            where rnum between 10*(fnFreeMaxPage(ppage)-1)+1 and fnFreeMaxPage(ppage)*10
                            and subject like '%'||psearch||'%' or authorName like '%'||psearch||'%';
    end if;
end procListFree;


declare
    vcursor sys_refcursor;
    vseq vwFree.seq%type;
    vsubject vwFree.subject%type;
    vauthorName vwFree.authorName%type;
    vregDate varchar2(10);
    vreadcount vwFree.readcount%type;
begin
    procListFree(1, '', vcursor);
    loop
        fetch vcursor into vseq, vsubject, vauthorName, vregDate, vreadcount;
        exit when vcursor%notfound;
        DBMS_OUTPUT.PUT_LINE(vseq||' '||vsubject||' '||vauthorName||' '||vregDate ||' ' ||vreadcount);
        end loop;
end;
-------------------------------------------------------------------------------
-- 자유게시판 글 작성(회원/중개사 작성)
-------------------------------------------------------------------------------
drop procedure procAddFreeMember;
create or replace procedure procAddFree(
    pzerobonem number, -- 중개사 0 /회원 1 구분 번호
    pseq number, -- 중개사/ 회원 번호
    psubject varchar2, -- 제목
    pdetail varchar2 -- 내용
)
is
begin 
    -- 중개사일 경우
    if pzerobonem = 0 then
        -- 자유게시판 테이블에 추가
        insert into tblFree
            values (seqFree.nextVal, psubject, pdetail, sysdate, 0, default);
        
        -- 작성한자유_중개사 테이블에 추가
        insert into tblFreeBroker
            values (seqFreeBroker.nextVal, seqFree.currVal, pseq);
    
    -- 회원일 경우
    elsif pzerobonem = 1 then
        -- 자유게시판 테이블에 추가
        insert into tblFree
            values (seqFree.nextVal, psubject, pdetail, sysdate, 0, default);
        
        -- 작성한자유_회원 테이블에 추가
        insert into tblFreeMember
            values (seqFreeMember.nextVal, seqFree.currVal, pseq);
    end if;
    commit;
exception
    when others then
        rollback;
end procAddFree;

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
-- 자유게시판 댓글 작성(회원/중개사 작성)
-------------------------------------------------------------------------------
create or replace procedure procAddComment(
    pzerobonem number, -- 중개사 0 /회원 1 구분 번호
    pseq number, -- 중개사/ 회원 번호
    pfreeSeq number, -- 자유게시판글 번호
    pdetail varchar2 -- 내용
)
is
begin
    -- 중개사일 경우
    if pzerobonem = 0 then
        -- 자유게시판 댓글 테이블에 추가
        insert into tblFreeComment
            values (seqFreeComment.nextVal, pdetail, sysdate, pfreeSeq, 0);
        
        -- 작성한댓글_중개사 테이블에 추가
        insert into tblCommentBroker
            values (seqCommentBroker.nextVal, seqFreeComment.currVal, pseq);

    -- 회원일 경우
    elsif pzerobonem = 1 then
        -- 자유게시판 댓글 테이블에 추가
        insert into tblFreeComment
            values (seqFreeComment.nextVal, pdetail, sysdate, pfreeSeq, 0);
        
        -- 작성한댓글_회원 테이블에 추가
        insert into tblCommentMember
            values (seqCommentMember.nextVal, seqFreeComment.currVal, pseq);
    end if;
    commit;
exception
    when others then
        rollback;
end procAddComment;

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
--[자유게시판 댓글 조회 뷰]
-------------------------------------------------------------------------------
create or replace view vwFreeComment
as
select
    fcm.seq as seq, /* 자유글 댓글 번호 */
    fr.seq as frSeq, /* 자유글 번호 */
    case
        when cmb.seq is not null then 0
        when cmb.seq is null then 1
    end as zeroBoneM, /* 중개사가 쓴 글이면 0, 회원이 쓴 글이면 1을 반환합니다. */
    case
        when cmb.seq is not null then brk.seq
        when cmb.seq is null then m.seq
    end as authorSeq, /* 작성자의 기본키(시퀀스), 중개사 시퀀스 따로, 회원 시퀀스 따로라 같은 값이 나올 수 있습니다.(zeroBoneM을 활용) */
    case
        when cmb.seq <> 0 then brk.businessName
        when cmb.seq is null then m.name
    end as authorName, /* 작성자의 이름 */
    fcm.detail as detail,
    fcm.regDate as regDate,
    (sysdate- fcm.regDate) * 24 as gap
from tblFreeComment fcm
    inner join tblFree fr
        on fr.seq = fcm.freeSeq
            left outer join tblCommentBroker cmb
                on fcm.seq = cmb.freeCommentSeq
                    left outer join tblApproBroker abk
                        on abk.seq = cmb.approBrokerSeq
                            left outer join tblBroker brk
                                on brk.seq = abk.BrokerSeq
                                    left outer join tblCommentMember cmm
                                        on fcm.seq = cmm.freeCommentSeq
                                            left outer join tblMember m
                                                on m.seq = cmm.memberSeq
where fcm.delFlag <> 1 and (brk.delFlag <> 1 or m.delFlag <> 1)
order by regDate desc;

select * from vwFreecomment;
-------------------------------------------------------------------------------
-- 회원이 자기가 쓴 게시글을 조회할 수 있는 셀렉트문(문의게시판 + 자유게시판 포함)
-- 어떤 게시판인지, 제목, 내용, 작성일, 조회수
-------------------------------------------------------------------------------
-- rnum 의 위치를 조절하면 페이징이 된다. 회원 번호가 필요하며 zerobonem의 경우 회원은 1이지만 회원만 마이 페이지에 접근 가능하므로 넣어두고 사용한다.
select rnum, seq, authorseq, subject, detail, ccount, to_char(regdate, 'yy/mm/dd hh24:mi') as regdate, readcount, gap, zerobonem, which from (
    select u.*, rownum as rnum from (
        select seq, authorseq, subject, detail, ccount, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree
        union
        select seq, authorseq, subject, detail, ccount, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry
        where authorseq = 1 and zerobonem = 1
        order by regdate desc) u
    where authorseq = 1 and zerobonem = 1
    order by regdate desc)
where rnum between 1 and 10;
-------------------------------------------------------------------------------

select * from (
    select u.* from (
    select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree
    union all
    select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry) u
    order by regdate desc);
to_char(regDate, 'yy/mm/dd') as regDate
select seq, authorseq, subject, detail, to_char(regDate, 'yy/mm/dd hh24:mi') as regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree;
-------------------------------------------------------------------------------
-- 내가 쓴 글 총 페이지 수 
-------------------------------------------------------------------------------
select ceil((
    select count(*) as total from (
        select * from (
        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree
        union
        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry)
        order by regdate desc)
    where authorseq = 1 and zerobonem = 1
    ) / 5) as total from dual;
-------------------------------------------------------------------------------
-- 내가 쓴 글 총 개수 
-------------------------------------------------------------------------------
select count(*) as total from (
    select * from (
    select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree
    union
    select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry)
    order by regdate desc)
where authorseq = 회원번호 and zerobonem = 접근번호;
-------------------------------------------------------------------------------
-- 회원이 자기가 쓴 댓글을 조회(자유/문의게시판 포함)
-------------------------------------------------------------------------------
select seq, frseq, authorseq, zerobonem, (select subject from tblFree where seq = vwFreeComment.frseq) as subject, detail, regdate, gap 
from vwFreeComment where authorseq = 1 and zerobonem = 1;
-------------------------------------------------------------------------------
-- 내가 쓴 댓글 총 개수
-------------------------------------------------------------------------------
select count(*) as total from vwFreeComment where authorseq = 1 and zerobonem = 1;
select ceil((
    select count(*) as total from (
        select * from (
        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree
        union
        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry)
        order by regdate desc)
    where authorseq = 1 and zerobonem = 1
    ) / 5) as total from dual;
    
    select ceil(count(*) / 5) as total from vwFreeComment where authorseq = 1 and zerobonem = 1;
-------------------------------------------------------------------------------
update tblMember set email = 'yeseul', pw = '123' where seq = 4;
commit;
select * from tblmember;
select * from tblhousepost where approbrokerseq = 2;
update tblhousepost set subject = '[대박]국기원 근처 역삼동 원룸 월세 너무 싸다!' where seq = 66;