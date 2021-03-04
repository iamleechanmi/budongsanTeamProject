-- 작성자 : 이찬미
-- [회원] 매물게시글 DML
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
    decode(hb.parkingFlag, 0, '불가능', 1, '가능') as parkingFlag, -- 주차 가능 여부(0 불가능 1 가능)
    decode(hb.elevator, 0, '없음', 1, '있음') as elevator, -- 엘리베이터 유무 (0 없음 1 있음)
    decode(hb.pet, 0, '불가능', 1, '가능') as pet, -- 반려동물 유무(0 불가능 1 가능)
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
                                    
select * from vwhousepost;
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
    psearch varchar2, -- 검색어
    pcursor out sys_refcursor
)
is
begin
    if psearch is null then 
        open pcursor for select
                                seq, -- 글 번호
                                subject, -- 글 제목
                                bname, -- 사업자 상호
                                to_char(regDate, 'yy/mm/dd') as regDate -- 등록일
                        from (select rownum as rnum, h.* from vwHousePost h)
                            where rnum between 10*(fnHouseMaxPage(ppage)-1)+1 and fnHouseMaxPage(ppage)*10;
                            
    elsif psearch is not null then
        open pcursor for select
                                seq, -- 글 번호
                                subject, -- 글 제목
                                bname, -- 사업자 상호
                                to_char(regDate, 'yy/mm/dd') as regDate -- 등록일
                        from (select rownum as rnum, h.* from vwHousePost h)
                            where rnum between 10*(fnHouseMaxPage(ppage)-1)+1 and fnHouseMaxPage(ppage)*10
                            and subject like '%'||psearch||'%' or bname like '%'||psearch||'%';
    end if;
end procListHousePost;
-------------------------------------------------------------------------------                                            
-- 특정 매물 게시글 조회 시(상세 페이지 보기, 매물게시글번호 필요)
-------------------------------------------------------------------------------                                            
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
from vwHousePost where seq = 매물게시글번호;

select rownum, h.* from vwHousePost h where rownum between 1 and 3;
-------------------------------------------------------------------------------
-- 매물 게시글 주소로 검색 시
-------------------------------------------------------------------------------
--create or replace procedure procFindAddressHousePost(
--    ppage number, -- 페이지수
--    paddress varchar2, -- 주소
--    pcursor out sys_refcursor
--)
--is
--begin
--    open pcursor for select
--                                seq, -- 글 번호
--                                subject, -- 글 제목
--                                content, -- 글 설명
--                                bseq, -- 승인중개사 번호
--                                bname, -- 사업자 상호
--                                btype, -- 건물 유형
--                                dtype, -- 거래 유형
--                                price, -- 매물 가격
--                                rent, -- 월세
--                                monthlyFee, -- 관리비
--                                address, -- 주소
--                                exclusiveArea, -- 전용 면적
--                                supplyArea, -- 공급 면적
--                                selectedFloor, -- 해당 층
--                                totalFloor, -- 총 층
--                                roomNum, -- 방 개수
--                                bathroomNum, -- 욕실 개수
--                                direction, -- 방향
--                                completionYear, -- 준공년도
--                                parkingFlag, -- 주차 여부
--                                elevator, -- 엘리베이터
--                                pet, -- 반려동물
--                                to_char(regDate, 'yy/mm/dd') as regDate -- 등록일
--                        from (select rownum as rnum, h.* from vwHousePost h)
--                            where rnum between 10*(fnHouseMaxPage(ppage)-1)+1 and fnHouseMaxPage(ppage)*10
--                            and address like '%'||paddress||'%';
--end procFindAddressHousePost;
-------------------------------------------------------------------------------
-- 매물 게시글 특정 조건으로로 검색 시
-------------------------------------------------------------------------------
--create or replace procedure procFindHousePost(
--    ppage number, -- 페이지수
--    pdtype varchar2, -- 거래 유형
--    pbtype varchar2, -- 건물 종류
--    proomNum number, -- 방 개수
--    paddress varchar2, -- 지역
--    pexclusivearea varchar2, -- 면적
--    pprice number,  -- 가격
--    prent number, -- 월세
--    pparkingflag varchar2, -- 주차 여부
--    pelevator varchar2, -- 엘리베이터
--    ppet varchar2, -- 반려동물
--    pcursor out sys_refcursor
--)
--is
--begin
--    open pcursor for select
--                                seq, -- 글 번호
--                                subject, -- 글 제목
--                                content, -- 글 설명
--                                bseq, -- 승인중개사 번호
--                                bname, -- 사업자 상호
--                                btype, -- 건물 유형
--                                dtype, -- 거래 유형
--                                price, -- 매물 가격
--                                rent, -- 월세
--                                monthlyFee, -- 관리비
--                                address, -- 주소
--                                exclusiveArea, -- 전용 면적
--                                supplyArea, -- 공급 면적
--                                selectedFloor, -- 해당 층
--                                totalFloor, -- 총 층
--                                roomNum, -- 방 개수
--                                bathroomNum, -- 욕실 개수
--                                direction, -- 방향
--                                completionYear, -- 준공년도
--                                parkingFlag, -- 주차 여부
--                                elevator, -- 엘리베이터
--                                pet, -- 반려동물
--                                to_char(regDate, 'yy/mm/dd') as regDate -- 등록일
--                        from (select rownum as rnum, h.* from vwHousePost h)
--                            where rnum between 10*(fnHouseMaxPage(ppage)-1)+1 and fnHouseMaxPage(ppage)*10
--                            and dtype like '%'||pdtype||'%' and btype like '%'||pbtype||'%'
--                            and roomNum like '%'||proomNum||'%' and address like '%'||paddress||'%'
--                            and exclusivearea like '%'||pexclusivearea||'%' and price like '%'||pprice||'%'
--                            and rent like '%'||prent||'%' and parkingFlag like '%'||pparkingFlag||'%'
--                            and elevator like '%'||pelevator||'%' and pet like '%'||ppet||'%';
--end procFindHousePost;
-------------------------------------------------------------------------------
-- 매물 게시글 작성(승인중개사번호, 이미지 2개의 주소 필요)
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
    pcYear varchar2, -- 준공년도
    pparking number, -- 주차 가능 여부
    pelevator number, -- 엘리베이터 여부
    ppet number, -- 반려동물 여부
    pprice number, -- 가격
    prent number, -- 월세
    pmonthlyFee number, -- 월관리비
    purl1 varchar2, -- 첫번째 이미지 주소
    purl2 varchar2, -- 두번째 이미지 주소
    ppseq number -- 방 게시글 번호
)
is
begin
    -- 방 게시글에서 삭제
    update tblRoomPost set delFlag = 1 where seq = ppseq;
    
    -- 매물 기초 정보 테이블에 추가
    insert into tblHouseBasic
        values (seqHouseBasic.nextVal, paddress, peArea, psArea, psFloor, ptFloor, proomNum, pbathroomNum, pdirection, to_date(pcYear, 'yyyy'), pparking, pelevator, ppet);
    
    -- 매물 가격 테이블에 추가
    insert into tblHousePrice
        values (seqHousePrice.nextVal, pprice, prent, pmonthlyFee);

    -- 매물 정보 테이블에 추가
    insert into tblHouseInfo
        values (seqHouseInfo.nextVal, seqHouseBasic.currVal, (select seq from tblHouseBuildingType where type = pbType), (select seq from tblHouseDealType where type = pdType));
    
    -- 매물 게시글 테이블에 추가
    insert into tblHousePost values (seqHousePost.nextVal, pbSeq, seqHouseInfo.currVal, seqHousePrice.currVal, psubject, pcontent, sysdate, 0);
    
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

commit;
select * from vwhousepost;
begin
    procAddHousePost(1, '[월세] 초역세권', '선착순!', '원룸', '월세', '서울시 강남구 역삼동 역삼빌딩', 32.3, 35.5, 2, 6, 1, 1, '남', '2012', 1, 1, 1, 100, 100, 1, 'house0010.jpg', 'house0008.jpg', 1);
end;
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


select seq, bseq, subject, address, to_char(regdate, 'yy/mm/dd') as regdate, state
from (select rownum as rnum, h.* from vwHousePost h where h.state = '가능') where rnum between 1 and 3;
-------------------------------------------------------------------------------
-- 허위 매물 신고하기
-------------------------------------------------------------------------------
create or replace procedure procAddFalseReport(
    pmseq number, -- 회원 번호
    phseq number, -- 매물 게시글 번호
    preportReason varchar2 -- 신고 사유
)
is
begin
    -- 허위 매물 신고 테이블에 추가
    insert into tblFalseReport
        values (seqFalseReport.nextVal, phseq, pmseq, preportReason, sysdate, 0);
    commit;
exception
    when others then
        rollback;
end procAddFalseReport;

--begin
--    procAddFalseReport(1, 2, '문의한 가격과 다름');
--end;