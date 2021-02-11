-- 작성자 : 이찬미
-- [회원] 문의게시판 DML
-------------------------------------------------------------------------------
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
    iqr.openFlag as openFlag /* 공개 여부, 1이 공개입니다. */
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
-------------------------------------------------------------------------------
-- 문의게시판 총 페이지수 계산하는 함수(회원은 자기 글을 포함한 공개된 글만 볼 수 있다. 회원번호, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace function fnInquiryMaxPage(
    pseq number, -- 회원 번호를 받는다.
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 자기가 쓴 문의글과 공개글을 포함하여 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwInquiry where openFlag = 1 or authorSeq = pseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 문의게시판 글 목록 조회(최대 10개의 회원 본인이 쓴 글과 공개된 글 목록을 출력한다. 회원번호, 페이지수 필요)
-- 문의게시판 목록에는 [번호, 글제목, 작성자, 작성일]이 출력된다.
-------------------------------------------------------------------------------
create or replace procedure procListInquiry(
    pmseq number, -- 회원 번호
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 번호
                        subject, -- 제목
                        authorName, -- 작성자
                        to_char(regDate, 'yy/mm/dd') as regDate -- 작성일
                    from (select rownum as rnum, i.* from vwInquiry i where i.openFlag = 1 or i.authorSeq = pmseq)
                        where rnum between 10*(fnInquiryMaxPage(pmseq, ppage)-1)+1 and fnInquiryMaxPage(pmseq, ppage)*10;
end procListInquiry;
-------------------------------------------------------------------------------
-- 문의게시판 글 작성(회원이 작성한다. 회원번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddInquiryMember(
    pmseq number, -- 회원 번호
    psubject varchar2, -- 제목
    pdetail varchar2, -- 내용
    popenFlag number -- 공개 여부(1이 공개)
)
is
begin
    -- 문의게시판 테이블에 추가
    insert into tblInquiry
        values (seqInquiry.nextVal, psubject, pdetail, sysdate, popenFlag, 0);
        
    -- 작성한문의_회원 테이블에 추가
    insert into tblInquiryMember
        values (seqInquiryMember.nextVal, seqInquiry.currVal, pmseq);
    commit;
exception
    when others then
        rollback;
end procAddInquiryMember;

--begin
--    procAddInquiryMember(1, '자유게시판 댓글 관리 안 하나요?', '눈이 찌푸려지는 댓글이 많네요', 0);
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