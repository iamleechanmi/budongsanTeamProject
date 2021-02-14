set serveroutput on;
--------------
--중개사 DML--
--------------
/* 찬미님의 sql을 거의 모두? 호출한 상태여야 합니다.
이미 만든것은 새로 create 하지 않고, 테스트할 수 있는 sql문(declare, begin 등)을 넣었습니다. */

--승인중개사 뷰
create or replace view vwApproBroker
as
select
    abk.seq as abkSeq, -- 승인중개사 번호
    abk.regDate as abkRegDate, -- 승인 일자
    brk.seq as brkSeq, -- 중개사 번호(기본키)
    brk.email as brkEmail, -- 중개사 이메일(아이디)
    brk.pw as brkPw, -- 중개사 비밀번호
    brk.name as brkName, -- 사업자 대표명
    brk.businessName as brkBusinessName, -- 중개사명
    brk.brokerNum as brkBrokerNum, -- 중개등록번호 
    brk.address as brkAddress, -- 중개사 주소
    brk.tel as brkTel, -- 중개사 연락처
    brk.businessNum as brkBusinessNum -- 사업자등록번호
from tblApproBroker abk
    inner join tblBroker brk
        on brk.seq = abk.brokerSeq
            where brk.delFlag <> 1;
            
--승인중개사 번호 알아내기
select abkSeq from vwApproBroker where brkseq = 2;

--내 프로필 보기
select 
    brkEmail, brkPw, brkName, brkBusinessName, brkBrokerNum, brkAddress, brkTel, brkBusinessNum
from vwApproBroker
where brkseq = 1;

--내 프로필 수정하기
create or replace procedure procReplaceProfileB(
    pseq in number, -- 중개사 번호
    ppw in varchar2,
    pbusinessName in varchar2,
    paddress in varchar2,
    ptel in varchar2
)
is
begin
    update tblBroker set 
        pw = ppw, 
        businessName = pbusinessName,
        address = paddress,
        tel = ptel
    where seq = pseq;
end;

begin
    procReplaceProfileB(1, 'ghdrlfehd123','큰방공인중개사사무소', '서울시 강남구 역삼동 732-4', '0233334444');
end;

--중개사 회원 탈퇴
create or replace procedure procDeleteBroker(
    pseq in number -- 중개사 번호
)
is
begin
    update tblBroker set delFlag = 1 where seq = pseq;
end;

begin
    procDeleteBroker(1);
end;
    
--공지사항 목록 보기
declare
    vcursor sys_refcursor;
    vrow vwNoticeList%rowtype;
begin
    procFindNoticeList(vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.ntcSubject);
    dbms_output.put_line(vrow.ntcRegDate);
    dbms_output.put_line(vrow.ntcImageURL);
    dbms_output.put_line(vrow.admName);
    end loop;
end;

--특정 공지사항 보기
declare
    vcursor sys_refcursor;
    vrow vwNotice%rowtype;
begin
    procFindNotice(3, vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.ntcSubject);
    dbms_output.put_line(vrow.ntcDetail);
    dbms_output.put_line(vrow.ntcRegDate);
    dbms_output.put_line(vrow.ntcImageURL);
    dbms_output.put_line(vrow.admName);
    end loop;
end;

--뉴스 목록 보기
declare
    vcursor sys_refcursor;
    vrow vwNewsList%rowtype;
begin
    procFindNewsList(vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.nwsSubject);
    dbms_output.put_line(vrow.nwsRegDate);
    dbms_output.put_line(vrow.nwsImageURL);
    dbms_output.put_line(vrow.admName);
    end loop;
end;

--특정 뉴스 보기
declare
    vcursor sys_refcursor;
    vrow vwNews%rowtype;
begin
    procFindNews(3, vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.nwsSubject);
    dbms_output.put_line(vrow.nwsDetail);
    dbms_output.put_line(vrow.nwsRegDate);
    dbms_output.put_line(vrow.nwsImageURL);
    dbms_output.put_line(vrow.admName);
    end loop;
end;

--자유게시판 목록 보기
--찬미님이 작성하신 fnFreeMaxPage와 procListFree를 사용하는 것이 좋을 것 같습니다.
--select seq, zeroBoneM, authorSeq, authorName, subject, regdate from vwFree;
create or replace view vwtestfreebrk --procListFree를 테스트해보려고 만든 뷰입니다. JDBC에서는 사용되지 않을 것 같습니다.
as
select
    seq,
    subject,
    authorName,
    to_char(regDate, 'yy/mm/dd') as regDate
from (select rownum as rnum, f.* from vwFree f);

declare
    vcursor sys_refcursor;
    vrow vwtestfreebrk%rowtype;
begin
    procListFree(2, vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.seq);
    dbms_output.put_line(vrow.subject);
    dbms_output.put_line(vrow.authorName);
    dbms_output.put_line(vrow.regdate);
    end loop;
end;

--특정 자유글 보기
select * from vwFree where seq = 2;

--자유게시판 글 쓰기
create or replace procedure procAddFreeBRK(
    pseq in number, -- 승인중개사 번호(중개사 번호 아님!!)
    psubject in varchar2,
    pdetail in varchar2
)
is
    vbrokerName tblBroker.businessName%type;
    vbrokerSeq tblBroker.seq%type;
    vfreeSeq tblFree.seq%type;
begin
    select brkBusinessName, brkSeq into vbrokerName, vbrokerSeq from vwApproBroker where abkSeq = pseq;
    
    select seqFree.nextVal into vFreeSeq from dual;
    
    insert into tblFree (seq, subject, detail, regDate, delFlag) 
        values (vFreeSeq, psubject, pdetail, default, 0);
        
    insert into tblFreeBroker (seq, freeSeq, approBrokerSeq) 
        values (seqFreeBroker.nextVal, vFreeSeq, pseq);
end;

begin
    procAddFreeBRK(1, '날씨가 좋네요', '이사가기 딱 좋은 날씨에요~ 야호~');
end;   
select * from vwFree;

--자유게시판 글 수정하기
/* 수정,삭제 권한 알아내기 
    -> 1. select abkSeq from vwApproBroker where brkseq = 접속한 중개사 번호;
    -> 2. select select ahthorSeq, zeroBoneM from vwFree where seq = 특정 글 번호;
    -> 3. 1번의 abkSeq 과 2번의 ahthorSeq 이 같으면서, 2번의 zeroBoneM이 0일때, 중개사가 쓴 자유글 수정권한을 갖는다. */
create or replace procedure procReplaceFree(
    pfreeSeq in number, -- 자유게시판 글 번호
    psubject in varchar2,
    pdetail in varchar2
)
is
begin
    update tblFree set 
        subject = psubject, 
        detail = pdetail
    where seq = pfreeSeq and delFlag <> 1;
end;

begin
    procReplaceFreeBRK(25, '새해 복 많이 받으세요~', '신축년 새해엔 행복한 일만 가득하시길 바랍니다.');
end;
select * from vwFree;

--자유게시판 글 삭제하기
begin 
    procDeleteFree(25);
end;

--자유게시판 댓글 보기
select * from vwFreeComment where frSeq = 1;

--자유게시판 댓글 작성하기
create or replace procedure procAddFreeCommentBRK(
    paBrokerSeq in number,
    pfreeSeq in number,
    pdetail in varchar2
)
is
begin
    insert into tblFreeComment
        values (seqFreeComment.nextVal, pdetail, sysdate, pfreeSeq, 0);
        
    insert into tblCommentBroker
        values (seqCommentBroker.nextVal, seqFreeComment.currVal, paBrokerSeq);
end;

select * from vwFreeComment;
begin
    procAddFreeCommentBRK(1, 1, '이번에 집 보러온 학생들에게도 알려주어야겠어요~ 호호');
end;
select * from vwFreeComment;

--자유게시판 댓글 수정하기
create or replace procedure procReplaceFCommentBRK(
    pcommentSeq in number,
    pdetail in varchar2
)
is
begin
    update tblFreeComment set
        detail = pdetail
    where seq = pcommentSeq;
end;

begin
    procReplaceFCommentBRK(11, '아니 이거 잘못된 정보같은데요?');
end;
select * from vwFreeComment;

--자유게시판 댓글 삭제하기
begin 
    procDeleteFComment(11);
end;

--문의게시판 목록 보기
--찬미님이 만드신 fnInquiryMaxPage, procListInquiry를 사용하는 것이 좋을 것 같습니다.
--select seq, zeroBoneM, authorSeq, authorName, subject, regdate, openflag from vwInquiry;

--특정 문의게시글 보기
select * from vwInquiry where seq = 1;

--특정 문의게시글의 댓글 보기
select * from vwInquiryComment where iqrSeq = 1;

--문의게시글 쓰기
create or replace procedure procAddInquiryBRK(
    paBrokerSeq in number, --승인중개사 번호
    psubject in varchar2,
    pdetail in varchar2,
    popenFlag in number
)
is
begin
    insert into tblInquiry
        values (seqInquiry.nextVal, psubject, pdetail, default, popenFlag, 0);
    
    insert into tblInquiryBroker
        values (seqInquiryBroker.nextVal, seqInquiry.currVal, paBrokerSeq);
end;

begin
    procAddInquiryBRK(1, '모바일 어플리케이션은 없나요??', '밖에 나가 있을 일이 많은데, 어플리케이션이 있으면 편할 것 같아서요.', 1);
end;
select * from vwInquiry;

--------
--방/매물 관련 프로시저는 찬미님이 작성해주신 SQL을 전반적으로 활용하면될 것 같습니다.
--------

--등록된 방(임대인, 세입자가 올린 매물 내지 방) 조회
--찬미님이 만드신 fnRoomMaxPage와 procListRoomPost를 사용하면 될 것 같습니다.
--조회수를 어떻게 해야할지는 고민해봐야할 것 같네요.. (빼는게 어떨지?)

--특정 방 조회
/* 찬미님이 만드신 select를 view로 만들었습니다. select 전체를 코드편집기로 가져가면
줄 맞추기 까다로울 것 같??습니다. */
create or replace view vwRoomPostBRK
as
select
    seq, -- 글 번호
    mseq, -- 회원 번호
    name, -- 회원 이름
    phone, -- 회원 전화번호
    btype, -- 건물 유형
    dtype, -- 거래 유형
    price, -- 방 가격
    rent, -- 월세
    monthlyFee, -- 월관리비
    address, -- 주소
    exclusiveArea, -- 전용 면적
    supplyArea, -- 공급 면적
    selectedFloor, -- 해당 층
    totalFloor, -- 총 층
    roomNum, -- 방 개수
    bathroomNum, -- 욕실 개수
    direction, -- 방향
    completionYear, -- 준공년도
    parkingFlag, -- 주차가능 여부
    elevator, -- 엘리베이터 유무
    pet, -- 반려동물 유무
    subject, -- 글 제목
    detail, -- 글 설명
    regDate -- 등록일
from vwRoomPost;

select * from vwRoomPostBRK where seq = 1;

--특정 방의 이미지 이름 가져오기
select url from tblRoomImg where roomPostSeq = 1;

--매물 등록하기
--찬미님의 procAddHousePost를 쓰되, 화면설계의 상세주소를 저장하기 어려워보입니다.
--그리고 도로명 주소는 안 쓰는 것으로 통일하였기에, 마찬가지로 화면 설계에도 도로명 주소가 없어야 할 것 같습니다.

--내가 등록한 매물 목록 조회하기
--내가 등록한 매물만 찾도록 찬미님의 fnHouseMaxPage와 procListHousePost에 조건을 더해 프로시저를 만들었습니다.
create or replace function fnHouseMaxPageBRK(
    page number, -- 현재 페이지수를 받는다.
    pseq number -- 승인 중개사 번호
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwHousePost where bseq = pseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;

create or replace procedure procListHousePostBRK(
    ppage number, -- 페이지수
    pseq number, -- 승인중개사 번호
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                            seq, -- 글 번호
                            subject, -- 글 제목
                            bname, -- 사업자 상호
                            regDate -- 등록일
    from (select rownum as rnum, h.* from vwHousePost h where bseq = pseq)
    where (rnum between 10*(fnHouseMaxPageBRK(ppage, pseq)-1)+1 and fnHouseMaxPageBRK(ppage, pseq)*10);
end procListHousePostBRK;

--조건을 넣어도 잘 되나 확인해봤습니다.
create or replace view vwTestBRK2
as
select
    seq,
    subject,
    bname,
    regDate
from (select rownum as rnum, h.* from vwHousePost h);

declare
    vcursor sys_refcursor;
    vrow vwtestBRK2%rowtype;
begin
    procListHousePostBRK(1, 1, vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.seq);
    dbms_output.put_line(vrow.subject);
    dbms_output.put_line(vrow.bname);
    dbms_output.put_line(vrow.regdate);
    end loop;
end;

--내가 등록한 특정 매물 보기
/* 특정 방 보기와 마찬가지로 찬미님이 만드신 select를 view로 만들었습니다. */
create or replace view vwHousePostBRK
as
select
    seq, -- 글 번호
    bseq, -- 승인중개사 번호
    bname, -- 사업자 상호
    tel, -- 전화번호
    state, -- 거래 상태
    btype, -- 건물 유형
    dtype, -- 거래 유형
    price, -- 매물 가격
    rent, -- 월세
    monthlyFee, -- 월관리비
    address, -- 주소
    exclusiveArea, -- 전용 면적
    supplyArea, -- 공급 면적
    selectedFloor, -- 해당 층
    totalFloor, -- 총 층
    roomNum, -- 방 개수
    bathroomNum, -- 욕실 개수
    direction, -- 방향
    completionYear, -- 준공년도
    parkingFlag, -- 주차 가능 여부
    elevator, -- 엘리베이터 유무
    pet, -- 반려동물 유무
    subject, -- 글 제목
    content, -- 글 설명
    regDate -- 등록일
from vwHousePost;

select * from vwhousepostbrk where seq = 39;

--내가 등록한 매물 수정하기
--찬미님이 만드신 procReplaceHousePost를 사용하면 될 것 같습니다.

--내가 올린 매물 거래 완료하기
--페이지상에서 이미 특정 매물에 접근한 상태이므로, 해당 매물의 seq를 가져와 바로 update하면 될 것 같습니다.
update tblHouseDealState set state = 1 where housePostSeq = 매물게시글번호;

--내가 올린 매물 삭제하기
update tblHousePost set delFlag = 1 where seq = 매물게시글번호;

--이미지 관련입니다. 찬미님 프로시저 내용을 그대로 붙여넣었습니다.
-- 선택한 매물 게시글의 매물 이미지 보기(매물게시글번호 필요)
-- 이미지주소를 select
-------------------------------------------------------------------------------
select url from tblHouseImg where housePostSeq = 매물게시글번호;
-------------------------------------------------------------------------------
-- 매물 이미지 추가(매물게시글번호 필요)
-------------------------------------------------------------------------------
insert into tblHouseImg values (seqHouseImg.nextVal, '추가할이미지주소', 매물게시글번호);
--select * from tblHouseImg where housePostSeq = 62; -- 103
-------------------------------------------------------------------------------
-- 매물 이미지 수정(매물이미지번호 필요)
-------------------------------------------------------------------------------
update tblHouseImg set url = '수정할이미지주소' where seq = 매물이미지번호;
--update tblHouseImg set url = 'house0020.jpg' where seq = 103;
--select * from tblHouseImg where housePostSeq = 62;
-------------------------------------------------------------------------------
-- 매물 이미지 삭제(매물이미지번호 필요)
-------------------------------------------------------------------------------
delete from tblHouseImg where seq = 매물이미지번호;
--delete from tblHouseImg where seq = 103;

--광고 결제 하기
create or replace procedure procAddAdPermit(
    paBrokerSeq in number, -- 승인 중개사 번호
    pamount in number, -- 광고 개수
    pendDate in varchar2, -- 광고 기간(종료날짜). '21/03/14' 
    pprice in varchar2, -- 광고 가격
    pmethod in varchar2 -- 광고 결제 수단
)
is
begin
    insert into tblAdInfo
        values (seqAdInfo.nextVal, pamount, to_date(pendDate, 'yy/mm/dd'), pprice);
        
    insert into tblAdPay
        values (seqAdPay.nextVal, default, pmethod, seqAdInfo.currVal, paBrokerSeq);
    
    insert into tblAdPermit
        values (seqAdPermit.nextVal, 1, paBrokerSeq);
end;

--광고 시작 하기
--선택한 매물의 개수가 광고 개수보다 넘지 않으면서 광고 시작이 가능하도록 JDBC에서 제한하여야 할 것 같습니다.
create or replace procedure procAddPostAd(
    paBrokerSeq in number, -- 승인 중개사 번호
    padPaySeq in number, -- 광고 결제 번호
    phousePostSeq in number -- 매물 게시글 번호
)
is
begin
    insert into tblPostAd
        values (seqPostAd.nextVal, padPaySeq, phousePostSeq);
end;

--광고 시작 전 내 매물 보기
--매물의 광고상태 포함하는 뷰를 만들어서 위에 있는 '내가 등록한 매물 목록 조회하기'의 프로시저인 procListHousePostBRK를 활용했습니다.
create or replace view vwAdList
as
select
    vhp.seq as vhpSeq, -- 매물 게시글 번호
    vhp.bseq as vhpBseq,
    vhp.subject as vhpSubject,
    vhp.bname as vhpBName,
    vhp.regDate as vhpRegDate,
    case
        when aif.endDate is null then '미광고'
        when aif.endDate < sysdate then '미광고'
        when aif.endDate >= sysdate then '광고중'
    end as adState -- 광고 기간을 넘겼거나, 등록되지 않은 광고는 '미광고', 아니라면 '광고중'
from vwHousePost vhp
    left outer join tblPostAd pa
        on vhp.seq = pa.housePostSeq
            left outer join tblAdPay ap
                on ap.seq = pa.adPaySeq
                    left outer join tblAdinfo aif
                        on aif.seq = ap.adInfoSeq
                            left outer join tblApproBroker abk
                                on abk.seq = ap.approBrokerSeq;

create or replace procedure procListHousePostADL(
    ppage number, -- 페이지수
    pseq number, -- 승인중개사 번호
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                            vhpseq, -- 글 번호
                            vhpsubject, -- 글 제목
                            vhpbname, -- 사업자 상호
                            vhpregDate, -- 등록일
                            adState
    from (select rownum as rnum, a.* from vwAdlist a where vhpBseq = pseq)
    where (rnum between 10*(fnHouseMaxPageBRK(ppage, pseq)-1)+1 and fnHouseMaxPageBRK(ppage, pseq)*10);
end procListHousePostADL;

-- 잘 작동하나 테스트해봤습니다.
create or replace view vwTestBRK3
as
select
    vhpseq, -- 글 번호
    vhpsubject, -- 글 제목
    vhpbname, -- 사업자 상호
    vhpregDate, -- 등록일
    adState
from (select rownum as rnum, a.* from vwAdlist a);

declare
    vcursor sys_refcursor;
    vrow vwtestBRK3%rowtype;
begin
    procListHousePostADL(1, 1, vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.vhpseq);
    dbms_output.put_line(vrow.vhpsubject);
    dbms_output.put_line(vrow.vhpbname);
    dbms_output.put_line(vrow.vhpregdate);
    dbms_output.put_line(vrow.adState);
    end loop;
end;

--진행 중인 광고 취소하기
--'광고 시작 전 내 매물 보기'에서 사용한 procListHousePostADL에서 광고중인 매물만 가져오기 위해 fnHouseMaxPageBRK와 procListHousePostADL에 조건을 추가했습니다.
create or replace function fnHouseMaxPageADL(
    page number, -- 현재 페이지수를 받는다.
    pseq number -- 승인 중개사 번호
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(vhpseq) from vwAdList where vhpbseq = pseq and adstate = '광고중') / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;

create or replace procedure procListHousePostADL2(
    ppage number, -- 페이지수
    pseq number, -- 승인중개사 번호
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                            vhpseq, -- 글 번호
                            vhpsubject, -- 글 제목
                            vhpbname, -- 사업자 상호
                            vhpregDate, -- 등록일
                            adState
    from (select rownum as rnum, a.* from vwAdlist a where vhpBseq = pseq and adstate = '광고중')
    where (rnum between 10*(fnHouseMaxPageADL(ppage, pseq)-1)+1 and fnHouseMaxPageADL(ppage, pseq)*10);
end procListHousePostADL2;

-- 잘 작동하나 테스트해봤습니다.
declare
    vcursor sys_refcursor;
    vrow vwtestBRK3%rowtype;
begin
    procListHousePostADL2(1, 2, vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line(vrow.vhpseq);
    dbms_output.put_line(vrow.vhpsubject);
    dbms_output.put_line(vrow.vhpbname);
    dbms_output.put_line(vrow.vhpregdate);
    dbms_output.put_line(vrow.adState);
    end loop;
end;

--광고 취소하기
create or replace procedure procDeleteAd(
    pseq in number -- 광고 취소할 매물 게시글 번호
)
is
begin
    delete from tblPostAd where housePostSeq = pseq;
end;

begin
    procDeleteAd(38);
end;

--구매자와 1:1 문의내역 목록 조회하기
--찬미님의 fnChatMemberMaxPage과 vwChatMember에서 회원번호 대신 승인 중개사 번호를 참조하도록하는 프로시저입니다.
create or replace function fnChatBrokerMaxPage(
    pseq number, -- 승인중개사 번호를 받는다.
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 자기가 쓴 문의글의 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from tblChatList where approBrokerSeq = pseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;

--vwChatMember에서 회원의 이름과 연락처를 추가한 뷰를 사용했습니다.
create or replace view vwChatBroker
as
select
    cm.seq as seq, -- 1:1 문의 번호
    cm.abseq as abseq, -- 승인중개사 번호
    cm.mseq as mseq, -- 회원 번호
    cm.bName as bname, -- 사업자상호
    cm.subject as subject, -- 제목
    cm.content as content, -- 내용
    cm.regDate as regDate, -- 문의일
    cm.regTime as regTime, -- 문의 시각
    m.name as mName, -- 회원 이름
    m.phone as mphone -- 회원 연락처
    from vwChatMember cm
        inner join tblMember m
            on cm.mseq = m.seq;
                                            
select * from vwChatBroker;

create or replace procedure procListChatBroker(
    pbseq number, -- 승인중개사 번호
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 1:1문의 번호
                        bname, -- 사업자상호
                        subject, -- 제목
                        regDate, -- 문의일
                        mName
                    from (select rownum as rnum, cb.* from vwChatBroker cb where cb.abseq = pbseq)
                        where rnum between 10*(fnChatBrokerMaxPage(pbseq, ppage)-1)+1 and fnChatBrokerMaxPage(pbseq, ppage)*10;
end procListChatBroker;

declare
    vcursor sys_refcursor;
    vseq vwChatBroker.seq%type;
    vbname vwChatBroker.bname%type;
    vsubject vwChatBroker.subject%type;
    vregDate vwChatBroker.regDate%type;
    vmName vwChatBroker.mName%type;
begin
    procListChatBroker(4, 1, vcursor);
    loop
        fetch vcursor into vseq, vbname, vsubject, vregDate, vmName;
        exit when vcursor%notfound;
        DBMS_OUTPUT.PUT_LINE(vseq||' '||vbname||' '||vsubject||' '||vregDate||' '||vmName);
        end loop;
end;

--특정 문의글 조회하기
select
    seq, -- 1:1문의 번호
    mname, -- 회원이름
    mphone, -- 회원 연락처
    subject, -- 제목
    content, -- 내용
    regDate, -- 문의일
    regTime -- 문의 시각
from vwChatBroker
    where abseq = 4 and seq = 6;

--희망 매물 조회하기
--찬미님의 fnHopeMaxPage와 procListHopeWrite를 중개사가 게시된 희망 입주글을 모두 조회할 수 있도록 회원번호 관련 조건을 제외하여 만들었습니다.
--다만 희망 매물 게시글은 제목이 없으니, 거래유형, 가격(월세), 지역, 작성한 회원 이름을 보여주면 될 것 같습니다.
-------------------------------------------------------------------------------
create or replace function fnHopeMaxPageBRK(
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 회원 본인이 작성한 희망입주글의 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwHopeWrite) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;

create or replace procedure procListHopeWriteBRK(
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 번호
                        hDType, -- 희망 거래 유형
                        hPrice, -- 희망 가격
                        hrent, -- 희망 월세 
                        hAddress, -- 희망 지역
                        mName -- 회원 이름
                    from (select rownum as rnum, hw.* from vwHopeWrite hw)
                        where rnum between 10*(fnHopeMaxPageBRK(ppage)-1)+1 and fnHopeMaxPageBRK(ppage)*10;
end procListHopeWriteBRK;

declare
    vcursor sys_refcursor;
    vseq vwHopeWrite.seq%type;
    vdt vwHopeWrite.hDType%type;
    vpr vwHopeWrite.hPrice%type;
    vrt vwHopeWrite.hrent%type;
    vad vwHopeWrite.hAddress%type;
    vmn vwHopeWrite.mName%type;
begin
    procListHopeWriteBRK(1, vcursor);
    loop
        fetch vcursor into vseq, vdt, vpr, vrt, vad, vmn;
        exit when vcursor%notfound;
        DBMS_OUTPUT.PUT_LINE(vseq||' '||vdt||' '||vpr||' '||vrt||' '||vad||' '||vmn);
        end loop;
end;

--특정 희망입주글 조회
--뷰로 만들었습니다.
select * from vwHopeWrite where seq = 4;

--후기/평점 조회하기
--찬미님의 vwBrokerReview에 회원 이름을 넣은 것을 사용하고, 페이징을 위한 함수와 프로시저를 적었습니다.
create or replace view vwBrokerReview
as
select
    br.seq as seq, -- 후기 번호
    ab.seq as abseq, -- 승인중개사 번호
    m.seq as mseq, -- 회원 번호
    m.name as mname, -- 회원 이름
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

create or replace function fnBrokerReviewMaxPageBRK(
    pseq number, -- 승인중개사 번호를 받는다.
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 자기가 쓴 문의글의 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwBrokerReview where abSeq = pseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;

create or replace procedure procListBReviewBRK(
    pseq number, -- 승인 중개사 번호
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 후기 번호
                        content, -- 후기 내용
                        star, -- 후기 별
                        mName, -- 작성자 이름
                        regDate -- 작성일
                    from (select rownum as rnum, br.* from vwBrokerReview br where abSeq = pseq)
                        where rnum between 10*(fnBrokerReviewMaxPageBRK(pseq, ppage)-1)+1 and fnBrokerReviewMaxPageBRK(pseq, ppage)*10;
end procListBReviewBRK;

select * from vwBrokerReview;

declare
    vcursor sys_refcursor;
    vseq vwBrokerReview.seq%type;
    vct vwBrokerReview.content%type;
    vst vwBrokerReview.star%type;
    vmn vwBrokerReview.mName%type;
    vrd vwBrokerReview.regDate%type;
begin
    procListBReviewBRK(1, 1, vcursor);
    loop
        fetch vcursor into vseq, vct, vst, vmn, vrd;
        exit when vcursor%notfound;
        DBMS_OUTPUT.PUT_LINE(vseq||' '||vct||' '||vst||' '||vmn||' '||vrd);
        end loop;
end;

--특정 후기 조회하기
select * from vwBrokerReview where seq = 1;

--후기 삭제 요청하기
create or replace procedure procReviewDelete(
    pseq in number, -- 삭제할 후기의 번호
    paBrokerSeq in number, -- 삭제 요청한 승인 중개사의 번호
    pdetail in varchar2 -- 삭제 사유
)
is
begin
    insert into tblReviewDelete
        values (seqReviewDelete.nextVal, pdetail, default, pseq, paBrokerSeq, 0);
end;

begin
    procReviewDelete(1, 2, '빨리좀 지워주세요');
end;
select * from tblReviewDelete;

-- 중개사 데이터 센터는 빼는 것이 좋을 것 같습니다.


