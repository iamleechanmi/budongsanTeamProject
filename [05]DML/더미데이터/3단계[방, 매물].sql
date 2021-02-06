-- 3단계[방, 매물].sql

-- 방게시글 tblRoomPost(seq, memberSeq, roomInfoSeq, roomPriceSeq, subject, detail, regDate, delFlag)

-- 작성 예정

-- 매물게시글 tblHousePost(seq, approBrokerSeq, houseInfoSeq, housePriceSeq, subject, content, regDate, delFlag)

-- 승인중개사가 20명 있다 가정 하에
insert into tblHousePost values (seqHousePost.nextVal, 10, 1, 1, '강남역 도보3분 빌트인 풀옵션', '안녕하세요. 저는 항상 직접 촬영한 실매물만 취급합니다(보증금조정가능) 🎬 내.외부 환경 및 인테리어 🎬 ✔ 빌트인 테라스완비 채광 및 전망까지 좋은 호실입니다.', to_date('2021-01-02', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 4, 2, 2, '역삼역 초역세권 풀옵션 오피스텔', '역삼역 도보2분거리 강남역 도보7분거리 전망좋음 주변 편의시설 훌륭함 채광 굿굿굿', to_date('2021-01-03', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 11, 3, 3, '깔끔하고 넓은 호실입니다.', '단기 매물 다수 보유 중이니 편하게 문의 주세요.', to_date('2021-01-04', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 4, 4, '강남역 오피스텔', '강남역 오피스텔 입니다 이외 다른 매물도 함께 같이 보실수 있습니다. 모두 직접 촬영한 실매물, 실사진, 실가격 광고를 등록하고 있습니다.', to_date('2021-01-05', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 5, 5, '할인가능VV 리모델링,통창,보안', '매일 실매물을 직접 찍어 올리며 내집구하듯 꼼꼼하게 체크/확인해드리겠습니다.', to_date('2021-01-06', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 17, 6, 6, 'UU월세보증금협의가능UU 1달 가능한 신축급 역삼역 도보5분 깔끔한 풀옵션 오피스텔', '한달 가능 강남역 & 역삼역 도보 5분(신축급) 깨끗하고 깔끔한 풀옵션~!!', to_date('2021-01-07', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 7, 7, '월세 강남대성학원생들 추천', '중개대상물 종류(용도) : 업무시설(오피스텔) 임대 : 일반임대 구조형태 : 오픈형 근처시설 : 스포츠센터, 주민센터, 문화센터 등등', to_date('2021-01-08', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 8, 8, '가성비 초특급 오피스텔', '☛  역삼역 도보5분으로 지하철 이용이 가능합니다! ☛  도보5분이내 버스정류장이 있어 교통이 편리합니다! ☛  각종 편의시설이 주위에 위치하고 있습니다!', to_date('2021-01-09', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 3, 9, 9, '1달 가능한 신축급 역삼역 도보5분 풀옵션 오피스텔', '1층 현관보안,비디오폰,CCTV,카드키 사용으로 보안철저!! 강남 서초 송파 전지역 매물 보유. 강남 전지역 픽업가능합니다', to_date('2021-01-10', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 20, 10, 10, '강남역 도보5분 빌트인 풀옵션 깔끔하고 넓은 호실', '은행,병원,약국,초중고학교,대중교통,카페,편의점,마트 PC방,세탁소,빨래방 등 각종 편의시설이 인접해 있습니다. 365일 24시간 언제나 상담,중개 가능합니다. ', to_date('2021-01-11', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 7, 11, 11, '역삼역세권 직장인추천 원룸 귀한 전세', '* 주차편리 * 생활편의시설 다양하게 위치 * 조용한 주거단지 * 채광 및 통풍 좋은 집', to_date('2021-01-12', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 2, 12, 12, '할인가능VV 올수리첫입주,선착순', 'ㅇ 역삼역 도보 5분거리 ㅇ 교통이 편리하고 접근성이 뛰어남', to_date('2021-01-13', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 13, 13, '역삼역 3분 거리 위치한 원룸 풀옵션 단기임대', '○ 24시 전화 or 문자 문의 가능!! 늦은 시간에도 친절한 상담 도와드리겠습니다. 편하게 문의주세요~ ○ 퇴근시간 이후 늦은 시간에도 부동산 방문 및 매물 확인 가능합니다!​', to_date('2021-01-14', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 14, 14, '우드톤 저렴하고 넓은 풀옵션 원룸 치안좋은 원룸', '-풀옵션 -저렴한 가격에 완전 넓은 평수 -보안이좋음', to_date('2021-01-15', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 14, 15, 15, '역삼역 3분거리 깔끔한 월세 세미 분리형 원룸', '▷▶ 베란다있어서 공간활용 좋아요 ▷▶ 주방 세미분리형 좋아요 ▷▶ 역삼역 3분거리 근접해서 좋아요 ▷▶ 화장실 샤워부스 좋아요', to_date('2021-01-16', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 16, 16, 16, '월세 강남대성학원생들 추천', '◐ 난방방식 : 개별난방 ◐ 보안시설 : 현관 도어락 설치, 인터폰', to_date('2021-01-17', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 17, 17, '조용하고 여유공간이 있는 추천 원룸', '-빌트인으로 공간활용 유리 -가격대비 넓은 평수 -체리톤과 화이트톤에 조화 -풀옵션 원룸', to_date('2021-01-17', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 2, 18, 18, '유럽풍 인테리어로 리모델링 완료된 원룸', '-리모델링 완료된 신축급 매물 -조명이 세련되고 밝음 -빌트인으로 공간활용 유리 -가격대비 최고의 인테리어 가성비 좋음 -채광좋고 환기 잘됨', to_date('2021-01-18', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 5, 19, 19, '올수리첫입주, 선착순', 'ㅇ 역삼역 도보 5분거리 ㅇ 교통이 편리하고 접근성이 뛰어남', to_date('2021-01-18', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 7, 20, 20, '보안,통창,전망', 'ㅇ 강남역 도보 3분거리, 강남역 도보거리 ㅇ 강남대로와 버스노선 다수', to_date('2021-01-20', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 21, 21, '역삼역 도보 5분 귀한 투룸 전세', '▶ 역삼역 도보5분 조용한 주택가 ▶ 수도요금 포함 ▶ 1년 계약만 가능, 혼자사시는 분만 가능', to_date('2021-01-21', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 4, 22, 22, '초역세권역삼역 예쁜방 넓은투룸', '역삼역 도보 5분거리. 깔끔하고 넓은 투룸.', to_date('2021-01-22', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 15, 23, 23, '역삼동 투룸 거실공간 굿', '- 역삼동 신축 투룸 오늘 나온 매물 입니다 - 깨끗하게 사용 중이며, 안방 붙밖이장 까지 잘 되어 있습니다.', to_date('2021-01-23', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 24, 24, '깔끔한 투룸 전세', '▷▶ 맞벽나온 거실 좋아요 ▷▶ 에.세.냉 풀옵션 좋아요', to_date('2021-01-23', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 5, 25, 25, '몇없는 전세 방입니다.', '✔옵션: 에어컨, 냉장고, 세탁기 ✔주용도: 다세대주택 ✔보안: 보안시설o', to_date('2021-01-24', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 5, 26, 26, '투룸구조 창가쪽 책상이 매력인 집', '️ 주침실의 공간이 넓고 창가쪽책상이 있어 편리합니다. ️ 방하나는 드레스룸이나 원하는 공간으로 활용이 가능합니다.', to_date('2021-01-25', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 12, 27, 27, '역삼역 도보5분 사이즈좋은 투룸', '-수납좋은 붙박이장으로 정리 정돈에 최적입니다. -모던한 디자인으로 모든분들께 인기 만점입니다. -분리형 구조로 공간을 나눠 사용하실수있어 편리합니다.', to_date('2021-01-27', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 11, 28, 28, '조용한 주택가 강남역 역삼역 사이', '용자 전혀 없습니다. 입주시기는 2월중으로 협의 바랍니다.', to_date('2021-01-27', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 3, 29, 29, 'v월세조정가능v 역삼동', '@ 역삼역 언주역 강남역 도보가능한 위치에있습니다.', to_date('2021-01-28', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 30, 30, '깔끔한 인테리어 큰창', '빌트인 가구가 많아 수납 및 공간 활용성이 높습니다. 강남역과 7분거리에 위치해 있습니다.', to_date('2021-01-28', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 31, 31, '올리모델링 실입주가능 ', '올리모델링 호실로 투자가치 높은 물건입니다 문의가 많습니다. 서둘러 연락주세요~ 상담문의 환영~~', to_date('2021-01-29', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 32, 32, '역삼역 인근 아파트', '전화문의주시면 안전하게 진행해 드리겠습니다.', to_date('2021-01-29', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 18, 33, 33, '가장 귀한 강남역 초역세권', '- 신분당선 강남역 도보 4분, 2호선 강남역 도보 6분 위치 - 강남역 인근 최상의 상업시설과 인프라', to_date('2021-01-30', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 16, 34, 34, '올수리 매매', '- 내부상태깨끗 - 바로입주가능합니다. - 단지내 다양한 편의시설과 상가 - 먹거리와 편의시설이 많은곳', to_date('2021-01-30', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 12, 35, 35, '강남역 초역세권 갭투자 가능', '- 정상입주 가능 입주일은 서로 조정 - 보시는건 미리 예약을 해야하니 전화주시면 상담해드리겠습니다.', to_date('2021-01-31', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 19, 36, 36, '보안및 주변 커뮤니티가 좋습니다.', '- 주택가 위치 - 먹거리와 편의시설이 많은곳', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 18, 37, 37, '내부 올수리 완료', '★ 정직과 신뢰를 가지고 최선을 다해 중개 하겠습니다.★ - 채광 우수 - 베란다 양쪽으로 있고 내부 올수리 완료', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 15, 38, 38, '역삼역 인근 아파트', '전화문의주시면 안전하게 진행해 드리겠습니다. 무융자 전세자금 대출 가능', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 16, 39, 39, '역삼역 초인접 넓은 아파트 단기', '올리모델링 비품 및 컨디션 좋습니다', to_date('2021-02-02', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 14, 40, 40, '가성비 좋은 저렴한 아파트 월세', '○ 100% 실매물 100% 실가격입니다.', to_date('2021-02-02', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 6, 41, 41, '', '', to_date('2021-02-03', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 5, 42, 42, '', '', to_date('2021-02-04', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 20, 43, 43, '', '', to_date('2021-02-05', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 3, 44, 44, '', '', to_date('2021-02-06', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 16, 45, 45, '', '', to_date('2021-02-06', 'yyyy-mm-dd'), 0);

