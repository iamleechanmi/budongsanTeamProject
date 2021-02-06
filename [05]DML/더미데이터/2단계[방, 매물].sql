-- 2단계[방, 매물].sql

-- 방정보 tblRoomInfo(seq, roomBasicSeq, roomBuildingTypeSeq, roomDealTypeSeq)

-- 오피스텔 전세 1~5 월세 6~10
insert into tblRoomInfo values (seqRoomInfo.nextVal, 1, 6, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 2, 6, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 3, 6, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 4, 6, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 5, 6, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 6, 6, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 7, 6, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 8, 6, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 9, 6, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 10, 6, 3);

-- 원룸 전세 11 월세 12~20
insert into tblRoomInfo values (seqRoomInfo.nextVal, 11, 4, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 12, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 13, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 14, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 15, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 16, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 17, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 18, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 19, 4, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 20, 4, 3);

-- 투룸 전세 21~25 월세 26~30
insert into tblRoomInfo values (seqRoomInfo.nextVal, 21, 5, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 22, 5, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 23, 5, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 24, 5, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 25, 5, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 26, 5, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 27, 5, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 28, 5, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 29, 5, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 30, 5, 3);

-- 아파트 매매 31~35 전세 36~38 월세 39~40
insert into tblRoomInfo values (seqRoomInfo.nextVal, 31, 1, 1);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 32, 1, 1);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 33, 1, 1);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 34, 1, 1);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 35, 1, 1);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 36, 1, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 37, 1, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 38, 1, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 39, 1, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 40, 1, 3);

-- 오피스텔 전세 41~42 월세 43~45
insert into tblRoomInfo values (seqRoomInfo.nextVal, 41, 6, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 42, 6, 2);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 43, 6, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 44, 6, 3);
insert into tblRoomInfo values (seqRoomInfo.nextVal, 45, 6, 3);

select * from tblRoomInfo;

-- 매물정보 tblHouseInfo(seq, houseBasicSeq, houseBuildingTypeSeq, houseDealTypeSeq)

-- 오피스텔 전세 1~5 월세 6~10
insert into tblHouseInfo values (seqHouseInfo.nextVal, 1, 6, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 2, 6, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 3, 6, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 4, 6, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 5, 6, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 6, 6, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 7, 6, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 8, 6, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 9, 6, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 10, 6, 3);

-- 원룸 전세 11 월세 12~20
insert into tblHouseInfo values (seqHouseInfo.nextVal, 11, 4, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 12, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 13, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 14, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 15, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 16, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 17, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 18, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 19, 4, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 20, 4, 3);

-- 투룸 전세 21~25 월세 26~30
insert into tblHouseInfo values (seqHouseInfo.nextVal, 21, 5, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 22, 5, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 23, 5, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 24, 5, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 25, 5, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 26, 5, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 27, 5, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 28, 5, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 29, 5, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 30, 5, 3);

-- 아파트 매매 31~35 전세 36~38 월세 39~40
insert into tblHouseInfo values (seqHouseInfo.nextVal, 31, 1, 1);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 32, 1, 1);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 33, 1, 1);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 34, 1, 1);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 35, 1, 1);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 36, 1, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 37, 1, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 38, 1, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 39, 1, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 40, 1, 3);

-- 원룸 전세 41 월세 42~45
insert into tblHouseInfo values (seqHouseInfo.nextVal, 41, 1, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 42, 1, 2);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 43, 1, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 44, 1, 3);
insert into tblHouseInfo values (seqHouseInfo.nextVal, 45, 1, 3);

select * from tblHouseInfo;