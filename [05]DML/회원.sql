-- 회원 dml
-------------------------------------------------------------------------------
-- 회원 가입
-------------------------------------------------------------------------------
insert into tblMember values (seqMember.nextVal, '이메일주소', '비밀번호', '이름', '주민등록번호', '핸드폰번호', '주소', 0);
-------------------------------------------------------------------------------
-- 아이디 찾기
-------------------------------------------------------------------------------
select email from tblMember where name = '이름' and ssn = '주민등록번호' and phone = '핸드폰번호';
-------------------------------------------------------------------------------    
-- 비밀번호 찾기
-------------------------------------------------------------------------------
select pw from tblMember where name = '이름' and ssn = '주민등록번호' and email = '이메일주소';
-------------------------------------------------------------------------------
-- 자유게시판 총 페이지수 계산하는 함수
-- 청강님 view vwFree를 생성하고 실행해야 한다.
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
-- 일주일, 한달, 세달 단위로 조회한다.
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
-- 문의게시판 총 페이지수 계산하는 함수(회원은 공개된 글만 볼 수 있다. 회원번호, 페이지수 필요)
-- 청강님 view vwInquiry를 생성하고 실행해야 한다.
-------------------------------------------------------------------------------
create or replace function fnInquiryMaxPage(
    pseq number, -- 회원번호를 받는다.
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
-- 문의게시판 글 목록 조회(최대 10개의 공개된 글과 회원 본인이 쓴 글 목록을 출력한다. 회원번호, 페이지수 필요)
-- 문의게시판 목록에는 [번호, 글제목, 작성자, 작성일]이 출력된다.
-------------------------------------------------------------------------------
create or replace procedure procListInquiry(
    pmseq number, -- 회원번호
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
    pmseq number, -- 회원번호
    psubject varchar2, -- 제목
    pdetail varchar2, -- 내용
    popenFlag number -- 공개여부(1이 공개)
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
-- 방 게시글 관련 뷰(최신글 순)
-------------------------------------------------------------------------------
create or replace view vwRoomPost
as
select
    distinct rpost.seq as seq, -- 글 번호
    m.seq as mseq, -- 회원 번호
    m.name as name, -- 회원 이름
    m.phone as phone, -- 회원 전화번호
    bt.type as btype, -- 건물 유형
    dt.type as dtype, -- 거래 유형
    rprice.price as price, -- 방 가격
    rprice.rent as rent, -- 월세
    rprice.monthlyFee as monthlyFee, -- 월관리비
    rb.address as address, -- 주소
    rb.exclusiveArea as exclusiveArea, -- 전용 면적
    rb.supplyArea as supplyArea, -- 공급 면적
    rb.selectedFloor as selectedFloor, -- 해당 층
    rb.totalFloor as totalFloor, -- 총 층
    rb.roomNum as roomNum, -- 방 개수
    rb.bathroomNum as bathroomNum, -- 욕실 개수
    rb.direction as direction, -- 방향
    to_char(rb.completionYear, 'yyyy') as completionYear, -- 준공년도
    decode(rb.parkingFlag, 0, '불가능', 1, '가능') as parkingFlag, -- 주차 가능 여부
    decode(rb.elevator, 0, '없음', 1, '있음') as elevator, -- 엘리베이터 유무
    decode(rb.pet, 0, '불가능', 1, '가능') as pet, -- 반려동물 유무
    rpost.subject as subject, -- 글 제목
    rpost.detail as detail, -- 글 설명
    rpost.regDate as regDate -- 등록일
from tblMember m
    inner join tblRoomPost rpost
        on m.seq = rpost.memberSeq
            inner join tblRoomPrice rprice
                on rprice.seq = rpost.roomPriceSeq
                    inner join tblRoomInfo ri
                        on ri.seq = rpost.roomInfoSeq
                            inner join tblRoomBuildingType bt
                                on bt.seq = ri.roomBuildingTypeSeq
                                    inner join tblRoomDealType dt
                                        on dt.seq = ri.roomDealTypeSeq
                                            inner join tblRoomBasic rb
                                                on rb.seq = ri.roomBasicSeq
                                                    where rpost.delFlag = 0
                                                        order by rpost.regDate desc;
                                                                
select * from vwRoomPost;
-------------------------------------------------------------------------------
-- 방 게시글 총 페이지수 계산하는 함수
-------------------------------------------------------------------------------
create or replace function fnRoomMaxPage(
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwRoomPost) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 방 게시글 전체 목록 조회(최대 10개의 공개된 글 목록을 출력한다. 최신글 순, 페이지수 필요)
-------------------------------------------------------------------------------
-- 방 게시글 목록에는 [방게시글번호, 글제목, 회원이름, 등록일]이 출력된다.
-------------------------------------------------------------------------------
create or replace procedure procListRoomPost(
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                            seq, -- 글 번호
                            subject, -- 글 제목
                            name, -- 회원 이름
                            regDate -- 등록일
                    from (select rownum as rnum, r.* from vwRoomPost r)
                        where rnum between 10*(fnRoomMaxPage(ppage)-1)+1 and fnRoomMaxPage(ppage)*10;
end procListRoomPost;
-------------------------------------------------------------------------------
-- 특정 방 게시글 조회 시(상세 페이지 보기, 방게시글번호 필요)
-------------------------------------------------------------------------------
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
from vwRoomPost 
    where seq = 방게시글번호;
    
select * from vwRoomPost where seq = 방게시글번호;
-------------------------------------------------------------------------------
-- 방 게시글 조건 검색 시
-- 경우의 수가 많아서 일단 보류하겠습니다. DB쪽에서 안 해도 될 것 같기도 합니다.
-------------------------------------------------------------------------------
-- 주소 조회 시
select * from (select rownum as rnum, rp.* from vwRoomPost rp where address like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
    
-- 제목 조회 시
select * from (select rownum as rnum, rp.* from vwRoomPost rp where subject like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
    
-- 건물 유형 조회 시
select * from (select rownum as rnum, rp.* from vwRoomPost rp where btype like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
    
-- 거래 유형 조회 시
select * from (select rownum as rnum, rp.* from vwRoomPost rp where dtype like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
-------------------------------------------------------------------------------
-- 방 게시글 작성(회원번호, 이미지 2개의 주소 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddRoomPost(
    pmSeq number, -- 회원 번호
    psubject varchar2, -- 글 제목
    pdetail varchar2, -- 글 설명
    pbType varchar2, -- 건물 유형
    pdType varchar2, -- 거래 유형
    paddress varchar2, -- 주소
    peArea number, -- 전용 면적
    psArea number, -- 공급 면적
    psFloor number, -- 해당 층
    ptFloor number, -- 총 층
    proomNum number, -- 방 개수
    pbathroomNum number, -- 욕실 개수
    pdirection varchar2, -- 방향
    pcYear date, -- 준공년도
    pparking number, -- 주차 가능 여부
    pelevator number, -- 엘리베이터 여부
    ppet number, -- 반려동물 여부
    pprice number, -- 가격
    prent number, -- 월세
    pmonthlyFee number, -- 월관리비
    purl1 varchar2, -- 첫번째 이미지 주소
    purl2 varchar2 -- 두번째 이미지 주소
)
is
begin
    -- 방 기초 정보 테이블에 추가
    insert into tblRoomBasic 
        values (seqRoomBasic.nextVal, paddress, peArea, psArea, psFloor, ptFloor, proomNum, pbathroomNum, pdirection, pcYear, pparking, pelevator, ppet);
                
    -- 방 가격 테이블에 추가
    insert into tblRoomPrice
        values (seqRoomPrice.nextVal, pprice, prent, pmonthlyFee);
                
    -- 방 정보 테이블에 추가
    insert into tblRoomInfo
        values (seqRoomInfo.nextVal, seqRoomBasic.currVal, (select seq from tblRoomBuildingType where type = pbType), (select seq from tblRoomDealType where type = pdType));
    
    -- 방 게시글 테이블에 추가
    insert into tblRoomPost
        values (seqRoomPost.nextVal, pmseq, seqRoomInfo.currVal, seqRoomPrice.currVal, psubject, pdetail, default, 0);
    
    -- 방 이미지 테이블에 추가
    insert into tblRoomImg
        values (seqRoomImg.nextVal, purl1, seqRoomPost.currVal);
        
    insert into tblRoomImg
        values (seqRoomImg.nextVal, purl2, seqRoomPost.currVal);
    commit;
exception
    when others then
        rollback;
end procAddRoomPost;

--begin
--    procAddRoomPost(1, '방 싸게 내놓습니다^^', '방 중개해주실 중개사분 언제든 연락주세요~', '원룸', '월세', '서울시 강남구 역삼동 땡땡빌딩', 32.3, 35.5, 2, 6, 1, 1, '남', to_date('2012', 'yyyy'), 1, 1, 1, 1000, 0, 10, 'room0031.jpg', 'room0033.jpg');
--end;
-------------------------------------------------------------------------------
-- 방 게시글 수정(방게시글번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procReplaceRoomPost(
    pseq number, -- 방 게시글 번호
    psubject varchar2, -- 글 제목
    pdetail varchar2, -- 글 설명
    pbType varchar2, -- 건물 유형
    pdType varchar2, -- 거래 유형
    paddress varchar2, -- 주소
    peArea number, -- 전용 면적
    psArea number, -- 공급 면적
    psFloor number, -- 해당 층
    ptFloor number, -- 총 층
    proomNum number, -- 방 개수
    pbathroomNum number, -- 욕실 개수
    pdirection varchar2, -- 방향
    pcYear date, -- 준공년도
    pparking number, -- 주차 가능 여부
    pelevator number, -- 엘리베이터 여부
    ppet number, -- 반려동물 여부
    pprice number, -- 가격
    prent number, -- 월세
    pmonthlyFee number -- 월관리비
)
is
    vroomInfoSeq number; -- 방 정보 번호 저장할 변수
begin
    select roomInfoSeq into vroomInfoSeq from tblRoomPost where seq = pseq; -- 방 정보 번호 저장
    
    -- 방 기초 정보 테이블 수정
    update tblRoomBasic set address = paddress, 
                            exclusiveArea = peArea, 
                            supplyArea = psArea, 
                            selectedFloor = psFloor, 
                            totalFloor = ptFloor, 
                            roomNum = proomNum, 
                            bathroomNum = pbathroomNum, 
                            direction = pdirection, 
                            completionYear = pcYear, 
                            parkingFlag = pparking, 
                            elevator = pelevator, 
                            pet = ppet
                            where seq = (select roomBasicSeq from tblRoomInfo where seq = vroomInfoSeq);
    
    -- 방 건물 유형, 방 거래 유형 수정 시 방 정보 테이블 수정
    update tblRoomInfo set roomBuildingTypeSeq = (select seq from tblRoomBuildingType where type = pbType),
                            roomDealTypeSeq = (select seq from tblRoomDealType where type = pdType)
                            where seq = vroomInfoSeq;
    
    -- 방 가격 테이블 수정
    update tblRoomPrice set price = pprice,
                            rent = prent,
                            monthlyFee = pmonthlyFee
                            where seq = (select roomPriceSeq from tblRoomPost where seq = pseq);
    
    -- 방 게시글 테이블 수정                            
    update tblRoomPost set subject = psubject,
                            detail = pdetail
                            where seq = pseq;
    commit;
exception
    when others then
        rollback;
end procReplaceRoomPost;

--begin
--    procReplaceRoomPost(46, '역삼역 방 내놓습니다^^', '방 중개해주실 분~', '원룸', '전세', '서울시 강남구 역삼동', 10.10, 12.12, 2, 5, 1, 2, '남서', to_date('2015', 'yyyy'), 1, 0, 0, 100, 100, 1);
--end;
-------------------------------------------------------------------------------
-- 방 게시글 삭제(방게시글번호 필요)
-------------------------------------------------------------------------------
update tblRoomPost set delFlag = 1 where seq = 방게시글번호;
-------------------------------------------------------------------------------
-- 선택한 방 게시글의 방 이미지 보기(방게시글번호 필요)
-- 이미지주소를 select
-------------------------------------------------------------------------------
select url from tblRoomImg where roomPostSeq = 방게시글번호;
-------------------------------------------------------------------------------
-- 방 이미지 추가(방게시글번호 필요)
-------------------------------------------------------------------------------
insert into tblRoomImg values (seqRoomImg.nextVal, '추가할이미지주소', 방게시글번호);
-------------------------------------------------------------------------------
-- 방 이미지 수정(방이미지번호 필요)
-------------------------------------------------------------------------------
update tblRoomImg set url = '수정할이미지주소' where seq = 방이미지번호;
-------------------------------------------------------------------------------
-- 방 이미지 삭제(방이미지번호 필요)
-------------------------------------------------------------------------------
delete from tblRoomImg where seq = 방이미지번호;
-------------------------------------------------------------------------------
-- 매물 게시글 관련 뷰
-------------------------------------------------------------------------------
create or replace view vwHousePost
as
select
    distinct hpost.seq as seq, -- 글 번호
    hpost.approBrokerSeq as bseq, -- 승인중개사 번호
    b.businessName as bname, -- 사업자 상호
    b.tel as tel, -- 전화번호
    decode(ds.state, 0, '가능', 1, '완료') as state, -- 거래 상태
    bt.type as btype, -- 건물 유형
    dt.type as dtype, -- 거래 유형
    hprice.price as price, -- 매물 가격
    hprice.rent as rent, -- 월세
    hprice.monthlyFee as monthlyFee, -- 월관리비
    hb.address as address, -- 주소
    hb.exclusiveArea as exclusiveArea, -- 전용 면적
    hb.supplyArea as supplyArea, -- 공급 면적
    hb.selectedFloor as selectedFloor, -- 해당 층
    hb.totalFloor as totalFloor, -- 총 층
    hb.roomNum as roomNum, -- 방 개수
    hb.bathroomNum as bathroomNum, -- 욕실 개수
    hb.direction as direction, -- 방향
    to_char(hb.completionYear, 'yyyy') as completionYear, -- 준공년도
    decode(hb.parkingFlag, 0, '불가능', 1, '가능') as parkingFlag, -- 주차 가능 여부
    decode(hb.elevator, 0, '없음', 1, '있음') as elevator, -- 엘리베이터 유무
    decode(hb.pet, 0, '불가능', 1, '가능') as pet, -- 반려동물 유무
    hpost.subject as subject, -- 글 제목
    hpost.content as content, -- 글 설명
    hpost.regDate as regDate -- 등록일
from tblBroker b
    inner join tblApproBroker ab
        on b.seq = ab.brokerSeq
            right outer join tblHousePost hpost
                on ab.seq = hpost.approBrokerSeq
                    left outer join tblHousePrice hprice
                        on hprice.seq = hpost.housePriceSeq
                            inner join tblHouseInfo hi
                                on hi.seq = hpost.houseInfoSeq
                                    inner join tblHouseBuildingType bt
                                        on bt.seq = hi.houseBuildingTypeSeq
                                            inner join tblHouseDealType dt
                                                on dt.seq = hi.houseDealTypeSeq
                                                    inner join tblHouseBasic hb
                                                        on hb.seq = hi.houseBasicSeq
                                                            inner join tblHouseDealState ds
                                                                on ds.housePostSeq = hpost.seq
                                                                    where b.delFlag = 0 and hpost.delFlag = 0
                                                                        order by hpost.regDate desc;
                                                                
select * from vwHousePost;
-------------------------------------------------------------------------------
-- 매물 게시글 총 페이지수 계산하는 함수
-------------------------------------------------------------------------------
create or replace function fnHouseMaxPage(
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwHousePost) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 매물 게시글 전체 목록 조회(최대 10개의 공개된 글 목록을 출력한다. 최신글 순, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace procedure procListHousePost(
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
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
                            parkingFlag, -- 주차가능 여부
                            elevator, -- 엘리베이터 유무
                            pet, -- 반려동물 유무
                            subject, -- 글 제목
                            content, -- 글 설명
                            regDate -- 등록일
                    from (select rownum as rnum, h.* from vwHousePost h)
                        where rnum between 10*(fnHouseMaxPage(ppage)-1)+1 and fnHouseMaxPage(ppage)*10;
end procListHousePost;

declare
    vcursor sys_refcursor;
    vrow vwHousePost%rowtype;
begin
    procListHousePost(3, vcursor);
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        DBMS_OUTPUT.PUT_LINE(vrow.seq||' '||vrow.bseq||' '||vrow.bname||' '||vrow.tel||' '||vrow.state||' '||vrow.btype||' '||vrow.dtype||' '||vrow.price
                            ||' '||vrow.rent||' '||vrow.monthlyFee||' '||vrow.address||' '||vrow.exclusiveArea||' '||vrow.supplyArea
                            ||' '||vrow.selectedFloor||' '||vrow.totalFloor||' '||vrow.roomNum||' '||vrow.bathroomNum||' '||vrow.direction||' '||vrow.completionYear
                            ||' '||vrow.parkingFlag||' '||vrow.elevator||' '||vrow.pet||' '||vrow.subject||' '||vrow.content||' '||vrow.regDate);
        end loop;
end;
-------------------------------------------------------------------------------                                            
-- 매물 게시글 조회
-- 조건 검색 시..... 따로 따로 작성하기는 했지만 경우의 수가 너무 많아져서
-- db에서 처리 안 하고 where절에 and로 연결 연결하여 조회하면 편할 것 같습니다.
-------------------------------------------------------------------------------                                            
-- 특정 게시글 조회 시(상세 페이지 보기, 매물게시글번호 필요)
select * from vwHousePost where seq = 매물게시글번호;

-- 주소 조회 시
select * from (select rownum as rnum, hp.* from vwHousePost hp where address like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
    
-- 제목 조회 시
select * from (select rownum as rnum, hp.* from vwHousePost hp where subject like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
    
-- 건물 유형 조회 시
select * from (select rownum as rnum, hp.* from vwHousePost hp where btype like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
    
-- 거래 유형 조회 시
select * from (select rownum as rnum, hp.* from vwHousePost hp where dtype like '%검색어%')
    where rnum between 10*(페이지수-1)+1 and 페이지수*10;
-------------------------------------------------------------------------------
-- 매물 게시글 작성(이미지 2개의 주소 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddHousePost(
    pbSeq number, -- 승인 중개사 번호
    psubject varchar2, -- 글 제목
    pcontent varchar2, -- 글 설명
    pbType varchar2, -- 건물 유형
    pdType varchar2, -- 거래 유형
    paddress varchar2, -- 주소
    peArea number, -- 전용 면적
    psArea number, -- 공급 면적
    psFloor number, -- 해당 층
    ptFloor number, -- 총 층
    proomNum number, -- 방 개수
    pbathroomNum number, -- 욕실 개수
    pdirection varchar2, -- 방향
    pcYear date, -- 준공년도
    pparking number, -- 주차 가능 여부
    pelevator number, -- 엘리베이터 여부
    ppet number, -- 반려동물 여부
    pprice number, -- 가격
    prent number, -- 월세
    pmonthlyFee number, -- 월관리비
    purl1 varchar2, -- 첫번째 이미지 주소
    purl2 varchar2 -- 두번째 이미지 주소
)
is
begin
    -- 매물 기초 정보 테이블에 추가
    insert into tblHouseBasic
        values (seqHouseBasic.nextVal, paddress, peArea, psArea, psFloor, ptFloor, proomNum, pbathroomNum, pdirection, pcYear, pparking, pelevator, ppet);
    
    -- 매물 가격 테이블에 추가
    insert into tblHousePrice
        values (seqHousePrice.nextVal, pprice, prent, pmonthlyFee);

    -- 매물 정보 테이블에 추가
    insert into tblHouseInfo
        values (seqHouseInfo.nextVal, seqHouseBasic.currVal, (select seq from tblHouseBuildingType where type = pbType), (select seq from tblHouseDealType where type = pdType));
    
    -- 매물 게시글 테이블에 추가
    insert into tblHousePost
        values (seqHousePost.nextVal, pbSeq, seqHouseInfo.currVal, seqHousePrice.currVal, psubject, pcontent, default, 0);
    
    -- 매물 거래 상태 테이블에 추가
    insert into tblHouseDealState
        values (seqHouseDealState.nextVal, seqHousePost.currVal, 0);
        
    -- 매물 이미지 테이블에 추가
    insert into tblHouseImg
        values (seqHouseImg.nextVal, purl1, seqHousePost.currVal);
        
    insert into tblHouseImg
        values (seqHouseImg.nextVal, purl2, seqHousePost.currVal);
    commit;
exception
    when others then
        rollback;
end procAddHousePost;

--begin
--    procAddHousePost(1, '역삼역 초역세권 원룸 월세~', '선착순!', '원룸', '월세', '서울시 강남구 역삼동 역삼빌딩', 32.3, 35.5, 2, 6, 1, 1, '남', to_date('2012', 'yyyy'), 1, 1, 1, 100, 100, 1, 'house0010.jpg', 'house0019.jpg');
--end;
-------------------------------------------------------------------------------
-- 매물 게시글 수정(매물게시글번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procReplaceHousePost(
    pseq number, -- 매물 게시글 번호
    psubject varchar2, -- 글 제목
    pcontent varchar2, -- 글 설명
    pbType varchar2, -- 건물 유형
    pdType varchar2, -- 거래 유형
    paddress varchar2, -- 주소
    peArea number, -- 전용 면적
    psArea number, -- 공급 면적
    psFloor number, -- 해당 층
    ptFloor number, -- 총 층
    proomNum number, -- 방 개수
    pbathroomNum number, -- 욕실 개수
    pdirection varchar2, -- 방향
    pcYear date, -- 준공년도
    pparking number, -- 주차 가능 여부
    pelevator number, -- 엘리베이터 여부
    ppet number, -- 반려동물 여부
    pprice number, -- 가격
    prent number, -- 월세
    pmonthlyFee number -- 월관리비
)
is
    vhouseInfoSeq number; -- 매물 정보 번호 저장할 변수
begin
    select houseInfoSeq into vhouseInfoSeq from tblHousePost where seq = pseq; -- 매물 정보 번호 저장
    
    -- 매물 기초 정보 테이블 수정
    update tblHouseBasic set address = paddress, 
                            exclusiveArea = peArea, 
                            supplyArea = psArea, 
                            selectedFloor = psFloor, 
                            totalFloor = ptFloor, 
                            roomNum = proomNum, 
                            bathroomNum = pbathroomNum, 
                            direction = pdirection, 
                            completionYear = pcYear, 
                            parkingFlag = pparking, 
                            elevator = pelevator, 
                            pet = ppet
                            where seq = (select houseBasicSeq from tblHouseInfo where seq = vhouseInfoSeq);
    
    -- 매물 건물 유형, 매물 거래 유형 수정 시 매물 정보 테이블 수정
    update tblHouseInfo set houseBuildingTypeSeq = (select seq from tblHouseBuildingType where type = pbType),
                            houseDealTypeSeq = (select seq from tblHouseDealType where type = pdType)
                            where seq = vhouseInfoSeq;
    
    -- 매물 가격 테이블 수정
    update tblHousePrice set price = pprice,
                            rent = prent,
                            monthlyFee = pmonthlyFee
                            where seq = (select housePriceSeq from tblHousePost where seq = pseq);

    -- 매물 게시글 테이블 수정
    update tblHousePost set subject = psubject,
                            content = pcontent
                            where seq = pseq;
    commit;
exception
    when others then
        rollback;
end procReplaceHousePost;

--begin
--    procReplaceHousePost(62, '역삼역 희귀 아파트 전세 매물!', '24시간 연락 받습니다.', '아파트', '전세', '서울시 강남구 역삼동 역삼빌딩', 10.10, 12.12, 2, 5, 1, 2, '남서', to_date('2015', 'yyyy'), 1, 0, 0, 100, 100, 1);
--end;    
-------------------------------------------------------------------------------
-- 매물 게시글 삭제(매물게시글번호 필요)
-------------------------------------------------------------------------------
update tblHousePost set delFlag = 1 where seq = 매물게시글번호;
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
-------------------------------------------------------------------------------
-- drop
-------------------------------------------------------------------------------
drop function fnFreeMaxPage;
drop procedure procListFree;
drop procedure procAddFreeMember;
drop procedure procCommentMember;
drop function fnInquiryMaxPage;
drop procedure procListInquiry;
drop procedure procAddInquiryMember;
drop view vwRoomPost;
drop function fnRoomMaxPage;
drop procedure procListRoomPost;
drop procedure procAddRoomPost;
drop procedure procReplaceRoomPost;
drop view vwHousePost;
drop function fnHouseMaxPage;
drop procedure procListHousePost;
drop procedure procAddHousePost;
drop procedure procReplaceHousePost;