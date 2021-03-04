-- 작성자 : 이찬미
-- [회원] 문의게시판 DML
-------------------------------------------------------------------------------
-- *******************************************수정
-- 문의게시판에 조회수 컬럼 추가
alter table tblInquiry
    add (readCount number default 0 not null);
-------------------------------------------------------------------------------
-- *******************************************수정
-- 청강님 view vwInquiry를 먼저 생성해야 합니다.
-------------------------------------------------------------------------------
create or replace view vwInquiry
as
select
    iqr.seq as seq, /* 문의게시글 번호 */
    case
        when iqb.seq is not null then 0
        when iqb.seq is null then 1
    end as zeroBoneM, /* 중개사가 쓴 글이면 0, 회원이 쓴 글이면 1을 반환합니다. */
    case
        when iqb.seq is not null then brk.seq
        when iqb.seq is null then m.seq
    end as authorSeq, /* 작성자의 기본키(시퀀스), 중개사 시퀀스 따로, 회원 시퀀스 따로라 같은 값이 나올 수 있습니다.(zeroBoneM을 활용) */
    case
        when iqb.seq <> 0 then brk.businessName
        when iqb.seq is null then m.name
    end as authorName, /* 작성자의 이름 */
    iqr.subject as subject,
    iqr.detail as detail,
    iqr.regDate as regDate,
    iqr.openFlag as openFlag, /* 공개 여부, 1이 공개입니다. */
    iqr.readcount as readcount, -- 조회수
    (sysdate - iqr.regdate) * 24 as gap, -- 시간 차
    (select count(*) from tblInquiryComment where inquirySeq = iqr.seq and delflag = 0) as ccount -- 댓글 수
from tblInquiry iqr
    left outer join tblInquiryBroker iqb
        on iqr.seq = iqb.inquirySeq
            left outer join tblApproBroker abk
                on abk.seq = iqb.approBrokerSeq
                    left outer join tblBroker brk
                        on brk.seq = abk.BrokerSeq
                            left outer join tblInquiryMember iqm
                                on iqr.seq = iqm.inquirySeq
                                    left outer join tblMember m
                                        on m.seq = iqm.memberSeq
where iqr.delFlag <> 1 and (brk.delFlag <> 1 or m.delFlag <> 1)
order by regDate desc;

select * from vwInquiry;
-------------------------------------------------------------------------------
-- *******************************************수정
-- 문의게시판 총 페이지수 계산하는 함수(회원은 자기 글을 포함한 공개된 글만 볼 수 있다. 회원번호, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace function fnInquiryMaxPage(
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwInquiry) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;

select * from tblMember;▒
-------------------------------------------------------------------------------
-- *******************************************수정
-- 문의게시판 글 목록 조회(최대 10개의 회원 본인이 쓴 글과 공개된 글 목록을 출력한다. 회원번호, 페이지수 필요)
-- 문의게시판 목록에는 [번호, 글제목, 작성자, 작성일]이 출력된다.
-------------------------------------------------------------------------------
create or replace procedure procListInquiry(
    paccess number, -- 접근 권한 (0 중개사 1 회원 3 관리자) session에 저장한 access값 = zerobonem값
    pseq number, -- 중개사, 회원, 관리자 번호
    ppage number, -- 페이지수
    psearch varchar2, -- 검색어
    pcursor out sys_refcursor
)
is
begin

    -- 검색어가 없을 경우 전체 목록을 출력한다.
    if psearch is null then 
        
        -- 중개사나 회원일 경우 본인의 글을 제외한 비공개 글은 비공개 글입니다로 보인다.
        if paccess <> 3 then 
            open pcursor for select
                                a.seq as seq, -- 번호
                                replace(a.subject,(select v.subject from vwInquiry v where v.openflag = 0 and v.seq = a.seq and not (v.zerobonem = paccess and v.authorSeq = pseq)), '〓〓〓〓〓〓〓 비공개 문의글입니다. 〓〓〓〓〓〓〓') as subject, -- 제목
                                a.authorName as authorName, -- 작성자
                                a.authorSeq as authorSeq,
                                a.zerobonem as zerobonem,
                                a.openflag as openflag,
                                to_char(regDate, 'yy/mm/dd') as regDate, -- 작성일
                                a.readcount as readcount, -- 조회수
                                a.gap as gap, -- 시간 차
                                a.ccount as ccount -- 댓글 수
                            from (select rownum as rnum, i.* from vwInquiry i) a
                                where a.rnum between 10*(fnInquiryMaxPage(ppage)-1)+1 and fnInquiryMaxPage(ppage)*10;
                                
        -- 관리자의 경우 모든 글을 출력한다.
        elsif paccess = 3 then
            open pcursor for select
                                seq, -- 번호
                                subject, -- 제목
                                authorName, -- 작성자
                                authorSeq,
                                zerobonem,
                                openflag,
                                to_char(regDate, 'yy/mm/dd') as regDate, -- 작성일
                                readcount, -- 조회수
                                gap, -- 시간 차
                                ccount -- 댓글 수
                            from (select rownum as rnum, i.* from vwInquiry i)
                                where rnum between 10*(fnInquiryMaxPage(ppage)-1)+1 and fnInquiryMaxPage(ppage)*10;
        end if;
        
    -- 검색어가 있을 경우
    elsif psearch is not null then
    
        -- 중개사나 회원일 경우
        if paccess <> 3 then 
            open pcursor for select
                                a.seq as seq, -- 번호
                                replace(a.subject,(select v.subject from vwInquiry v where v.openflag = 0 and v.seq = a.seq and not (v.zerobonem = paccess and v.authorSeq = pseq)), '〓〓〓〓〓〓〓 비공개 문의글입니다. 〓〓〓〓〓〓〓') as subject, -- 제목
                                a.authorName as authorName, -- 작성자
                                a.authorSeq as authorSeq,
                                a.zerobonem as zerobonem,
                                a.openflag as openflag,
                                to_char(regDate, 'yy/mm/dd') as regDate, -- 작성일
                                a.readcount as readcount, -- 조회수
                                a.gap as gap, -- 시간 차
                                a.ccount as ccount -- 댓글 수
                            from (select rownum as rnum, i.* from vwInquiry i) a
                                where a.rnum between 10*(fnInquiryMaxPage(ppage)-1)+1 and fnInquiryMaxPage(ppage)*10
                                and a.subject like '%'||psearch||'%' or a.authorName like '%'||psearch||'%';
        
        -- 관리자의 경우           
        elsif paccess = 3 then
            open pcursor for select
                                seq, -- 번호
                                subject, -- 제목
                                authorName, -- 작성자
                                authorSeq,
                                zerobonem,
                                openflag,
                                to_char(regDate, 'yy/mm/dd') as regDate, -- 작성일
                                readcount, -- 조회수
                                gap, -- 시간 차
                                ccount -- 댓글 수
                            from (select rownum as rnum, i.* from vwInquiry i)
                                where rnum between 10*(fnInquiryMaxPage(ppage)-1)+1 and fnInquiryMaxPage(ppage)*10
                                and subject like '%'||psearch||'%' or authorName like '%'||psearch||'%';
        end if;
    end if;
end procListInquiry;

declare
    vcursor sys_refcursor;
    vseq vwInquiry.seq%type;
    vsubject vwInquiry.subject%type;
    vauthorName vwInquiry.authorName%type;
    vregDate varchar2(10);
    vreadcount vwInquiry.readcount%type;
    vgap vwInquiry.gap%type;
    vccount vwInquiry.ccount%type;
begin
    procListInquiry(0, 1, 1, ' ', vcursor);
    loop
        fetch vcursor into vseq, vsubject, vauthorName, vregDate, vreadCount, vgap, vccount;
        exit when vcursor%notfound;
        DBMS_OUTPUT.PUT_LINE(vseq||' '||vsubject||' '||vauthorName||' '||vregDate||' '||vreadCount||' '||vgap||' '||vccount);
        end loop;
end;

-------------------------------------------------------------------------------
-- 문의게시판 글 작성(회원이 작성한다. 회원번호 필요)
-------------------------------------------------------------------------------
drop procedure procAddInquiryMember;
create or replace procedure procAddInquiry(
    pzerobonem number, -- 중개사 0 /회원 1 구분 번호
    pseq number, -- 중개사/ 회원 번호
    psubject varchar2, -- 제목
    pdetail varchar2, -- 내용
    popenFlag number -- 공개 여부(1이 공개)
)
is
begin
    -- 중개사일 경우
    if pzerobonem = 0 then
        -- 문의게시판 테이블에 추가
        insert into tblInquiry
            values (seqInquiry.nextVal, psubject, pdetail, sysdate, popenFlag, 0, default);
        -- 작성한문의_중개사 테이블에 추가
        insert into tblInquiryBroker
            values (seqInquiryBroker.nextVal, seqInquiry.currVal, pseq);
    
    -- 회원일 경우
    elsif pzerobonem = 1 then
        -- 문의게시판 테이블에 추가
        insert into tblInquiry
            values (seqInquiry.nextVal, psubject, pdetail, sysdate, popenFlag, 0, default);
        -- 작성한문의_회원 테이블에 추가
        insert into tblInquiryMember
            values (seqInquiryMember.nextVal, seqInquiry.currVal, pseq);
    end if;
    commit;
exception
    when others then
        rollback;
end procAddInquiry;

--begin
--    procAddInquiryMember(1, '광고가 너무 많습니다', '불편해요', 1);
--end;
-------------------------------------------------------------------------------
-- 문의게시판 글 수정(문의게시판글번호 필요)
-------------------------------------------------------------------------------
update tblInquiry set subject = '수정할제목', detail = '수정할내용', openFlag = 공개여부 
    where seq = 문의게시판글번호;
-------------------------------------------------------------------------------
-- 문의게시판 글 삭제(문의게시판글번호 필요)
-------------------------------------------------------------------------------
update tblInquiry set delFlag = 1 where seq = 문의게시판글번호;

-------------------------------------------------------------------------------
-- 청강님 작성
--[문의게시판 댓글 조회 뷰]
create or replace view vwInquiryComment
as
select
    iqc.seq as seq, /* 문의글 댓글 번호 */
    iqr.seq as iqrSeq, /* 문의글 번호 */
    adm.seq as admSeq, /* 관리자 번호 */
    adm.name as admName, /* 관리자 이름 */
    iqc.detail as detail,
    iqc.regDate as regDate,
    (sysdate - iqc.regDate) * 24 as gap
from tblInquiryComment iqc
    inner join tblInquiry iqr
        on iqr.seq = iqc.inquirySeq
            inner join tblAdmin adm
                on adm.seq = iqc.adminSeq
where iqc.delFlag <> 1 and iqr.delFlag <> 1
order by regDate desc;

--[문의게시판 댓글 달기]
create or replace procedure procAddIComment(
    padminSeq in number, -- 관리자 번호
    pinquirySeq in number, -- 글 번호
    pdetail in varchar2 -- 댓글 내용
)
is
begin
    insert into tblInquiryComment (seq, detail, regDate, adminSeq, inquirySeq, delFlag)
        values (seqInquiryComment.nextVal, pdetail, default, padminSeq, pinquirySeq, 0);
end procAddIComment;

select * from tblinquiryComment;
