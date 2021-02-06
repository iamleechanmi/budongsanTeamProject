-- 1단계[방, 매물].sql

-- 방거래유형 tblRoomDealType(seq, type)

-- 1 매매 2 전세 3 월세
insert into tblRoomDealType values (seqRoomDealType.nextVal, '매매');
insert into tblRoomDealType values (seqRoomDealType.nextVal, '전세');
insert into tblRoomDealType values (seqRoomDealType.nextVal, '월세');

select * from tblRoomDealType;

-- 매물거래유형 tblHouseDealType(seq, type)

-- 1 매매 2 전세 3 월세
insert into tblHouseDealType values (seqHouseDealType.nextVal, '매매');
insert into tblHouseDealType values (seqHouseDealType.nextVal, '전세');
insert into tblHouseDealType values (seqHouseDealType.nextVal, '월세');

select * from tblHouseDealType;

-- 방건물유형 tblRoomBuildingType (seq, type)

-- 1 아파트 2 빌라 3 주택 4 원룸 5 투룸 6 오피스텔
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '아파트');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '빌라');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '주택');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '원룸');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '투룸');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '오피스텔');

select * from tblRoomBuildingType;

-- 매물건물유형 tblHouseBuildingType (seq, type)

-- 1 아파트 2 빌라 3 주택 4 원룸 5 투룸 6 오피스텔
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '아파트');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '빌라');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '주택');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '원룸');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '투룸');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '오피스텔');

select * from tblHouseBuildingType;

-- 방기초정보 tblRoomBasic(seq, address, exclusiveArea, supplyArea, selectedFloor, totalFloor, roomNum, bathroomNum, direction, completionYear, parkingFlag, elevator, pet)

-- 오피스텔 1~10
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 718-27', 25.68, 32.93, 3, 9, 1, 1, '남', to_date('2003', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 719-24, 1동', 17.57, 42.36, 5, 18, 1, 1, '남', to_date('2019', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 736-22', 20.1, 40.38, 10, 12, 1, 1, '남서', to_date('2006', 'yyyy'), 0, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 823-26', 29.73, 58.57, 8, 13, 1, 1, '서', to_date('2004', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 823-7', 17.23, 28.49, 3, 4, 1, 1, '동', to_date('2004', 'yyyy'), 0, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 823-3', 28.12, 47.17, 13, 14, 1, 1, '남', to_date('2004', 'yyyy'), 0, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 736-24', 28.64, 55.12, 4, 12, 1, 1, '북동', to_date('2004', 'yyyy'), 0, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 828-28', 27.67, 42.95, 5, 9, 1, 1, '남', to_date('2012', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 735-17', 23.9, 49.84, 12, 15, 1, 1, '서', to_date('2003', 'yyyy'), 0, 1, 0); 
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 735-11', 32.99, 60.43, 5, 11, 1, 1, '남서', to_date('2003', 'yyyy'), 0, 1, 0);

-- 원룸 11~20
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 643-16', 23.1, 39.6, 4, 5, 1, 1, '남서', to_date('2002', 'yyyy'), 1, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 645-6', 28, 131.21, 2, 3, 1, 1, '남', to_date('2001', 'yyyy'), 1, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 828-24', 19.8, 19.8, 1, 4, 1, 1, '북', to_date('2005', 'yyyy'), 0, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 828-38', 26.44, 52.89, 3, 5, 1, 1, '남', to_date('2010', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 740-11', 29.75, 42.97, 2, 4, 1, 1, '남동', to_date('2014', 'yyyy'), 1, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 741-39', 23.14, 49.58, 1, 5, 1, 1, '동', to_date('2008', 'yyyy'), 1, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 739-9', 26.44, 33.04, 3, 4, 1, 1, '남', to_date('2009', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 740-18', 29.75, 46.28, 4, 5, 1, 1, '남서', to_date('2013', 'yyyy'), 0, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 743-11', 29.75, 59.5, 3, 5, 1, 1, '남서', to_date('2014', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 827-29', 23.14, 23.14, 1, 6, 1, 1, '남', to_date('2004', 'yyyy'), 0, 1, 0);

-- 투룸 21~30
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 745-24', 27.78, 33, 5, 6, 2, 1, '동', to_date('2005', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 745-1, 102동', 28.45, 35.42, 3, 6, 2, 1, '북동', to_date('2012', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 741-35', 49.58, 76.03, 5, 6, 2, 1, '남', to_date('2014', 'yyyy'), 1, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 750-7', 59.5, 79.33, 1, 5, 2, 1, '서', to_date('2009', 'yyyy'), 0, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 792-33', 49.58, 66.11, 5, 6, 2, 1, '남동', to_date('2005', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 749-3', 23, 30.13, 4, 5, 2, 1, '서', to_date('2016', 'yyyy'), 1, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 748-27', 46, 60, 4, 5, 2, 1, '남', to_date('2002', 'yyyy'), 0, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 828-42', 19, 24, 5, 5, 2, 1, '동', to_date('2010', 'yyyy'), 1, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 741-37', 38.21, 133.41, 1, 3, 2, 1, '남동', to_date('2013', 'yyyy'), 1, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 828-43', 49.59, 137.94, 2, 3, 2, 1, '남동', to_date('2014', 'yyyy'), 1, 0, 0);

-- 아파트 31~40
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 823-7, 1동', 17.23, 24.27, 8, 13, 1, 1, '남', to_date('2004', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 741-22', 62.47, 72.36, 3, 4, 2, 1, '남서', to_date('2004', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 745-13, 1동', 84.84, 111.6, 4, 7, 3, 2, '남', to_date('2017', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 745-13, 1동', 84.84, 111.6, 3, 7, 3, 2, '남', to_date('2017', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 824-25, 1동', 43.99, 59.69, 11, 13, 1, 1, '남', to_date('2004', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 826-29, 1동', 57.98, 67.88, 10, 15, 2, 2, '동', to_date('2004', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 636-33, 102동', 76.87, 88.16, 10, 10, 3, 2, '남서', to_date('2006', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 633-11, 101동', 108.23, 123.63, 4, 6, 3, 2, '남', to_date('2005', 'yyyy'), 1, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 826-29, 1동', 57.98, 67.88, 10, 15, 2, 2, '동', to_date('2004', 'yyyy'), 1, 1, 0); 
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 830-46, 1동', 76.61, 92.4, 7, 7, 3, 2, '동', to_date('2003', 'yyyy'), 1, 0, 0);

-- 오피스텔 41~45
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 678-6, 1동', 16.83, 28.35, 10, 13, 1, 1, '서', to_date('2017', 'yyyy'), 1, 1, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 677-4', 36.24, 69.75, 8, 12, 1, 1, '남', to_date('2004', 'yyyy'), 1, 1, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 677-8', 21.15, 32.15, 6, 6, 1, 1, '남', to_date('2013', 'yyyy'), 1, 0, 0);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울특별시 강남구 역삼동 727-2', 25.76, 39.63, 7, 7, 1, 1, '남', to_date('2012', 'yyyy'), 0, 0, 1);
insert into tblRoomBasic values (seqRoomBasic.nextVal, '서울시 강남구 역삼동 727-9, 1동', 15.9, 30.22, 5, 8, 1, 1, '동', to_date('2012', 'yyyy'), 0, 0, 1);

select * from tblRoomBasic;

-- 매물기초정보 tblHouseBasic(seq, address, exclusiveArea, supplyArea, selectedFloor, totalFloor, roomNum, bathroomNum, direction, completionYear, parkingFlag, elevator, pet)

-- 오피스텔 1~10
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 718-27', 25.68, 32.93, 3, 9, 1, 1, '남', to_date('2003', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 719-24, 1동', 17.57, 42.36, 5, 18, 1, 1, '남', to_date('2019', 'yyyy'), 1, 1, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 736-22', 20.1, 40.38, 10, 12, 1, 1, '남서', to_date('2006', 'yyyy'), 0, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 823-26', 29.73, 58.57, 8, 13, 1, 1, '서', to_date('2004', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 823-7', 17.23, 28.49, 3, 4, 1, 1, '동', to_date('2004', 'yyyy'), 0, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 823-3', 28.12, 47.17, 13, 14, 1, 1, '남', to_date('2004', 'yyyy'), 0, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 736-24', 28.64, 55.12, 4, 12, 1, 1, '북동', to_date('2004', 'yyyy'), 0, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 828-28', 27.67, 42.95, 5, 9, 1, 1, '남', to_date('2012', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 735-17', 23.9, 49.84, 12, 15, 1, 1, '서', to_date('2003', 'yyyy'), 0, 1, 0); 
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 735-11', 32.99, 60.43, 5, 11, 1, 1, '남서', to_date('2003', 'yyyy'), 0, 1, 0);

-- 원룸 11~20
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 643-16', 23.1, 39.6, 4, 5, 1, 1, '남서', to_date('2002', 'yyyy'), 1, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 645-6', 28, 131.21, 2, 3, 1, 1, '남', to_date('2001', 'yyyy'), 1, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 828-24', 19.8, 19.8, 1, 4, 1, 1, '북', to_date('2005', 'yyyy'), 0, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 828-38', 26.44, 52.89, 3, 5, 1, 1, '남', to_date('2010', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 740-11', 29.75, 42.97, 2, 4, 1, 1, '남동', to_date('2014', 'yyyy'), 1, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 741-39', 23.14, 49.58, 1, 5, 1, 1, '동', to_date('2008', 'yyyy'), 1, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 739-9', 26.44, 33.04, 3, 4, 1, 1, '남', to_date('2009', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 740-18', 29.75, 46.28, 4, 5, 1, 1, '남서', to_date('2013', 'yyyy'), 0, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 743-11', 29.75, 59.5, 3, 5, 1, 1, '남서', to_date('2014', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 827-29', 23.14, 23.14, 1, 6, 1, 1, '남', to_date('2004', 'yyyy'), 0, 1, 0);

-- 투룸 21~30
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 745-24', 27.78, 33, 5, 6, 2, 1, '동', to_date('2005', 'yyyy'), 1, 1, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 745-1, 102동', 28.45, 35.42, 3, 6, 2, 1, '북동', to_date('2012', 'yyyy'), 1, 1, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 741-35', 49.58, 76.03, 5, 6, 2, 1, '남', to_date('2014', 'yyyy'), 1, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 750-7', 59.5, 79.33, 1, 5, 2, 1, '서', to_date('2009', 'yyyy'), 0, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 792-33', 49.58, 66.11, 5, 6, 2, 1, '남동', to_date('2005', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 749-3', 23, 30.13, 4, 5, 2, 1, '서', to_date('2016', 'yyyy'), 1, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 748-27', 46, 60, 4, 5, 2, 1, '남', to_date('2002', 'yyyy'), 0, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 828-42', 19, 24, 5, 5, 2, 1, '동', to_date('2010', 'yyyy'), 1, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 741-37', 38.21, 133.41, 1, 3, 2, 1, '남동', to_date('2013', 'yyyy'), 1, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 828-43', 49.59, 137.94, 2, 3, 2, 1, '남동', to_date('2014', 'yyyy'), 1, 0, 0);

-- 아파트 31~40
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 823-7, 1동', 17.23, 24.27, 8, 13, 1, 1, '남', to_date('2004', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 741-22', 62.47, 72.36, 3, 4, 2, 1, '남서', to_date('2004', 'yyyy'), 1, 1, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 745-13, 1동', 84.84, 111.6, 4, 7, 3, 2, '남', to_date('2017', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 745-13, 1동', 84.84, 111.6, 3, 7, 3, 2, '남', to_date('2017', 'yyyy'), 1, 1, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 824-25, 1동', 43.99, 59.69, 11, 13, 1, 1, '남', to_date('2004', 'yyyy'), 1, 1, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 826-29, 1동', 57.98, 67.88, 10, 15, 2, 2, '동', to_date('2004', 'yyyy'), 1, 1, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 636-33, 102동', 76.87, 88.16, 10, 10, 3, 2, '남서', to_date('2006', 'yyyy'), 1, 1, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 633-11, 101동', 108.23, 123.63, 4, 6, 3, 2, '남', to_date('2005', 'yyyy'), 1, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 826-29, 1동', 57.98, 67.88, 10, 15, 2, 2, '동', to_date('2004', 'yyyy'), 1, 1, 0); 
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 830-46, 1동', 76.61, 92.4, 7, 7, 3, 2, '동', to_date('2003', 'yyyy'), 1, 0, 0);

-- 원룸 41~45
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 828-44', 49.58, 59.5, 4, 6, 1, 1, '남', to_date('2002', 'yyyy'), 1, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 746-3, A동', 26.07, 35.4, 2, 5, 1, 1, '남', to_date('2002', 'yyyy'), 1, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 745-5', 29.75, 33.05, 4, 4, 1, 1, '남', to_date('2014', 'yyyy'), 0, 0, 0);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 725-60', 26.44, 52.89, 3, 4, 1, 1, '서', to_date('2002', 'yyyy'), 1, 0, 1);
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울특별시 강남구 역삼동 643-16', 23.1, 39.6, 4, 5, 1, 1, '남서', to_date('2003', 'yyyy'), 1, 0, 1);

select * from tblHouseBasic;

-- 방가격 tblRoomPrice(seq, price, rent, monthlyFee)

-- 가격 단위는 1) 1 ~ 10 사이면 억 2) 50 이상이면 만원
-- 관리비 단위는 만원

-- 전세 1~5 월세 6~10
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.45, default, 1.2);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.3, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3.45, default, 16);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1.8, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 4, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 130, 130, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 65, 9);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 500, 95, 11);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 500, 75, 9);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3000, 75, 10);

-- 전세 11 월세 12~20
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1.5, default, 0);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2000, 40, 5);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 500, 70, 7);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 60, 5);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 65, 9);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 65, 5);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 90, 90, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 110, 110, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 200, 170, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 120, 85, 7);

-- 전세 21~25 월세 26~30
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.1, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 4, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 5, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1.85, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.8, default, 12);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 150, 7);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 85, 5);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2000, 155, 16);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3000, 125, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2000, 140, 10);

-- 매매 31~35 전세 36~38 월세 39~40
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.1, default, 1);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3.3, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 4.5, default, 12);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3.2, default, 15);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3.3, default, 15);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.3, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3.45, default, 15);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 85, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2000, 140, 10);

-- 전세 41~42 월세 43~45
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.1, default, 0.6);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2.2, default, 0.5);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 500, 55, 1);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 68, 68, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 75, 75, 7);

select * from tblRoomPrice;

-- 매물가격 tblHousePrice(seq, price, rent, monthlyFee)

-- 가격 단위는 1) 1 ~ 10 사이면 억 2) 50 이상이면 만원
-- 관리비 단위는 만원

-- 전세 1~5 월세 6~10
insert into tblHousePrice values (seqHousePrice.nextVal, 2.45, default, 1.2);
insert into tblHousePrice values (seqHousePrice.nextVal, 2.3, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 3.45, default, 16);
insert into tblHousePrice values (seqHousePrice.nextVal, 1.8, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 4, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 130, 130, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 65, 9);
insert into tblHousePrice values (seqHousePrice.nextVal, 500, 95, 11);
insert into tblHousePrice values (seqHousePrice.nextVal, 500, 75, 9);
insert into tblHousePrice values (seqHousePrice.nextVal, 3000, 75, 10);

-- 전세 11 월세 12~20
insert into tblHousePrice values (seqHousePrice.nextVal, 1.5, default, 0);
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 40, 5);
insert into tblHousePrice values (seqHousePrice.nextVal, 500, 70, 7);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 60, 5);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 65, 9);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 65, 5);
insert into tblHousePrice values (seqHousePrice.nextVal, 90, 90, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 110, 110, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 200, 170, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 120, 85, 7);

-- 전세 21~25 월세 26~30
insert into tblHousePrice values (seqHousePrice.nextVal, 2.1, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 4, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 5, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 1.85, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 2.8, default, 12);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 150, 7);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 85, 5);
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 155, 16);
insert into tblHousePrice values (seqHousePrice.nextVal, 3000, 125, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 140, 10);

-- 매매 31~35 전세 36~38 월세 39~40
insert into tblHousePrice values (seqHousePrice.nextVal, 2.1, default, 1);
insert into tblHousePrice values (seqHousePrice.nextVal, 3.3, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 4.5, default, 12);
insert into tblHousePrice values (seqHousePrice.nextVal, 3.2, default, 15);
insert into tblHousePrice values (seqHousePrice.nextVal, 3.3, default, 15);
insert into tblHousePrice values (seqHousePrice.nextVal, 2.3, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 2, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 3.45, default, 15);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 85, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 140, 10);

-- 전세 41 월세 42~45
insert into tblHousePrice values (seqHousePrice.nextVal, 1.4, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 100, 100, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 55, 5);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 65, 6);
insert into tblHousePrice values (seqHousePrice.nextVal, 150, 150, 20);

select * from tblHousePrice;
