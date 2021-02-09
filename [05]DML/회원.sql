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
-- 방 게시글 관련 뷰
-- 방 게시글 관련해서는 이 뷰만 사용해서 가져오려고 생성했습니다.
-- 더 필요한 컬럼 있으면 여기에 추가하면 될 것 같습니다.
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
-- 방 게시글 조회
-- 조건 검색 시..... 따로 따로 작성하기는 했지만 경우의 수가 너무 많아져서
-- db에서 처리 안 하고 where절에 and로 연결 연결하여 조회하면 편할 것 같습니다.
-------------------------------------------------------------------------------
-- 특정 게시글 조회 시
select * from vwRoomPost where seq = 방게시글번호;

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
-- 방 게시글 작성
-- 작성 시 이미지 추가가 필수가 아니라면... 아닌 게 좋을 것 같기도 하고... 정해지면 수정 예정
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
    purl varchar2 -- 이미지 주소
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
        values (seqRoomImg.nextVal, purl, seqRoomPost.currVal);
    commit;
exception
    when others then
        rollback;
end procAddRoomPost;

--begin
--    procAddRoomPost(1, '방 내놓습니다~', '방 중개해주실 중개사분 연락주세요~', '오피스텔', '전세', '서울시 강남구 역삼동', 32.3, 35.5, 2, 6, 1, 1, '남', to_date('2012', 'yyyy'), 1, 1, 1, 1000, 0, 10, 'room0010.jpg');
--end;
-------------------------------------------------------------------------------
-- 방 게시글 수정
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
                                                                
--select * from vwRoomPost where seq = 46;
-------------------------------------------------------------------------------
-- 방 게시글 삭제
-------------------------------------------------------------------------------
update tblRoomPost set delFlag = 1 where seq = 게시글번호;
-------------------------------------------------------------------------------
-- 방 이미지 추가
-------------------------------------------------------------------------------
insert into tblRoomImg values (seqRoomImg.nextVal, '추가할 이미지 주소', 방 게시글 번호);
-------------------------------------------------------------------------------
-- 방 이미지 수정
-------------------------------------------------------------------------------
update tblRoomImg set url = '수정할 주소' where seq = 방 이미지 번호;
-------------------------------------------------------------------------------
-- 방 이미지 삭제
-------------------------------------------------------------------------------
delete from tblRoomImg where seq = 방 이미지 번호;
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
-- 매물 게시글 조회
-- 조건 검색 시..... 따로 따로 작성하기는 했지만 경우의 수가 너무 많아져서
-- db에서 처리 안 하고 where절에 and로 연결 연결하여 조회하면 편할 것 같습니다.
-------------------------------------------------------------------------------                                            
-- 특정 게시글 조회 시
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
-- 매물 게시글 작성
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
    purl varchar2 -- 이미지 주소
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
        values (seqHouseImg.nextVal, purl, seqHousePost.currVal);
    commit;
exception
    when others then
        rollback;
end procAddHousePost;

--begin
--    procAddHousePost(1, '역삼역 희귀 매물!', '선착순!', '원룸', '월세', '서울시 강남구 역삼동 역삼빌딩', 32.3, 35.5, 2, 6, 1, 1, '남', to_date('2012', 'yyyy'), 1, 1, 1, 100, 100, 1, 'house0010.jpg');
--end;
-------------------------------------------------------------------------------
-- 매물 게시글 수정
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
-- 매물 게시글 삭제
-------------------------------------------------------------------------------
update tblHousePost set delFlag = 1 where seq = 1;
-------------------------------------------------------------------------------
-- 매물 이미지 추가
-------------------------------------------------------------------------------
insert into tblHouseImg values (seqHouseImg.nextVal, '추가할 이미지 주소', 매물 게시글 번호);
--select * from tblHouseImg where housePostSeq = 62; -- 103
-------------------------------------------------------------------------------
-- 매물 이미지 수정
-------------------------------------------------------------------------------
update tblHouseImg set url = '수정할 주소' where seq = 매물 이미지 번호;
--update tblHouseImg set url = 'house0020.jpg' where seq = 103;
--select * from tblHouseImg where housePostSeq = 62;
-------------------------------------------------------------------------------
-- 매물 이미지 삭제
-------------------------------------------------------------------------------
delete from tblHouseImg where seq = 매물 이미지 번호;
--delete from tblHouseImg where seq = 103;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- drop
-------------------------------------------------------------------------------
drop view vwRoomPost;
drop procedure procAddRoomPost;
drop procedure procReplaceRoomPost;
drop view vwHousePost;
drop procedure procAddHousePost;
drop procedure procReplaceHousePost;