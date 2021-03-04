-- 작성자 : 이찬미
-- [회원] 방게시글 DML 
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