
--------------
--관리자 DML--
--------------

/*
                    [4. 공지사항 쓰기/조회/수정/삭제]
*/
--[공지사항 쓰기]
create or replace procedure procAddNotice(
    padminSeq in number,
    psubject in varchar2,
    pdetail in varchar2,
    pimageURL in varchar2
)
is
begin
    insert into tblNotice (seq, subject, detail, imageURL, regDate, adminSeq, delFlag) values (seqNotice.nextVal, psubject, pdetail, pimageURL, default, padminSeq, 0);
    commit;
end procAddNotice;

--[공지사항 조회]
-- 1-1. 공지사항 목록 view
create or replace view vwNoticeList
as
select
    ntc.seq as ntcSeq, /* 공지사항 번호 */
    adm.seq as admSeq, /* 작성한 관리자 번호 */
    rtrim(ntc.subject) as ntcSubject,
    ntc.imageURL as ntcImageURL,
    ntc.regDate as ntcRegDate,
    adm.name as admName
from tblNotice ntc
    inner join tblAdmin adm
        on adm.seq = ntc.adminSeq
            where delFlag <> 1
                order by ntcRegDate desc;
            
-- 1-2. 공지사항 view
create or replace view vwNotice
as
select
    ntc.seq as ntcSeq, /* 공지사항 번호 */
    adm.seq as admSeq, /* 작성한 관리자 번호 */
    rtrim(ntc.subject) as ntcSubject, -- 공지사항 제목. notice -> ntc
    ntc.detail as ntcDetail,
    ntc.imageURL as ntcImageURL,
    ntc.regDate as ntcRegDate,
    adm.name as admName
from tblNotice ntc
    inner join tblAdmin adm
        on adm.seq = ntc.adminSeq
            where delFlag <> 1;
            
--2-1. 공지사항 목록보기
create or replace procedure procFindNoticeList(
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        ntcSeq,
        admSeq,
        ntcSubject, -- 공지사항 제목
        ntcImageURL,
        ntcRegDate,
        admName
    from vwNoticeList;
end procFindNoticeList;

--2-2. 특정 공지사항 보기
create or replace procedure procFindNotice(
    pnoticeSeq in number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        ntcSeq,
        admSeq,
        ntcSubject,
        ntcDetail,
        ntcImageURL,
        ntcRegDate,
        admName
    from vwNotice
    where ntcSeq = pnoticeSeq;
end procFindNotice;

--[공지사항 수정]
create or replace procedure procReplaceNotice(
    pnoticeSeq in number,
    pnoticeSubject in varchar2,
    pnoticeDetail in varchar2,
    pnoticeImageURL in varchar2
)
is
begin
    update tblNotice set 
        subject = pnoticeSubject, 
        detail = pnoticeDetail, 
        imageURL = pnoticeImageURL
    where seq = pnoticeSeq;
end procReplaceNotice;

--[공지사항 삭제]
create or replace procedure procDeleteNotice(
    pnoticeSeq in number
)
is
begin
    update tblNotice set
        delFlag = 1
    where seq = pnoticeSeq;
end procDeleteNotice;
    

/*
                    [5. 뉴스 쓰기/조회/수정/삭제]
*/
--[뉴스 쓰기]
create or replace procedure procAddNews(
    padminSeq in number,
    psubject in varchar2,
    pdetail in varchar2,
    pimageURL in varchar2
)
is
begin
    insert into tblNews (seq, subject, detail, imageURL, regDate, adminSeq, delFlag) values (seqNews.nextVal, psubject, pdetail, pimageURL, default, padminSeq, 0);
    commit;
end procAddNews;

--[뉴스 조회]
-- 1-1. 뉴스 목록 view
create or replace view vwNewsList
as
select
    nws.seq as nwsSeq, /* 뉴스 번호 */
    adm.seq as admSeq, /* 작성한 관리자 번호 */
    rtrim(nws.subject) as nwsSubject,
    nws.imageURL as nwsImageURL,
    nws.regDate as nwsRegDate,
    adm.name as admName
from tblNews nws
    inner join tblAdmin adm
        on adm.seq = nws.adminSeq
            where delFlag <> 1
                order by nwsRegDate desc;
            
-- 1-2. 뉴스 view
create or replace view vwNews
as
select
    nws.seq as nwsSeq, /* 뉴스 번호 */
    adm.seq as admSeq, /* 작성한 관리자 번호 */
    rtrim(nws.subject) as nwsSubject, -- 공지사항 제목. News -> nws
    nws.detail as nwsDetail,
    nws.imageURL as nwsImageURL,
    nws.regDate as nwsRegDate,
    adm.name as admName
from tblNews nws
    inner join tblAdmin adm
        on adm.seq = nws.adminSeq
            where delFlag <> 1;

--2-1. 뉴스 목록보기
create or replace procedure procFindNewsList(
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        nwsSeq,
        admSeq,
        nwsSubject, -- 뉴스 제목
        nwsImageURL,
        nwsRegDate,
        admName
    from vwNewsList;
end procFindNewsList;

--2-2. 특정 뉴스 보기
create or replace procedure procFindNews(
    pnewsSeq in number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        nwsSeq,
        admSeq,
        nwsSubject,
        nwsDetail,
        nwsImageURL,
        nwsRegDate,
        admName
    from vwNews
    where nwsSeq = pnewsSeq;
end procFindNews;

--[뉴스 수정]
create or replace procedure procReplaceNews(
    pnewsSeq in number,
    pnewsSubject in varchar2,
    pnewsDetail in varchar2,
    pnewsImageURL in varchar2
)
is
begin
    update tblNews set 
        subject = pnewsSubject, 
        detail = pnewsDetail, 
        imageURL = pnewsImageURL
    where seq = pnewsSeq;
end procReplaceNews;

--[뉴스 삭제]
create or replace procedure procDeleteNews(
    pnewsSeq in number
)
is
begin
    update tblNews set
        delFlag = 1
    where seq = pnewsSeq;
end procDeleteNews;


/*
                    [9. 관리자의 각 사용자별 조회(이메일, 이름(회사명), 지역, 연락처)]
*/
--[일반회원 조회]
--1-1.일반회원 목록 뷰
create or replace view vwMemberListMGR
as
select
    seq as memSeq,
    email as memEmail,
    name as memName
from tblMember
where delFlag <> 1;

--1-2.일반회원(프로필) 뷰
create or replace view vwMemberMGR
as
select
    seq as memSeq,
    email as memEmail,
    name as memName,
    phone as memPhone,
    address as memAddress
from tblMember
where delFlag <> 1;

--2-1.일반회원 목록 조회
create or replace procedure procFindMemberList(
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        memSeq,
        memEmail,
        memName
    from vwMemberListMGR;
end procFindMemberList;

--2-2.특정 일반회원(프로필) 조회
create or replace procedure procFindMember(
    pseq in number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        memSeq,
        memEmail,
        memName,
        memPhone,
        memAddress
    from vwMemberMGR
    where memSeq = pseq;
end procFindMember;

--[중개사 조회]
--1-1.중개사 목록 뷰
create or replace view vwBrokerListMGR
as
select
    seq as brkSeq,
    email as brkEmail,
    name as brkName,
    businessName as brkBusinessName,
    case
        when seq in (select brokerSeq from tblApproBroker) then '승인'
        when seq not in (select brokerSeq from tblApproBroker) then '미승인'
    end as brkApproFlag -- 승인된 중개사일 경우 승인, 아닌경우 미승인
from tblBroker
where delFlag <> 1;

--1-2.중개사 뷰
create or replace view vwBrokerMGR
as
select
    seq as brkSeq,
    email as brkEmail,
    name as brkName,
    businessName as brkBusinessName,
    brokerNum as brkBrokerNum,
    address as brkAddress,
    tel as brkTel,
    businessNum as brkBusinessNum,
    documentURL as brkDocumentURL,
    case
        when seq in (select brokerSeq from tblApproBroker) then '승인'
        when seq not in (select brokerSeq from tblApproBroker) then '미승인'
    end as brkApproFlag
from tblBroker
where delFlag <> 1;

--2-1.중개사 목록 조회
create or replace procedure procFindBrokerList(
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        brkSeq,
        brkEmail,
        brkName,
        brkBusinessName,
        brkApproFlag
    from vwBrokerListMGR;
end procFindBrokerList;

--2-2.특정 중개사(프로필) 조회
create or replace procedure procFindBroker(
    pseq in number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        brkSeq,
        brkEmail,
        brkName,
        brkBusinessName,
        brkBrokerNum,
        brkAddress,
        brkTel,
        brkBusinessNum,
        brkDocumentURL,
        brkApproFlag
    from vwBrokerMGR
    where brkSeq = pseq;
end procFindBroker;

--[업체 조회]
--1-1. 업체 목록 뷰
create or replace view vwFirmListMGR
as
select
    frm.seq as frmSeq, /* 업체 번호 */
    ctg.seq as ctgSeq, /* 카테고리 번호 */
    frm.email as frmEmail,
    frm.id as frmId,
    ctg.categoryNum as frmCategoryNum,
    case
        when frm.seq in (select firmSeq from tblApprovalF) then '승인'
        when frm.seq not in (select firmSeq from tblApprovalF) then '미승인'
    end as frmApproFlag --승인된 업체일 경우 승인, 아닌경우 미승인
from tblFirm frm
    inner join tblCategory ctg
        on ctg.seq = frm.categorySeq
where frm.delFlag <> 1;

--1-2. 업체 뷰
create or replace view vwFirmMGR
as
select
    frm.seq as frmSeq, /* 업체 번호 */
    ctg.seq as ctgSeq, /* 카테고리 번호 */
    frm.id as frmId,
    frm.email as frmEmail,
    frm.address as frmAddress,
    frm.tel as frmTel,
    frm.introduction as frmIntroduction,
    frm.portfolio as frmPortpolio,
    frm.availablePoint as frmAvailablePoint,
    ctg.categoryNum as frmCategoryNum,
    case
        when frm.approval = 1 then '승인'
        when frm.approval = 0 then '미승인'
    end as frmApproFlag
from tblFirm frm
    inner join tblCategory ctg
        on ctg.seq = frm.categorySeq
where frm.delFlag <> 1;

--2-1. 업체 목록 조회
create or replace procedure procFindFirmList(
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        frmSeq,
        ctgSeq,
        frmEmail,
        frmId,
        frmCategoryNum,
        frmApproFlag
    from vwFirmListMGR;
end procFindFirmList;

--2-2. 특정 업체(프로필) 조회
create or replace procedure procFindFirm(
    pseq in number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
        frmSeq,
        ctgSeq,
        frmId,
        frmEmail,
        frmAddress,
        frmTel,
        frmIntroduction,
        frmPortpolio,
        frmAvailablePoint,
        frmCategoryNum,
        frmApproFlag
    from vwFirmMGR
    where frmSeq = pseq;
end procFindFirm;


--------------------------------------------------------------------------------
/* 조회까지 프로시저로 하려니까 너무 비효율적이어서 이하의 조회는 view에 대한
select로 바꿉니다. select * from vw~~~;을 호출하면 됩니다.
JDBC에서는 조건이 필요한 경우 PreparedStatement로 where + 조건을 추가하시고, 
ResultSet으로 한 행씩 읽으면 됩니다. */
--------------------------------------------------------------------------------


/*
                    [10. 승인을 기다리는 중개사 및 업체 조회/승인]
*/
--[미승인 중개사 목록 뷰]
create or replace view vwNonApproBroker
as
select
    seq as nabSeq,
    email as nabEmail, /* 미승인 중개사 이메일 */
    businessName as nabBusinessName,
    address as nabAddress,
    tel as nabTel
from tblBroker
where delFlag <> 1 and seq not in (select brokerSeq from tblApproBroker)
order by nabSeq desc;

select * from vwNonApproBroker;

--[미승인 업체 목록 뷰]
create or replace view vwNonApproFirm
as
select
    frm.seq as nafSeq,
    ctg.seq as ctgSeq,
    frm.email as nafEmail,
    frm.id as nafId,
    ctg.categoryNum as ctgCategoryNum,
    frm.address as nafAddress,
    frm.tel as nafTel
from tblFirm frm
    inner join tblCategory ctg
        on ctg.seq = frm.categoryseq
where frm.delFlag <> 1 and frm.approval = 0
order by nafSeq desc;

select * from vwNonApproFirm;

--[특정 중개사 승인]
create or replace procedure procApproveBroker(
    pseq number
)
is
    vseq number;
begin
    select 
        seq into vseq
    from tblBroker
    where seq = pseq and seq not in (select brokerSeq from tblApproBroker);

    insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, default, vseq);

end procApproveBroker;

--[특정 업체 승인]
create or replace procedure procApproveFirm(
    pseq number
)
is
    vapproval number;
begin
    select approval into vapproval from tblFirm where seq = pseq;
    
    if vapproval = 0 then
        insert into tblApprovalF (seq, firmSeq, approvalDate) values (seqApprovalF.nextVal, pseq, default);
        update tblFirm set approval = 1 where seq = pseq;
    end if;
end procApproveFirm;  
    

/*
                    [11. 광고 내역 조회]
*/
-- 2, 3번 중개사의 광고 endDate를 늘린 후, 모든 광고 권한을 endDate에 맞게 고쳐야합니다.
-- 이 경우 광고중인 매물 게시글은 (중개2)9, 10, 37, 38,(중개3)11, 12, 36 입니다.

--[광고 내역 목록 뷰]
create or replace view vwAdPayList
as
select
    apy.seq as apySeq, /* 광고결제 기본키 */
    aif.seq as aifSeq, /* 광고정보 기본키 */
    abk.seq as abkSeq, /* 승인중개사 기본키 */
    brk.seq as brkSeq, /* 중개사 기본키 */
    brk.businessName as brkBusinessName,
    aif.endDate as aifEndDate,
    aif.price as aifPrice,
    apy.method as apyMethod,
    apy.regDate as apyRegDate,
    case
        when apm.permition = 1 then '활성'
        when apm.permition = 0 then '비활성'
    end as adPermitFlag /* 광고중이면 '활성' 아니면 '비활성' */
from tblAdpay apy
    inner join tblAdinfo aif
        on aif.seq = apy.adInfoSeq
            inner join tblApproBroker abk
                on abk.seq = apy.approBrokerSeq
                    inner join tblBroker brk
                        on brk.seq = abk.brokerSeq
                            inner join tblAdPermit apm
                                on  abk.seq = apm.approBrokerSeq
where brk.delFlag <> 1
order by apyRegDate desc;

select * from vwAdPayList;

--[광고중인 중개사 목록 뷰]
create or replace view vwAdPermitBrokerList
as
select
    brk.seq as brkSeq,
    brk.businessName as brkBusinessName,
    aif.endDate as aifEndDate
from tblAdpay apy
    inner join tblAdinfo aif
        on aif.seq = apy.adInfoSeq
            inner join tblApproBroker abk
                on abk.seq = apy.approBrokerSeq
                    inner join tblBroker brk
                        on brk.seq = abk.brokerSeq
                            inner join tblAdPermit apm
                                on  abk.seq = apm.approBrokerSeq
where apm.permition = 1 and brk.delFlag <> 1
order by aifEndDate asc;

select * from vwAdPermitBrokerList;

/*
                    [11. 후기삭제요청 조회/후기삭제]
*/
--[후기삭제요청 목록 조회]
create or replace view vwBReviewDeleteList
as 
select
    rvd.seq as rvdSeq, /* 후기삭제요청 번호 */
    brk.seq as brkSeq, /* 중개사 번호 */
    brv.seq as brvSeq, /* 후기 번호 */
    brk.businessName as brkBusinessName,
    rvd.detail as rvdDetail,
    case
        when brv.delFlag = 1 then '처리됨'
        when brv.delFlag = 0 then '미처리'
    end as doneFlag /* 해당 후기가 삭제되었으면 '처리됨' 아니면 '미처리' */
from tblReviewDelete rvd
    inner join tblBrokerReview brv
        on brv.seq = rvd.reviewSeq
            inner join tblApproBroker abk
                on abk.seq = rvd.approBrokerSeq
                    inner join tblBroker brk
                        on brk.seq = abk.brokerSeq
where rvd.delFlag <> 1 and brk.delFlag <> 1
order by doneFlag asc;

select * from vwBReviewDeleteList;

--[후기 삭제]
create or replace procedure procDeleteBReviewMGR(
    pseq in number
)
is
begin
    update tblBrokerReview set delFlag = 1 where seq = pseq;
end procDeleteBReviewMGR;

/*
                    [11. 사이트 환경설정 조회/수정]
*/
--[사이트 정보 조회]
create or replace view vwSiteInfo
as
select
    seq as sifSeq,
    tel as sifTel,
    email as sifEmail,
    address as sifAddress,
    representative as sifRepresentative,
    policyManager as sifPolicyManager
from tblSiteInfo;  

select * from vwSiteInfo;

--[사이트 정보 수정]
create or replace procedure procReplaceSiteInfo(
    ptel in varchar2,
    pemail in varchar2,
    paddress in varchar2,
    prepresentative in varchar2,
    ppolicyManager in varchar2
)
is
begin
    update tblSiteInfo set tel = ptel, email = pemail, address = paddress, representative = prepresentative, policyManager = ppolicyManager;
end;


/*
                    [14. 관리자의 각 사용자별 게시글 조회 및 삭제]
*/
--찬미님이 만들어주신 방게시글과 매물게시글 view를 둘 다 선언한 상태여야합니다.
select * from vwRoomPost;
select * from vwHousePost;

--[방 목록 조회]
create or replace view vwRoomPostListMGR
as
select
    seq,
    subject,
    address,
    name,
    regDate
from vwRoomPost
order by regDate desc;

select * from vwRoomPostListMGR;

--[특정 방 조회]
create or replace view vwRoomPostMGR
as
select
    seq,
    subject,
    name,
    phone,
    regDate,
    bType,
    dType,
    price,
    rent,
    monthlyFee,
    address,
    exclusiveArea,
    supplyArea,
    selectedFloor,
    totalFloor,
    roomNum,
    bathroomNum,
    direction,
    completionYear,
    parkingFlag,
    elevator,
    pet,
    detail
from vwRoomPost;

select * from vwRoomPostMGR where seq = 1;

--[매물 목록 조회]
create or replace view vwHousePostListMGR
as
select
    seq,
    bSeq,
    subject,
    address,
    regDate,
    dType,
    state,
    bName
from vwHousePost
order by regDate desc;
    
select * from vwHousePostListMGR;

--[특정 매물 조회]
create or replace view vwHousePostMGR
as
select
    seq,
    bSeq,
    subject,
    bName,
    tel,
    state,
    regDate,
    bType,
    dType,
    price,
    rent,
    monthlyFee,
    address,
    exclusiveArea,
    supplyArea,
    selectedFloor,
    totalFloor,
    roomNum,
    bathroomNum,
    direction,
    completionYear,
    parkingFlag,
    elevator,
    pet,
    content
from vwHousePost;
    
select * from vwHousePostMGR where seq = 1;

select * from tblHopeWrite;
    select * from tblHopePrice;
        select * from tblhopetype;
select * from tblVRInterior;

--[희망입주조건 조회]
--1. 희망입주조건 뷰
create or replace view vwHopeWrite
as
select
    hpw.seq as seq, -- 글 번호
    m.seq as mseq, -- 회원 번호
    m.name as mname, -- 회원 이름
    m.phone as phone, -- 회원 전화번호
    hpt.dealType as hDType, -- 희망거래유형
    hpp.price as hPrice, -- 희망가격
    case
        when hpp.rent is null then 0
        when hpp.rent is not null then hpp.rent
    end as hRent, -- 희망월세
    hpw.zone as hAddress, -- 지역
    hpw.area as hArea, -- 희망면적(전용면적)
    hpw.roomamount as hRoomNum, -- 희망방개수
    hpw.content as content, -- 내용
    case
        when vri.imgURL is null then 'none'
        when vri.imgURL is not null then vri.imgURL
    end as imgURL -- 가상인테리어 이미지주소(HTML태그)
from tblHopeWrite hpw
    inner join tblHopePrice hpp
        on hpp.seq = hpw.hopePriceSeq
            inner join tblHopeType hpt
                on hpt.seq = hpp.hopeTypeSeq
                    inner join tblMember m
                        on m.seq = hpw.memberSeq
                            left outer join tblVRInterior vri
                                on hpw.seq = vri.hopeWriteSeq
where m.delFlag <> 1 and hpw.delFlag <> 1;

--2. 희망입주조건 목록 뷰
create or replace view vwHopeWriteListMGR
as
select
    seq,
    hAddress,
    mName,
    hDType,
    hPrice,
    hRent,
    imgURL
from vwHopeWrite;

select * from vwHopeWriteListMGR;

--3. 특정 희망입주조건 뷰
select * from vwHopeWrite where seq = 1;

--[방, 매물, 희망입주조건 삭제]
--1. 방 삭제
create or replace procedure procDeleteRoomPostMGR(
    pseq in number
)
is
begin
    update tblRoomPost set delFlag = 1 where seq = pseq;
end procDeleteRoomPostMGR;

--2. 매물 삭제
create or replace procedure procDeleteHousePostMGR(
    pseq in number
)
is
begin
    update tblHousePost set delFlag = 1 where seq = pseq;
end procDeleteHousePostMGR;

--3. 희망입주조건 삭제
create or replace procedure procDeleteHopeWriteMGR(
    pseq in number
)
is
begin
     update tblHopeWrite set delFlag = 1 where seq = pseq;
end procDeleteHopeWriteMGR;


/*
                    [17. 허위매물신고 조회/삭제]
*/
--[허위매물신고 목록 뷰]
create or replace view vwFalseReportList
as
select
    flr.seq as seq, -- 허위매물신고 번호
    hpost.seq as hPostSeq, -- 매물게시글 번호
    hpost.subject as hPostSubject, -- 매물 제목
    m.seq as mSeq, -- 회원 번호
    flr.reportReason as reportReason, -- 신고사유
    flr.regDate as regDate, -- 등록일
    case
        when hpost.delFlag = 1 then '처리됨'
        when hpost.delFlag = 0 then '미처리'
    end as doneFlag -- 해당 매물이 삭제되었으면 '처리됨', 아니라면 '미처리'
from tblFalseReport flr
    inner join tblHousePost hpost
        on hpost.seq = flr.housePostSeq
            inner join tblMember m
                on m.seq = flr.memberSeq
where flr.delFlag <> 1 and m.delFlag <> 1
order by regDate desc;

select * from vwFalseReportList;
                        
--[허위매물신고 삭제] /* 허위매물을 삭제하는 것이 아님! */
create or replace procedure procDeleteFalseReport(
    pseq in number
)
is
begin
    update tblFalseReport set delFlag = 1 where seq = pseq;
end procDeleteFalseReport;


/*
                    [16. 관리자 통계]
*/
-- [지역별 + 매물 가격분류별 평균 가격 통계 (테스트 아직 못해봄)]
create or replace view vwHousePostStatMGR
as
select
    substr(address, instr(address, ' ') + 1, instr(address, ' ', instr(address, ' ') + 1) - instr(address, ' ')) as address,
    case
        when avg(case
                when dType = '매매' then price
                end) is null then 0
        when avg(case
                when dType = '매매' then price
                end) is not null then avg(case
                when dType = '매매' then price
                end)
    end as avgMM,
    case
        when avg(case
                when dType = '전세' then price
                end) is null then 0
        when avg(case
                when dType = '전세' then price
                end) is not null then avg(case
                when dType = '전세' then price
                end)
    end as avgJS
from vwHousePost
group by substr(address, instr(address, ' ') + 1, instr(address, ' ', instr(address, ' ') + 1) - instr(address, ' '));

select * from vwHousePostStatMGR;

-- [지역별 + 방 가격분류별(매매,전세) 평균 가격 통계]
-- 강남구가 아닌 다른 지역 데이터 추가하면 보기 편합니다.
begin
    procAddRoomPost(1, '방 내놓습니다~', '방 중개해주실 중개사분 연락주세요~', '오피스텔', '전세', '서울시 동구 반포동', 32.3, 35.5, 2, 6, 1, 1, '남', to_date('2012', 'yyyy'), 1, 1, 1, 5.2, 0, 10, 'room0010.jpg');
end;

create or replace view vwRoomPostStatMGR
as
select
    substr(address, instr(address, ' ') + 1, instr(address, ' ', instr(address, ' ') + 1) - instr(address, ' ')) as address,
    case
        when avg(case
                when dType = '매매' then price
                end) is null then 0
        when avg(case
                when dType = '매매' then price
                end) is not null then avg(case
                when dType = '매매' then price
                end)
    end as avgMM,
    case
        when avg(case
                when dType = '전세' then price
                end) is null then 0
        when avg(case
                when dType = '전세' then price
                end) is not null then avg(case
                when dType = '전세' then price
                end)
    end as avgJS
from vwRoomPost
group by substr(address, instr(address, ' ') + 1, instr(address, ' ', instr(address, ' ') + 1) - instr(address, ' '));

select * from vwRoomPostStatMGR;

--[지역별 입주희망 개수 많은 순 조회 (테스트 아직 못해봄)]
create or replace view vwHopeWriteCountStatMGR
as
select
    substr(hAddress, instr(hAddress, ' ') + 1, instr(hAddress, ' ', instr(hAddress, ' ') + 1) - instr(hAddress, ' ')) as address,
    count(*) as count
from vwHopeWrite
group by substr(hAddress, instr(hAddress, ' ') + 1, instr(hAddress, ' ', instr(hAddress, ' ') + 1) - instr(hAddress, ' '))
order by count desc;
    
select * from vwHopeWriteCountStatMGR;


/*
                    [32. 알림센터]
*/
--[부동산 중개사 승인 요청(미승인 중개사) 개수 확인]
select count(*) from vwNonApproBroker;

--[서비스 업체 승인 요청(미승인 업체) 개수 확인]
select count(*) from vwNonapproFirm;

--[처리되지 않은(매물삭제되지않은) 허위매물신고 개수 확인]
select count(*) from vwFalseReportList where doneFlag = '미처리';

--[처리되지 않은(후기삭제되지않은) 후기삭제요청 개수 확인]
select count(*) from vwBReviewDeleteList where doneFlag = '미처리';


/*
                    [19. 게시판 조회/문의게시판 댓글달기/자유글, 자유글 댓글, 문의글  삭제]
*/
--탈퇴한 회원과 중개사가 좀 많은 것 같습니다. 3,5번 중개사/ 12번,18번 회원 살리는 것 괜찮나요?
--[문의게시판 조회 뷰]
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

select seq, zeroBoneM, authorSeq, authorName, subject, regdate, openflag from vwInquiry;

--[특정 문의글 조회]
select * from vwInquiry where seq = 1;

--[자유게시판 조회 뷰]
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

select seq, zeroBoneM, authorSeq, authorName, subject, regdate from vwFree;

--[특정 자유글 조회]
select * from vwFree where seq = 1;

--[자유게시판 댓글 조회 뷰]
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
    fcm.regDate as regDate
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

select seq, zeroBoneM, authorSeq, authorName, detail, regdate from vwFreeComment;

--[문의게시판 댓글 조회 뷰]
create or replace view vwInquiryComment
as
select
    iqc.seq as seq, /* 문의글 댓글 번호 */
    iqr.seq as iqrSeq, /* 문의글 번호 */
    adm.seq as admSeq, /* 관리자 번호 */
    adm.name as admName, /* 관리자 이름 */
    iqc.detail as detail,
    iqc.regDate as regDate
from tblInquiryComment iqc
    inner join tblInquiry iqr
        on iqr.seq = iqc.inquirySeq
            inner join tblAdmin adm
                on adm.seq = iqc.adminSeq
where iqc.delFlag <> 1 and iqr.delFlag <> 1
order by regDate desc;

select * from vwInquiryComment;

--[문의게시판 댓글 달기]
create or replace procedure procAddIComment(
    pinquirySeq in number,
    padminSeq in number,
    pdetail in varchar2
)
is
begin
    insert into tblInquiryComment (seq, detail, regDate, adminSeq, inquirySeq, delFlag)
        values (seqInquiryComment.nextVal, pdetail, default, padminSeq, pinquirySeq, 0);
end;

--[문의게시판 댓글 수정하기]
create or replace procedure procReplaceIComment(
    pseq in number,
    pdetail in varchar2
)
is
begin
    update tblInquiryComment set detail = pdetail where seq = pseq;
end;

--[문의게시판 댓글 삭제]
create or replace procedure procDeleteIComment(
    pseq in number
)
is
begin
    update tblInquiryComment set delFlag = 1 where seq = pseq;
end;

--[문의글 삭제]
create or replace procedure procDeleteInquiry(
    pseq in number
)
is
begin
    update tblInquiry set delFlag = 1 where seq = pseq;
end;

--[자유게시판 댓글 삭제]
create or replace procedure procDeleteFComment(
    pseq in number
)
is
begin
    update tblFreeComment set delFlag = 1 where seq = pseq;
end;

--[자유글 삭제]
create or replace procedure procDeleteFree(
    pseq in number
)
is
begin
    update tblFree set delFlag = 1 where seq = pseq;
end;




