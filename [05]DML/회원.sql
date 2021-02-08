-- 회원 dml

-- 회원 가입
insert into tblMember values (seqMember.nextVal, '이메일주소', '비밀번호', '이름', '주민등록번호', '핸드폰번호', '주소', 0);

-- 아이디 찾기
select email from tblMember where name = '이름' and ssn = '주민등록번호' and phone = '핸드폰번호';
    
-- 비밀번호 찾기
select pw from tblMember where name = '이름' and ssn = '주민등록번호' and email = '이메일주소';

-- 방 게시글 관련 뷰
-- 방 게시글 관련해서는 이 뷰만 사용해서 가져오려고 생성했습니다.
-- 더 필요한 컬럼 있으면 여기에 추가하면 될 것 같습니다.
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
                                                        order by rpost.seq;
                                                                
select * from vwRoomPost;

-- 방 게시글 조회
-- 주소 조회 시
select * from vwRoomPost where address like '%검색어%';

-- 제목 조회 시
select * from vwRoomPost where subject like '%검색어%';

-- 건물 유형 조회 시
select * from vwRoomPost where btype like '%검색어%';

-- 거래 유형 조회 시
select * from vwRoomPost where dtype like '%검색어%';

-- 방 게시글 작성
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
        values (seqRoomInfo.nextVal, seqRoomBasic.currVal, (select seq from tblRoomBuildingType where type=pbType), (select seq from tblRoomDealType where type=pdType));
    
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

-- 방 게시글 수정
-- <*미완료> 공란일 경우 처리하기
create or replace procedure procReplaceRoomPost(
    pseq number, -- 게시글 번호
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

-- 방 게시글 삭제
update tblRoomPost set delFlag = 1 where seq = 게시글번호;

-- 방 이미지 추가
insert into tblRoomImg values (seqRoomImg.nextVal, '추가할 주소', 방 게시글 번호);

-- 방 이미지 수정
update tblRoomImg set url = '수정할 주소' where seq = 방 이미지 번호;

-- 방 이미지 삭제
delete from tblRoomImg where seq = 방 이미지 번호;

-- 매물 게시글 관련 뷰
create or replace view vwHousePost
as
select
    distinct hpost.seq as seq, -- 글 번호
    hpost.approBrokerSeq as bseq, -- 승인중개사 번호
    b.businessName as bname, -- 상호
    b.tel as tel, -- 전화번호
    bt.type as btype, -- 건물 유형
    dt.type as dtype, -- 거래 유형
    hprice.price as price, -- 매물 가격
    hprice.rent as rent, -- 월세
    hprice.monthlyFee as monthlyFee, -- 월관리비
    hb.address as address, -- 주소
    
from tblBroker b
    inner join tblApproBroker ab
        on b.seq = ab.brokerSeq
            inner join tblHousePost hpost
                on ab.seq = hpost.approBrokerSeq
                    inner join tblHousePrice hprice
                        on hprice.seq = hpost.housePriceSeq
                            inner join tblHouseInfo hi
                                on hi.seq = hpost.houseInfoSeq
                                    inner join tblHouseBuildingType bt
                                        on bt.seq = hi.houseBuildingTypeSeq
                                            inner join tblHouseDealType dt
                                                on dt.seq = hi.houseDealTypeSeq
                                                    inner join tblHouseBasic hb
                                                        on hb.seq = hi.houseBasicSeq
                                                            where b.delFlag = 0 and hpost.delFlag = 0
                                                                order by hpost.seq;
                                            
                                


-- drop
drop view vwRoomPost;
drop procedure procAddRoomPost;
drop procedure procReplaceRoomPost;