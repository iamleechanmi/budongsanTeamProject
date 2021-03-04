
/*
select * from tblAdmin;
select * from tblBroker;
select * from tblMember;
select * from tblPrivacyPolicy;
select * from tblTermsOfService;
select * from tblSiteInfo;
select * from tblFree;
select * from tblInquiry;
select * from tblAdInfo;
select * from tblHouseBasic;
select * from tblHouseBuildingType;
select * from tblHouseDealType;
select * from tblHousePrice;
select * from tblRoomBasic;
select * from tblRoomDealType;
select * from tblRoomBuildingType;
select * from tblRoomPrice;
select * from tblHopeType;
select * from tblVRInteriorGagu;
select * from tblApproBroker;
select * from tblNews;
select * from tblNotice;
select * from tblFreeComment;
select * from tblInquiryComment;
select * from tblAdPermit;
select * from tblAdPay;
select * from tblHouseInfo;
select * from tblRoomInfo;
select * from tblHopePrice;
select * from tblChatList;
select * from tblBrokerReview;
select * from tblFreeMember;
select * from tblFreeBroker;
select * from tblInquiryMember;
select * from tblInquiryBroker; 
select * from tblCommentMember;
select * from tblCommentBroker;
select * from tblReviewDelete;
select * from tblChat;
select * from tblHopeWrite;
select * from tblHousePost;
select * from tblRoomPost;
select * from tblHouseImg;
select * from tblRoomImg; 
select * from tblRecoHouse;  
select * from tblPostAd;
select * from tblHouseDealState; 
select * from tblVRInterior; 
select * from tblFalseReport; 
select * from tblService; 
select * from tblCategory;
select * from tblProgress; 
select * from tblConsultation;  
select * from tblRequest;
select * from tblFirm;
select * from tblApprovalF;
select * from tblUsageLog; 
select * from tblPaymentLog; 
select * from tblEstimate1th; 
select * from tblChatAsk;
select * from tblEstimate;
select * from tblPlan;
select * from tblCompletion;
select * from tblServiceReview;
*/




----1단계




--회원
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'star23@naver.com','star23','김준수','871122-1122334','01065327363','서울특별시 강남구 선릉로 28',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'irene4@gmail.com','irene4','아이린','910329-2051723','01085200258','서울특별시 마포구 독막로 26',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'jimin54@daum.com','jimin54','한지민','820202-2134521','01098765433','인천광역시 미추홀구 경인로 5',1);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'yeseul2@hanmail.com','yeseul2','한예슬','910416-2143641','01042235583','경상북도 포항시 남구 오천읍 충무로 23',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'kangsky@naver.com','kangsky','강하늘','940331-1051723','01060584495','세종특별자치시 정부2청사로 13',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'gain233@naver.com','gain233','한가인','820202-2134567','01077489882','전라남도 구례군 구례읍 구례2길 1',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'hello123@naver.com','hello123','이태성','871122-1126434','01033231173','서울특별시 강남구 봉은사로 106',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'bonjour12@daum.com','bonjour12','제시카','910329-2741727','01044829912','서울특별시 강남구 논현로 12',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'suzi9947@naver.com','suzi9947','배수지','840219-2094321','01042239947','서울특별시 금천구 가산디지털1로 159',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'yejin123@nate.com','yejin123','손예진','820111-2423475','01050128847','경기도 고양시 일산동구 성석로 56',1);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'duna123@naver.com','duna123','배두나','791011-2594384','01099435583','서울특별시 용산구 이태원로 136-4',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'sujin442@naver.com','sujin442','박수진','851127-2381642','01099374428','세종특별자치시 나성로 125-4',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'dahee8849@naver.com','dahee8849','이다희','850315-2943124','01010038849','광주광역시 북구 들자미길 104',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'yeolem9948@hanmail.com','yeolem9948','이열음','960216-2061345','01055829948','인천광역시 연수구 청능말로21번길 22-9',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'bogeom33@naver.com','bogeom33','박보검','930616-1643157','01066903382','서울특별시 금천구 디지털로9길 99',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'sekyeong1@gmail.com','sekyeong1','신세경','900729-2461873','01055845582','경상남도 하동군 하동읍 서동길 9',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'chea9985@nate.com','chea9985','한채아','820324-2346487','01032839485','대전광역시 동구 대전로 872',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'nara2@hanmail.com','nara2','권나라','910313-2527249','01055834422','서울특별시 용산구 이촌로2가길 122',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'jo0876@naver.com','jo0876','조보아','830816-2406974','01049064823','광주광역시 북구 무등로262번길 60',0);
insert into tblMember(seq,email,pw,name,ssn,phone,address,delFlag) values(seqMember.nextVal,'sky1004@daum.com','sky1004','박서준','881216-1047704','01088394482','서울특별시 성북구 종암로5길 14',0);

--희망거래유형
insert into tblHopeType(seq,dealType) values(seqHopeType.nextVal,'매매');
insert into tblHopeType(seq,dealType) values(seqHopeType.nextVal,'전세');
insert into tblHopeType(seq,dealType) values(seqHopeType.nextVal,'월세');

--가상인테리어가구
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,2600,2230,1040,'침대','디쟈트','bed01.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,1090,380,780,'화장대','벤스','table01.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,1500,600,720,'테이블','디엘','table02.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,1000,500,680,'서랍장','벤스','dresser01.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,1600,436,720,'책상','두닷','desk01.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,480,500,780,'의자','르포텐','chair01.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,1200,420,720,'거실장','아이엔지홈','dresser02.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,1600,800,750,'테이블','오투가구','table03.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,160,615,870,'수납장','스스디','dresser03.png');
insert into tblVRInteriorGagu(seq,width,vertical,height,productName,brandName,imgURL) values(seqVRInteriorGagu.nextVal,785,400,762,'서랍장','히트가구','dresser04.png');

-- 관리자
insert into tblAdmin values (seqAdmin.nextVal, 'cjddpf@gmail.com', 'qwe123', '김진방');
insert into tblAdmin values (seqAdmin.nextVal, 'casl513@naver.com', 'wer234', '이다반');
insert into tblAdmin values (seqAdmin.nextVal, 'cjdrkd7668@nate.co.kr', 'ert345', '박오늘');

--운영정책
insert into tblTextManager values (seqTextManager.nextVal, '회사소개', '회사소개 내용');
insert into tblTextManager values (seqTextManager.nextVal, '이용약관', '이용약관 내용');
insert into tblTextManager values (seqTextManager.nextVal, '이용안내', '이용안내 내용');

-- 개인정보처리방침
insert into tblPrivacyPolicy values (seqPrivacyPolicy.nextVal, '정적으로하고싶네요', '일반회원');

-- 서비스약관
insert into tblTermsOfService values (seqTermsOfService.nextVal, '정적으로하고싶어요', '일반회원');

-- 사이트정보
insert into tblSiteInfo values (seqSiteInfo.nextVal, '0276688048', 'cjddpf@gmail.com', '서울특별시 강남구 역삼동 735-1', '김진방', '이다반');

-- 자유게시판
insert into tblFree values (seqFree.nextVal, '자취할 때 알면 좋은 팁', '변기에서 나는 냄새를 막을 수 있는 방법 중 하나는 변기세정제를 다는 것이다. 달기만 하면 하수구 냄새가 레몬 향으로 바뀐다. 송지은(덕성여대 아동가족 3)씨는 “변기세정제요? 한 번도 안 산 사람은 있어도 한 번만 산 사람은 없을 걸요”라며 변기세정제를 필수 자취템으로 꼽았다.', '2021-02-07', 0);
insert into tblFree values (seqFree.nextVal, '자취생 청소 꿀팁', '청소기보다는 빗자루! 공간이 작은 자취방은 빗자루가 더 편리하다. 청소기는 공간도 차지하고, 필터 청소가 귀찮아서 관리하지 않으면 어느새 필터가 먼지로 꽉 막히게 된다.', '2021-02-06', 0);
insert into tblFree values (seqFree.nextVal, '신발을 말리는 여러 가지 방법', '맥주병이 있으면 신발을 꽂아서 그늘에 말려주자. 모양도 안 망가지고, 세워놓기 편리하다. 단, 햇빛은 절대 피하자. 변색이 된다. 흰 신발은 누런색으로 변하니 특히 주의.', '2021-02-05', 0);
insert into tblFree values (seqFree.nextVal, '다들 코로나 조심하세요..', '꽤 오랫동안 다닌 동네 짐에서 확진자가 나와서 걱정입니다. 회원님들도 항상 마스크 잘 쓰고 건강에 유의하시기 바라요..ㅜㅜ', '2021-02-02', 0);
insert into tblFree values (seqFree.nextVal, '딩크족인 우리에게 딱 맞는 21평 신혼집', '안녕하세요. 올해 1월 예식을 올린 1년 차 신혼부부예요. 저와 남편은 사내커플로 만나 결혼을 했고 서로를 도와 열심히 일을 하다가 저는 지금 휴식기를 갖고 있답니다. 1월에 결혼을 했지만 신혼집 완공 후 입주가 8월이었기 때문에 결혼 1년 차인 요즘에야 신혼이라는 느낌이 들어요. :-)', '2021-02-01', 0);
insert into tblFree values (seqFree.nextVal, '에어컨 물배관? 냄새', '밖으로 나가는것은 실외기랑 연결되있고 거실바닥에 뚫린것은 물배관 같은데 저기서 냄새가 올라오네요. 틈새를 휴지로 막아놨는데도 나요ㅜㅜ 무슨냄새인거죠? ㅜㅜ 이사온지는 일년반정도 됐어요', '2021-02-01', 0);
insert into tblFree values (seqFree.nextVal, '오늘 임대아파트로 이사했는데', 'lh 임대주택으로 이사를 하였는데, 전 세입자가 오래살아 LH에서 도배를 해준다고 하여 기쁜마음에 이사를 기다렸는데 ㅋㅋ 오늘 이사하고 두꺼비집에 전원을 키고 방을 둘러보는데 안방에 스위치가 없네요 !? ㅠㅠ 스위치 부분도 같이 도배한듯 ?? 안방에서 자야되는데 한동안은 밖에서 자야겠네요', '2021-01-31', 0);
insert into tblFree values (seqFree.nextVal, '친구네 이사 선물하려는데', '친구가 이사하게 되어서 집들이는 못가고 선물만 보내려는데요. 이번에 이사하면서 오래된 가전들 처분하고 새로 산대서 전자렌지 하나 선물할까 싶어서요 주변 얘기들어보니까 에프도 좋을 것 같다고 하던데 일단 괜찮은게 뭐가 있나 찾아보고 결정할까 싶습니다.', '2021-01-31', 0);
insert into tblFree values (seqFree.nextVal, '이사를 가려고 합니다', '20년 넘게 달동네에서 생활하다가 드디어 집 다운 집으로 이사를 가게 됩니다. 빌라로 이사하게 되는데 14년넘게 이사를 가보질 않아서 이사업체나 비용에 대해 잘 모르겠네요 집은 25평대고 바로 옆동네로 이사가는데 비용이 얼마정도 나올까요? 지금 살고 있는 집이 달동네라 견적이 얼만지 잘 모르겠어요 ㅠㅠ', '2021-01-30', 0);
insert into tblFree values (seqFree.nextVal, '사무실 이사갑니다~', '짐 싸놓고 퇴근시간 기다리고 있습니다ㅎㅎ 사무실이 조용하니.. 좋네요', '2021-01-30', 0);
insert into tblFree values (seqFree.nextVal, '구해줘홈즈 볼때마다 왜이리 이사를 가고 싶은지......', '경기도쪽 단독전원주택 나올때마다 너무 이사가 가고싶네요........ 이제 8살 11살  아들 둘있는데  아이들이 너무 뛰는걸 좋아하니 애들한테 뛰지말라고 소리치는것도 너무 미안하고 ....... 참고로 저희집은 1층입니다...... 단독주택가면 아이들 마음것 뛰어놀고 다 할텐데......... 요즘은 학교도 도보10분거리나 차량 5분거리안에 다 있고 하더라구요..... 로망이긴한데  와이프는 벌레도 싫고  집에 제가 없을때 좀 무서워서 싫다고하네요 들어보면 와이프 얘기도 맞구요......그래서 와이프가 구해줘홈즈 다음부턴 시청하지말래요 ㅋㅋ', '2021-01-29', 0);
insert into tblFree values (seqFree.nextVal, '이사폐기물 견적 받아보신 분 계신가요?', '이사하면서 가전 장농 침대 소파 다 버릴건데 2~3톤 정도 나올거같아요 보통 이사폐기물 업체 가격 어느정도인가요', '2021-01-29', 0);
insert into tblFree values (seqFree.nextVal, '다들 주차장 넉넉들 하시나요??', '세대당 0.7 짜리 이사 왔더니 기존 아파트 보다 확실히 헬이네요...차 끌고 나가기가 무섭네요... 갔다 6시만 넘으면 그냥 다 만석입니다.', '2021-01-28', 0);
insert into tblFree values (seqFree.nextVal, '휴.. 중기청 전세대출 대출관련서류 어제 작성했네요..', '가심사 및.. 매물관련 심사까지 다통과되서 어제 최정 대출관련서류 작성했네요..  이제.. 이사날에 맞춰 이사만 가면 끝나네요.. 대출 안나올까봐 심장 조아렸던..', '2021-01-27', 0);
insert into tblFree values (seqFree.nextVal, '빨리 돈 모아서 더 큰 집으로 이사하고 싶어요.', ' 4평에 방 4개인 집에 살고 있는데... 이번에 아이가 둘이 태어나요. 원래는 방 1개는 창고 방이고 나머지는 와이프방, 제 게임방, 안방 이렇게 쓰고 있는데... 와이프가 창고방이랑 와이프방을 아이들 잠자는 방 놀이방으로 쓰고.... 제방을 창고방으로 쓰자는데 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 아니 제 방 가득 찼는데 이게 뭔 소린지......ㅠㅠ 방 5개짜리 집으로 이사하고 싶네요.', '2021-01-26', 0);
insert into tblFree values (seqFree.nextVal, '아우 스트레스!!', '이사온지 이제 6개월 되가는데 진짜 ㅋㅋ 요즘 스트레스 만빵이네요 윗집은 애들 하루를 멀다하고 쿵쿵 거리고 집주인한테 말했더니 윗집사람은 소음방지 매트 깔았다고 자기들은 억울하다고 소음 또 심하면 올라와서 확인하라는데 진짜.. 올라가는게 맞는건지요 .. 화장실에서는 담배냄새 나고 진짜 이사가고 싶은 마음 천지네요 하...........', '2021-01-26', 0);
insert into tblFree values (seqFree.nextVal, '토요일 출근하니 좋네요', '어제 업무 밀렸는데 그냥 칼퇴하고 늘 출근해서 하고 있는데 사무실에 혼자여서 좋네요 음악 틀어서 들으면서 하니 괜찮네요^^', '2021-01-26', 0);
insert into tblFree values (seqFree.nextVal, '강원도 사시는 형님들 질문있습니다.', '요즘 군 면회 외출 외박 전부 중단중인가요?? 직장이 방학이라 계속 집에서 운동만 하는데... 답답해서 이전에 근무하던 부대 근처 드라이브나 가볼까 합니다. 화천에서 군복무했는데.. 훗날 차 끌고 와서 자유롭게 이 동네를 돌아다니겠다라는 다짐을 2년내내 했었거든요;;; 워낙 휴가를 못나와서;;', ' 2021-01-25', 0);
insert into tblFree values (seqFree.nextVal, '세상이 변하는걸 느낍니다.', '성과급 지급 기준을 공개하라. 어찌보면 당연한건데 여태것 주면 감사하다고 생각하고 살았네요 ㅎㅎ 보너스라 생각해서 주면 감사하다고 생각했다니 ㅎ', '2021-01-25', 0);
insert into tblFree values (seqFree.nextVal, '차사고서 처음으로 긁었네요..', '평행주차하다가 앞자 뒷범퍼 살짝 긁었네요 ㅠㅠㅠㅠ 차주분께 연락드려서 보시고는 그냥 보험처리 말고 현금 10만원만 받겠다고 하셔서 감사합니다 하고 처리했습니다.. 신기하게 제차 도색은 안날아가고 쏘렌토 도색만 벗겨졌네요.. 어우 조심해야겠습니다..', '2021-01-24', 0);
insert into tblFree values (seqFree.nextVal, '무선 청소기가 해마다 가격이 내려가네요.,....', '약 2년전에 산 삼성제트 105만원 정도였는데 물걸레키트...엘지 코드제로도 같이샀고 이거도 100만원 정도에 신축 입주 박람회로 90만원까지해서 샀는데 요즘엔 성능도 더 좋아지고 더 가벼워지고 시간도 오래 더 가는데 60~70만원에 물걸레도 주네요...', '2021-01-23', 0);
insert into tblFree values (seqFree.nextVal, '전세 이사할때 청소', '저는 전세 두번 이사하면서 다음사람 집구경올때 신발벗고구경하라고 청소', '2021-01-23', 0);
insert into tblFree values (seqFree.nextVal, '1개월 단기 월세를 줬는데요', '집을 얼마전에 제가 사고기간이 안맞아서 사정상 1개월 단기월세를 줬어요. 제가 좀 싸게 내놓긴 해서 그런지(시세2000/80, 최근거래는 5000/90도 있던데 그냥한달단기라 65에 보증금도 100으로) 이사람 집도 안보고 계약하더라구요. 집보러가자고 제가 여러번 이야기했는데 코로나핑계대고 안가더라구요', '2021-01-22', 0);
insert into tblFree values (seqFree.nextVal, '염화칼슘이 녹으면 약간 꾸덕해지나요', '시골 살다 주말마다 서울 올라오는데 대부분 인도나 도로나 염화칼슘으로 눈을 녹여놨더라구요. 시골은 아직 제설이 안되어 눈 밟고 다녔습니다. 오늘 청소하려고 현관 바닥을 보니 눈이 녹은 것도 아닌것이 찐득한 것도 있고 굳은 것도 있고 해서 이게 염화칼슘 인가 싶기도 하고. 구두 바닥도 깨끗이 닦아 말려놓았네요. 염화칼슘이 구두 바닥에 영향 주고 그런건 아니겠지요?', '2021-01-22', 0);

-- 문의게시판
insert into tblInquiry values (seqInquiry.nextVal, '매물 광고는 뭔가요?', '매물 광고는 어떻게 이루어지나요?? 알려주세요!!', '2021-02-01', 0, 0);
insert into tblInquiry values (seqInquiry.nextVal, '허위 매물 신고는 어떻게 하나요?', '허위 매물을 발견한 것 같은데 어떻게 신고하면 되나요?', '2021-01-31', 0, 0);
insert into tblInquiry values (seqInquiry.nextVal, '희망입주조건은 실제 회원이 올린건가요?', '희망입주조건은 회원이 올린 건가요?? 아니면 일반적인 통계수치인가요?', '2021-01-30', 0, 0);
insert into tblInquiry values (seqInquiry.nextVal, '방 올릴 때 반드시 모든 정보가 정확해야하나요?', '방 조건중에 잘 모르겠는.. 약간 헷갈리는 내용이 있는데 반드시 적어야하나요? 안 적으면 안될까요?', '2021-01-29', 0, 0);
insert into tblInquiry values (seqInquiry.nextVal, '사이트 담당자분에게 유선 문의를 드리고 싶습니다..', '혹시 사이트 대표 전화를 알 수 있을까요? 사이트를 찾아봐도 안 보이길래..', '2021-01-28', 0, 0);
insert into tblInquiry values (seqInquiry.nextVal, '허위매물을 발견한 것 같습니다.', '지역검색에 강남구로 검색한 다음에 나오는 매물 중 세번째 매물 허위매물입니다..', '2021-01-28', 0, 0);
insert into tblInquiry values (seqInquiry.nextVal, '후기 삭제 관련', '저희 중개사와 거래하지 않은 고객이 후기를 올렸는데 어떻게 삭제할 수 있나요?', '2021-01-27', 0, 0);
insert into tblInquiry values (seqInquiry.nextVal, '후기 쓸때요..', '반드시 필요 서류나 이미지를 첨부해야 하나요?', '2021-01-26', 0, 0);

--중개사
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'hong123@gmail.com', 'ghdrlfehd', '홍길동', '좋은집공인중개사사무소', '38473298318273', '서울특별시 강남구 역삼동 735-1', '023451234', '4821238496', 'doc0001.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'wowbudongsan@naver.com', 'ghdrlfehd', '김철우', '대박공인중개사사무소', '24586548412353', '서울특별시 강남구 삼성동 25-29', '028454845', '8456621465', 'doc0002.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'forest323@naver.com', 'wkvk32kv!', '김윤서', '한솔공인중개사사무소', '34958412546254', '서울특별시 강남구 신사동 536-9', '026654158', '4451298547', 'doc0003.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'sisit234@gmail.com', 'dkwpovn23?', '이서준', '쌍용공인중개사사무소', '98245754832548', '서울특별시 강남구 대치동 988-5', '023451234', '6328545685', 'doc0004.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'go12odtow@gmail.com', 'skdkdfekfsk21', '이예준', '으뜸공인중개사사무소', '84569125432547', '서울특별시 강남구 논현동 292-1', '024841125', '2254896544', 'doc0005.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'wod2skfk3@gmail.com', 'fkodlf234%', '김도윤', '훈민정음부동산공인중개사사무소', '94587123454884', '서울특별시 강남구 역삼동 12-21', '023365785', '5842566548', 'doc0006.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'wodnkde11@naver.com', 'soelf12', '박채원', '현대공인중개사사무소', '44254468812448', '서울특별시 강남구 역삼동 231-1 ', '024451485', '5546825469', 'doc0007.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'earth486@gmail.com', '12314dolf', '이수아', '지구공인중개사사무소', '65474549811456', '서울특별시 강남구 삼성동 362-12', '026654854', '4851255987', 'doc0008.pdf', 1);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'cent121@naver.com', 'dl3fkdk2f', '최건우', '센트럴부동산공인중개사사무소', '84451225415486', '서울특별시 강남구 대치동 124-12', '024489154', '4568577456', 'doc0009.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'inin222@hanmail.net', 'wofoeo3', '김도현', '아인부동산공인중개사사무소', '44515245695474', '서울특별시 강남구 역삼동 299-12', '023514425', '9854525468', 'doc0010.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'wkjdnlflk231@gmail.com', 'goodi32f9', '박은서', '한숲공인중개사사무소', '11458544432554', '서울특별시 강남구 역삼동 12-431', '028529635', '4587466589', 'doc0011.pdf', 1);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'ddjl3nls@hanmail.net', 'hbsfdwe345', '박현준', '멀티부동산공인중개사사무소', '11458544432554', '서울특별시 강남구 역삼동 122-421', '028529635', '9382736485', 'doc0011.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'sdaf3sdf@naver.com', '32rdfes5', '김유쥰', '더불어공인중개사사무소', '11458544432554', '서울특별시 강남구 역삼동 512-431', '025892123', '8233458372', 'doc0012.pdf', 1);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'hthf23dfs@gmail.com', 'hrevwb', '최지환', '정직공인중개사사무소', '11458544432554', '서울특별시 강남구 대치동 212-431', '024923556', '2984023498', 'doc0013.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'yjufa234@gmail.com', 'zdxcw3dcv', '이승민', '희망공인중개사사무소', '11458544432554', '서울특별시 강남구 논현동 163-431', '020492834', '7543459283', 'doc0014.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 's2df4@gmail.com', 'afdev4szfe', '이유진', '보금자리공인중개사사무소', '11458544432554', '서울특별시 강남구 역삼동 124-431', '023928496', '9453948593', 'doc0015.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'jasqw3@hanmail.net', 'vjutfs3', '김민자', '인근공인중개사사무소', '11458544432554', '서울특별시 강남구 역삼동 553-234', '020389223', '2730483423', 'doc0016.pdf', 1);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'sdfgh45s@naver.com', 'ddffergv4', '김예진', '한초원공인중개사사무소', '11458544432554', '서울특별시 강남구 삼성동 612-331', '0223235555', '39485930293', 'doc0017.pdf', 0);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'bfvz2df@gmail.com', 'bhdvscaq344', '이시아', '앞마당공인중개사사무소', '11458544432554', '서울특별시 강남구 역삼동 312-634', '029482323', '8594829348', 'doc0018.pdf', 1);
insert into tblBroker (seq, email, pw, name, businessName, brokerNum, address,tel, businessNum, documentURL, delFlag) values (seqBroker.nextVal, 'qjedcs3@naver.com', 'xzzdrtf3', '이하울', '히트공인중개사사무소', '11458544432554', '서울특별시 강남구 논현동 234-12334', '022934535', '7432523456', 'doc0019.pdf', 0);

--광고 정보
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 10, to_date('2021-01-30', 'yyyy-mm-dd'), 88000);
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 10, to_date('2021-03-09', 'yyyy-mm-dd'), 88000);
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 20, to_date('2021-03-09', 'yyyy-mm-dd'), 176000);
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 40, to_date('2021-02-01', 'yyyy-mm-dd'), 352000);
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 20, to_date('2021-02-01', 'yyyy-mm-dd'), 176000);
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 10, to_date('2021-02-02', 'yyyy-mm-dd'), 88000);
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 30, to_date('2021-02-02', 'yyyy-mm-dd'), 264000);
insert into tblAdInfo (seq, amount, endDate, price) values(seqAdInfo.nextVal, 20, to_date('2021-02-04', 'yyyy-mm-dd'), 176000);

-- 방거래유형 tblRoomDealType(seq, type)

-- 1 매매 2 전세 3 월세
insert into tblRoomDealType values (seqRoomDealType.nextVal, '매매');
insert into tblRoomDealType values (seqRoomDealType.nextVal, '전세');
insert into tblRoomDealType values (seqRoomDealType.nextVal, '월세');

-- 매물거래유형 tblHouseDealType(seq, type)

-- 1 매매 2 전세 3 월세
insert into tblHouseDealType values (seqHouseDealType.nextVal, '매매');
insert into tblHouseDealType values (seqHouseDealType.nextVal, '전세');
insert into tblHouseDealType values (seqHouseDealType.nextVal, '월세');

-- 방건물유형 tblRoomBuildingType (seq, type)

-- 1 아파트 2 빌라 3 주택 4 원룸 5 투룸 6 오피스텔
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '아파트');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '빌라');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '주택');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '원룸');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '투룸');
insert into tblRoomBuildingType values (seqRoomBuildingType.nextVal, '오피스텔');

-- 매물건물유형 tblHouseBuildingType (seq, type)

-- 1 아파트 2 빌라 3 주택 4 원룸 5 투룸 6 오피스텔
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '아파트');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '빌라');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '주택');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '원룸');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '투룸');
insert into tblHouseBuildingType values (seqHouseBuildingType.nextVal, '오피스텔');

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

-- 매물기초정보 tblHouseBasic(seq, address, exclusiveArea, supplyArea, selectedFloor, totalFloor, roomNum, bathroomNum, direction, completionYear, parkingFlag, elevator, pet)

-- 오피스텔 1~10
insert into tblHouseBasic values (seqHouseBasic.nextVal, '서울시 강남구 역삼동 719-24', 32.42, 78.15, 15, 18, 1, 1, '남', to_date('2019', 'yyyy'), 1, 1, 0);
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

-- 방가격 tblRoomPrice(seq, price, rent, monthlyFee)

-- 가격 단위는 1) 1 ~ 10 사이면 억 2) 50 이상이면 만원
-- 관리비 단위는 만원

-- 전세 1~5 월세 6~10
insert into tblRoomPrice values (seqRoomPrice.nextVal, 24500, default, 1.2);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 23000, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 34500, default, 16);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 18000, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 40000, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 13000, 130, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 65, 9);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 500, 95, 11);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 500, 75, 9);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3000, 75, 10);

-- 전세 11 월세 12~20
insert into tblRoomPrice values (seqRoomPrice.nextVal, 15000, default, 0);
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
insert into tblRoomPrice values (seqRoomPrice.nextVal, 21000, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 40000, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 50000, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 18500, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 28000, default, 12);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 150, 7);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 85, 5);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2000, 155, 16);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 3000, 125, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2000, 140, 10);

-- 매매 31~35 전세 36~38 월세 39~40
insert into tblRoomPrice values (seqRoomPrice.nextVal, 21000, default, 1);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 33000, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 45000, default, 12);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 32000, default, 15);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 33000, default, 15);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 23000, default, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 20000, default, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 34500, default, 15);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 1000, 85, 10);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 2000, 140, 10);

-- 전세 41~42 월세 43~45
insert into tblRoomPrice values (seqRoomPrice.nextVal, 21000, default, 0.6);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 22000, default, 0.5);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 500, 55, 1);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 68, 68, 8);
insert into tblRoomPrice values (seqRoomPrice.nextVal, 75, 75, 7);

-- 매물가격 tblHousePrice(seq, price, rent, monthlyFee)

-- 가격 단위는 만원
-- 관리비 단위는 만원

-- 월세 1 전세 2~5 월세 6~10
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 147, 15);
insert into tblHousePrice values (seqHousePrice.nextVal, 23000, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 34500, default, 16);
insert into tblHousePrice values (seqHousePrice.nextVal, 18000, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 40000, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 130, 130, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 65, 9);
insert into tblHousePrice values (seqHousePrice.nextVal, 500, 95, 11);
insert into tblHousePrice values (seqHousePrice.nextVal, 500, 75, 9);
insert into tblHousePrice values (seqHousePrice.nextVal, 3000, 75, 10);

-- 전세 11 월세 12~20
insert into tblHousePrice values (seqHousePrice.nextVal, 15000, default, 0);
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
insert into tblHousePrice values (seqHousePrice.nextVal, 21000, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 40000, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 50000, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 18500, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 28000, default, 12);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 150, 7);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 85, 5);
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 155, 16);
insert into tblHousePrice values (seqHousePrice.nextVal, 3000, 125, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 140, 10);

-- 매매 31~35 전세 36~38 월세 39~40
insert into tblHousePrice values (seqHousePrice.nextVal, 21000, default, 1);
insert into tblHousePrice values (seqHousePrice.nextVal, 33000, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 45000, default, 12);
insert into tblHousePrice values (seqHousePrice.nextVal, 32000, default, 15);
insert into tblHousePrice values (seqHousePrice.nextVal, 33000, default, 15);
insert into tblHousePrice values (seqHousePrice.nextVal, 23000, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 20000, default, 8);
insert into tblHousePrice values (seqHousePrice.nextVal, 34500, default, 15);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 85, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 2000, 140, 10);

-- 전세 41 월세 42~45
insert into tblHousePrice values (seqHousePrice.nextVal, 14000, default, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 100, 100, 10);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 55, 5);
insert into tblHousePrice values (seqHousePrice.nextVal, 1000, 65, 6);
insert into tblHousePrice values (seqHousePrice.nextVal, 150, 150, 20);

/* 업체 카테고리 */
INSERT INTO tblCategory (seq, categoryNum) VALUES (seqCategory.nextVal, '청소');
INSERT INTO tblCategory (seq, categoryNum) VALUES (seqCategory.nextVal, '시공');

/* 견적상담형태 */
INSERT INTO tblConsultation (seq, cType) VALUES (seqConsultation.nextVal, '방문');
INSERT INTO tblConsultation (seq, cType) VALUES (seqConsultation.nextVal, '전화');
INSERT INTO tblConsultation (seq, cType) VALUES (seqConsultation.nextVal, '진행무산');

/* 일정진행상태 */
INSERT INTO tblProgress (seq, pState) VALUES (seqProgress.nextVal, '예정');
INSERT INTO tblProgress (seq, pState) VALUES (seqProgress.nextVal, '진행');
INSERT INTO tblProgress (seq, pState) VALUES (seqProgress.nextVal, '완료');

/* 서비스 품목 */
INSERT INTO tblService (seq, sType) VALUES (seqService.nextVal, '청소');
INSERT INTO tblService (seq, sType) VALUES (seqService.nextVal, '시공');





----2단계




-- 자유게시판 댓글
insert into tblFreeComment values (seqFreeComment.nextVal, '와 감사합니다!! 유용하다 정말~', '2021-02-07', 1, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '아니 이런 꿀팁을? 캬 감사합니다 우하하', '2021-02-07', 1, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, 'ㅋㅋㅋㅋ재미난 방법이네요. 실제로 효과가 있을런지..?', '2021-02-05', 3, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '신혼 축하드려요~ 아름다워요~ 호호', '2021-02-05', 5, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '마스크를 잘 끼고 다녀야 합니다. 손도 자주 씻고요', '2021-02-07', 4, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '디퓨저가 무난할 것 같은데요??', '2021-02-05', 8, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '전자레인지를 친구분이 가지고있으면 어떻하죠? ㅋㅋㅋ', '2021-02-04', 8, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '주차하기 정말 어렵죠.. 저희 동네도 ㅜㅜ', '2021-02-01', 13, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '방이 많으면 청소도 자주하게 되더라구요.. 특히 강아지를 키우면ㅋㅋㅋ', '2021-01-27', 15, 0);
insert into tblFreeComment values (seqFreeComment.nextVal, '긍정적이시네요.. 대박', '2021-01-28', 17, 0);

-- 문의게시판 댓글
insert into tblInquiryComment values (seqInquiryComment.nextVal, '문의주셔서 감사합니다. 문의 담당자 박오늘입니다. 매물 광고는 매물 검색 시 광고중인 매물을 다른 매물보다 상단에 노출시키는 방식으로 진행됩니다.', '2021-02-02', 3, 1, 0);
insert into tblInquiryComment values (seqInquiryComment.nextVal, '문의주셔서 감사합니다. 문의 담당자 박오늘입니다. 허위매물신고는 신고하고자 하는 매물을 클릭하여 "허위매물신고"버튼을 클릭해주시면 됩니다. 이후 관리자가 신고된 매물을 검토하여 매물 삭제 여부를 결정합니다.', '2021-02-02', 3, 2, 0);
insert into tblInquiryComment values (seqInquiryComment.nextVal, '문의주셔서 감사합니다. 문의 담당자 박오늘입니다. 희망입주조건은 사이트를 이용하는 회원이 작성한 것 입니다. 통계수치가 아닙니다.', '2021-02-01', 3, 3, 0);
insert into tblInquiryComment values (seqInquiryComment.nextVal, '문의주셔서 감사합니다. 문의 담당자 박오늘입니다. 중개사가 매물을 사이트에 게시하는 것과 일반 회원이 방 등록하는 것은 다른 행위입니다. 정확한 정보를 기입하시는 것이 좋으나, 매물 정보를 정확하게 기입하는 의무는 중개사에 있습니다.', '2021-01-31', 3, 4, 0);
insert into tblInquiryComment values (seqInquiryComment.nextVal, '문의주셔서 감사합니다. 문의 담당자 박오늘입니다. 사이트 대표 전화는 1677-7668 입니다. 상담시간은 월~금 09:00 ~ 17:00 입니다.', '2021-01-30', 3, 5, 0);
insert into tblInquiryComment values (seqInquiryComment.nextVal, '문의주셔서 감사합니다. 문의 담당자 박오늘입니다. 허위매물신고는 문의게시판에서 처리되지 않습니다. 허위매물신고는 신고하고자 하는 매물을 클릭하여 "허위매물신고"버튼을 클릭해주시면 됩니다. 이후 관리자가 신고된 매물을 검토하여 매물 삭제 여부를 결정합니다.', '2021-01-29', 3, 6, 0);

-- 뉴스
insert into tblNews values (seqNews.nextVal, '주택건설업체들, 수도권·광역시 분양 경기 기대감 유지', '(서울=연합뉴스) 홍국기 기자 = 주택건설업체들이 수도권과 광역시를 중심으로 분양 경기에 대한 기대감을 유지하는 것으로 조사됐다. 5일 주택산업연구원(주산연)에 따르면 2월 전국 분양경기실사지수(HSSI) 전망치는 92.2로 3개월째 90선을 지속했다. HSSI는 분양을 앞두고 있거나 분양 중인 아파트 단지의 분양 여건을 공급자 입장에서 종합적으로 판단하는 지표로, 주택사업을 하는 업체(한국주택협회·대한주택건설협회 회원사들)를 상대로 매달 조사한다. HSSI가 100을 초과하면 분양 전망이 긍정적이라는 것을, 100 미만이면 그 반대를 의미한다. 이달 전국 전망치는 지난달보다 3.2포인트 하락하며 소폭 조정됐으나 서울(108.5), 인천(108.5), 세종(112.5), 대전(110.0)에서는 기준선(100)을 웃도는 전망치를 기록했다. 주산연은 "수도권은 정부가 전날 내놓은 도심 중심의 공급 계획이, 대전·세종권은 개발 계획 등의 정책적 요인이 분양 사업 전망에 긍정적 영향을 미친 것으로 판단된다"고 설명했다.', 'news001.png', '2021-02-06', 1, 0);
insert into tblNews values (seqNews.nextVal, '서울 공공개발 사업 후보지 222곳..설 이후 설명회', '(세종=연합뉴스) 윤종석 기자 = 정부가 서울에서 공공 직접시행 정비사업이나 도심공공주택복합사업을 벌이기 위해 222곳을 추려내 설 연휴 이후 주민 설명회를 할 예정이다. 윤성원 국토교통부 1차관은 5일 CBS라디오 김현정의 뉴스쇼에 출연해 이같이 말했다. 국토부는 앞서 4일 공공기관 직접시행 정비사업과 역세권·준공업지역·저층주거지를 상대로 한 도심공공주택복합사업을 추진해 2025년까지 서울 32만3천호 등 전국 83만6천호를 공급하는 계획을 발표했다.', 'news001.png', '2021-02-05', 1, 0);
insert into tblNews values (seqNews.nextVal, '영끌할까 청약 기다릴까..고민에 빠진 3040', '정부가 2·4주택공급대책에서 청약제도를 일부 손보면서 3040 무주택자의 내 집 마련에 대한 기대가 커지고 있다. 수도권을 중심으로 공급물량이 대거 늘어난 데다 일반공급 중소형 물량에 대한 추첨제가 도입되면서 청약 기회가 확대됐기 때문이다. 다만 일각에선 정부가 발표한 공급량 자체가 예상치에 불과하고 청약 기회가 늘어난다 해도 대기 수요가 쌓여 있어 추격매수심리를 막기 어려울 것이라는 분석도 나온다. 정부는 이번 대책에서 공공분양에서 일반공급 물량을 전체의 15%에서 30%로 높이고 전용 85㎡ 이하 일반공급분에도 추첨제를 30% 도입하기로 했다. 대규모 주택 공급으로 수급불안심리를 해소하는 것과 동시에 청약 가능성을 높여 ‘영끌(영혼까지 끌어모아 자금 마련)’로 패닉바잉(공황매수)에 나선 젊은 층을 진정시키겠다는 복안이다.', 'news002.png', '2021-02-04', 1, 0);
insert into tblNews values (seqNews.nextVal, '지난해 상가권리금 평균 4074만원..2015년이후 최저', '[파이낸셜뉴스] 코로나19 바이러스 확산으로 인한 내수경기 침체로 상가권리금도 3년연속 하락세다. 2일 수익형부동산 연구개발기업 상가정보연구소가 한국부동산원 통계를 분석한 결과 2020년 전국 상가 평균 권리금은 4074 만원으로 조사됐으며 1㎡당 평균 권리금은 52만 8000원이었다. 2020년 상가 평균 권리금은 통계집계가 시작된 2015년 이래로 가장 낮았다. 역대 상가 평균권리금은 △2015년4574만원 △2016년 4661만원, △2017년 4777만원 △2018년 4535만원 △2019년 4276만원이었고 2017년 이후 3년 연속 하락세다.', 'news003.png', '2021-02-03', 1, 0);
insert into tblNews values (seqNews.nextVal, '수도권 평균 전셋값 4억 돌파..임대차법이 되레 불질렀다', '지난해 공공임대주택이 정부 계획을 넘어선 15만 채가 공급된 것으로 집계됐다. 또 장기임대주택 재고율이 "선진국 클럽"으로 여겨지는 경제협력개발기구(OECD)의 평균에 도달한 것으로 추정됐다. 하지만 수도권에서 평균 전세금이 처음으로 4억 원을 돌파하고, 서포자(서울포기자)가 양산되는 등 무주택 서민들의 주거 불안은 심화하고 있는 것으로 나타났다. 이에 따라 정부의 지속적인 공급확대에도 전세시장 불안이 커지는 이유에 대해 관심이 모아지고 있다.', 'news004.png', '2021-02-03', 1, 0);
insert into tblNews values (seqNews.nextVal, '상가 권리금 3년 연속 하락..역대 최저치 기록', '지난해 시작된 코로나19 바이러스 확산으로 인한 내수경기 침체, 소셜커머스 및 온라인 쇼핑몰 사용자 증가 등의 이유로 상가 시장의 위축된 분위기는 이어지고 있다. 상가 가치 척도로 여겨지는 권리금도 감소하고 있는 추세다. 2일 상가정보연구소가 한국부동산원 통계를 분석한 결과 2020년 전국 상가 평균 권리금은 4074 만원으로 조사됐으며 1㎡당 평균 권리금은 52만 8000원이었다.', 'news005.png', '2021-02-02', 1, 0);
insert into tblNews values (seqNews.nextVal, '지존, 토지 가치 분석 강좌 개설', '토지보상 및 부동산개발정보 플랫폼 지존은 사내 교육과정 으로 토지 가치 분석 강좌를 개설한다고 29일 밝혔다. 이 교육 과정은 총 10주간이며 토지보상아카데미가 개강하는 경우, 강의 기간 동안은 휴강한다. 개강일은 오는 3월 6일이며 강의시간은 매주 토요일 오전 10시부터 오후 1시까지(3시간)이다. 교육내용은 도시계획(개발행위 포함), 건축법, 토지보상, 내 땅 활 용법 등으로 토지의 기초이론에서 실전 투자까지를 망라하는 내용으로 구성된다.', 'news006.png', '2021-02-01', 1, 0);

-- 공지사항
insert into tblNotice values (seqNotice.nextVal, '자유 게시판 이용 안내', '자유 게시판은 자유로운 주제로 회원간 토론을 할 수 있는 게시판입니다. 일반회원뿐만 아니라 부동산 중개사 계정도 참여할 수 있습니다. 지나친 비방이나 욕설을 포함한 게시글은 경고없이 관리자에 의해 삭제될 수 있음을 공지합니다.', 'notice001.png', '2021-01-04', 1, 0);
insert into tblNotice values (seqNotice.nextVal, '허위 매물 예방 3개명', '1. 방사진이 지나치게 보정되었거나, 방 내부 구조를 알기 어려운 사진은 허위 매물일 가능성이 약 70% 높습니다. 2. 허위매물의 20% 가량은 지역 평균 시세보다 월세 기준 10만원, 전세 기준 약 1천만원 이상이 가격이 낮습니다. 3. 매물 설명에서 실입주금이나 저금리 대출이자를 강조하고 있는 매물은 허위매물일 가능성이 약 40% 높습니다.', 'notice002.png', '2021-01-13', 1, 0);
insert into tblNotice values (seqNotice.nextVal, '유선 상담 안내', '유선 상담 서비스를 제공하고 있습니다. 대표전화 1677-7668이고, 상담 시간은 월~금 09:00 ~ 17:00 입니다.', 'notice003.png', '2021-01-22', 1, 0);

-- 작성한자유_회원
insert into tblFreeMember values (seqFreeMember.nextVal, 1, 1);
insert into tblFreeMember values (seqFreeMember.nextVal, 3, 3);
insert into tblFreeMember values (seqFreeMember.nextVal, 5, 5);
insert into tblFreeMember values (seqFreeMember.nextVal, 7, 7);
insert into tblFreeMember values (seqFreeMember.nextVal, 9, 9);
insert into tblFreeMember values (seqFreeMember.nextVal, 11, 11);
insert into tblFreeMember values (seqFreeMember.nextVal, 13, 13);
insert into tblFreeMember values (seqFreeMember.nextVal, 15, 15);
insert into tblFreeMember values (seqFreeMember.nextVal, 17, 17);
insert into tblFreeMember values (seqFreeMember.nextVal, 19, 19);
insert into tblFreeMember values (seqFreeMember.nextVal, 21, 1);
insert into tblFreeMember values (seqFreeMember.nextVal, 13, 3);

-- 작성한문의_회원
insert into tblInquiryMember values (seqInquiryMember.nextVal, 2, 12);
insert into tblInquiryMember values (seqInquiryMember.nextVal, 4, 14);
insert into tblInquiryMember values (seqInquiryMember.nextVal, 6, 16);
insert into tblInquiryMember values (seqInquiryMember.nextVal, 8, 18);

-- 작성한댓글_회원
insert into tblCommentMember values (seqCommentMember.nextVal, 1, 2);
insert into tblCommentMember values (seqCommentMember.nextVal, 3, 4);
insert into tblCommentMember values (seqCommentMember.nextVal, 5, 6);
insert into tblCommentMember values (seqCommentMember.nextVal, 7, 8);
insert into tblCommentMember values (seqCommentMember.nextVal, 9, 10);

--희망입주가격정보
insert into tblHopePrice(seq,price,rent,hopeTypeSeq) values(seqHopePrice.nextVal,100,100,3);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,720000,1);
insert into tblHopePrice(seq,price,rent,hopeTypeSeq) values(seqHopePrice.nextVal,70,60,3);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,35000,2);
insert into tblHopePrice(seq,price,rent,hopeTypeSeq) values(seqHopePrice.nextVal,70,70,3);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,110000,2);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,73000,2);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,80000,1);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,10000,2);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,100000,1);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,75000,2);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,230000,1);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,50000,1);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,15000,2);
insert into tblHopePrice(seq,price,rent,hopeTypeSeq) values(seqHopePrice.nextVal,200,180,3);
insert into tblHopePrice(seq,price,rent,hopeTypeSeq) values(seqHopePrice.nextVal,2000,90,3);
insert into tblHopePrice(seq,price,rent,hopeTypeSeq) values(seqHopePrice.nextVal,20000,200,3);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,20000,2);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,15000,2);
insert into tblHopePrice(seq,price,hopeTypeSeq) values(seqHopePrice.nextVal,60000,1);

--승인중개사
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-01', 'yyyy-mm-dd'), 1);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-01', 'yyyy-mm-dd'), 2);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-02', 'yyyy-mm-dd'), 3);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-02', 'yyyy-mm-dd'), 4);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-03', 'yyyy-mm-dd'), 5);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-03', 'yyyy-mm-dd'), 6);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-04', 'yyyy-mm-dd'), 7);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-04', 'yyyy-mm-dd'), 8);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-04', 'yyyy-mm-dd'), 9);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-05', 'yyyy-mm-dd'), 10);
insert into tblApproBroker (seq, regDate, brokerSeq) values (seqApproBroker.nextVal, to_date('2021-01-06', 'yyyy-mm-dd'), 11);

--1:1 문의 내역 
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-02', 'yyyy-mm-dd'), 4, 1);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-02', 'yyyy-mm-dd'), 4, 1);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-03', 'yyyy-mm-dd'), 6, 4);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-03', 'yyyy-mm-dd'), 7, 6);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-04', 'yyyy-mm-dd'), 7, 1);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-05', 'yyyy-mm-dd'), 8, 4);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-06', 'yyyy-mm-dd'), 12, 8);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-06', 'yyyy-mm-dd'), 12, 11);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-06', 'yyyy-mm-dd'), 14, 3);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-07', 'yyyy-mm-dd'), 15, 1);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-07', 'yyyy-mm-dd'), 16, 5);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-08', 'yyyy-mm-dd'), 16, 7);
insert into tblChatList (seq, regDate, memeberSeq, approBrokerSeq) values (seqChatList.nextVal, to_date('2021-01-09', 'yyyy-mm-dd'), 17, 8);

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

-- 매물정보 tblHouseInfo(seq, houseBasicSeq, houseBuildingTypeSeq, houseDealTypeSeq)

-- 오피스텔 월세 1 전세 2~5 월세 6~10
insert into tblHouseInfo values (seqHouseInfo.nextVal, 1, 6, 3);
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

-- 후기/평점
insert into tblBrokerReview values (seqBrokerReview.nextVal, '2021-01-31', '전화로 친절하게 말씀해주셔서 고마웠어요~', 4, 'review001.png', 5, 1, 0);
insert into tblBrokerReview values (seqBrokerReview.nextVal, '2021-02-01', '덕분에 첫 자취집 잘 구해갑니다~', 3, 'review002.png', 2, 3, 0);
insert into tblBrokerReview values (seqBrokerReview.nextVal, '2021-02-02', '오피스텔 상태 좋네요.. 감사합니다~', 4, 'review003.png', 4, 5, 0);

/* 업체 */
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '청소의 전설', 'firm1234', 'firm0001@gmail.com', '서울특별시 강북구 수유동 176-44 서울시티빌8', '02-400-2528', '이사청소 전문 청소업체 입니다. 친환경세제와 청소전문장비를 사용하고 있습니다. 합리적인 가격으로 최고의 서비스를 제공하고 있습니다.', 'clean0001.jpg', 4500, 1, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '클린홈', 'firm1234', 'firm0002@gmail.com', '서울특별시 광진구 자양동 45-13 서울클리닉빌딩', '02-322-2911', '청소 전문 청소업체 입니다. 생활하며 생기는 각종 오염먼지를 깨끗이 제거해드립니다. 신속한 서비스로 쾌적함을 더해드리기 위해 노력합니다.', 'clean0002.jpg', 9500, 1, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '청소나라', 'firm1234', 'firm0003@gmail.com', '서울특별시 동대문구 답십리동 464-1', '02-829-6378', '맘카페의 극찬을 받은 최고의 청소업체입니다. 생활하며 생기는 각종 오염먼지를 깨끗이 제거해드립니다. 신속한 서비스로 쾌적함을 더해드리기 위해 노력합니다.', 'clean0003.jpg', 0, 1, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '청소를합시다', 'firm1234', 'firm0004@gmail.com', '서울특별시 광진구 화양동 3-23', '02-764-6112', '고객과의 소통을 통해 세심한 청소 서비스를 제공해드립니다. 각종 오염먼지, 새집증후군 증상을 날려드리겠습니다.', 'clean0001.jpg', 0, 1, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '청소시간', 'firm1234', 'firm0005@gmail.com', '서울특별시 광진구 화양동 3-23', '02-764-6112', '친환경세제와 청소전문장비를 사용하고 있습니다. 합리적인 가격으로 최고의 서비스를 제공하고 있습니다. 각종 오염먼지, 새집증후군 증상을 날려드리겠습니다.', 'clean0002.jpg', 0, 1, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '청소마켓', 'firm1234', 'firm0006@gmail.com', '서울특별시 성북구 보문동2가 114-1', '02-339-8262', '이사청소, 욕실청소 전문 업체입니다. 건강을 생각한 친환경세제로 각종 오염먼지, 새집증후군 증상을 날려드리겠습니다.', 'clean0003.jpg', 0, 0, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '굿클린', 'firm1234', 'firm0007@gmail.com', '서울특별시 성북구 보문동1가 132-2', '02-238-7322', '합리적인 가격의 청소 전문 업체입니다. 신속하고 쾌적한 서비스로 각종 생활 오염먼지를 제거해드리고 있습니다.', 'clean0001.jpg', 0, 0, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '청소고', 'firm1234', 'firm0008@gmail.com', '서울특별시 강남구 신사동 545-9', '02-625-2352', '이사청소, 입주청소 전문 업체입니다. 방충망청소, 새집 오염먼지 제거 등 청소전문가의 전문적인 서비스가 필요할 때 문의해주세요.', 'clean0002.jpg', 0, 0, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '아워클린', 'firm1234', 'firm0009@gmail.com', '서울특별시 성동구 홍익동 18 한신그린빌', '02-745-2803', '지역 맘카페의 극찬을 받은 청소 전문 업체입니다. 청소전문가의 전문적인 서비스가 필요할 때 언제든 문의해주세요.', 'clean0003.jpg', 0, 0, 0, 1);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '고클린', 'firm1234', 'firm0010@gmail.com', '서울특별시 성동구 도선동 289', '02-825-2803', '입주청소, 이사청소 전문 업체입니다. 생활먼지, 새집입주 시 발생하는 오염먼지를 모두 깨끗이 제거해드립니다.', 'clean0003.jpg', 0, 0, 0, 1);

INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '마이인테리어', 'firm1234', 'firm0011@gmail.com', '서울특별시 중구 신당동 333-184 서울빌라', '02-825-2803', '투명한 원가 견적을 통한 합리적인 시공 서비스를 제공하고 있습니다. 무료방문상담 서비스를 제공하는 고객중심 서비스를 지향합니다.', 'Construction0001.jpg', 0, 1, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '고인테리어', 'firm1234', 'firm0012@gmail.com', '서울특별시 동작구 사당동 1007-33 서울빌딩', '02-982-6607', '상가, 일반 가정집 리모델링 전문 시공 업체입니다. 언제든지 문의 주시면 신속히 상담해드리겠습니다.', 'Construction0002.jpg', 0, 1, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '아워플레이스', 'firm1234', 'firm0013@gmail.com', '서울특별시 동대문구 답십리동 463-28', '02-235-3303', '합리적인 비용으로 최상의 시공 서비스를 제공하는 전문업체입니다. 감각있는 전문가의 손길을 통해 인테리어 고민을 줄여드리겠습니다.', 'Construction0003.jpg', 0, 1, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '굿플레이스', 'firm1234', 'firm0014@gmail.com', '서울특별시 강북구 수유동 472-209 동아빌딩', '02-487-3326', '고객과의 소통을 기반으로 최고의 시공서비스를 제공하는 인테리어 업체입니다. 꼼꼼한 무료견적상담 이후, 이를 바탕으로 인테리어를 돕겠습니다.', 'Construction0001.jpg', 0, 1, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '마이스페이스', 'firm1234', 'firm0015@gmail.com', '서울특별시 서초구 양재동 88-4 까사미아', '02-557-2091', '거품을 뺀 원가 견적을 내드리는 전문 시공 업체입니다. 합리적인 비용으로 최상의 시공 서비스를 제공하겠습니다.', 'Construction0002.jpg', 0, 1, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '굿인테리어', 'firm1234', 'firm0016@gmail.com', '서울특별시 강북구 미아동 474 미아 동부센트레빌', '02-237-3387', '합리적인 비용으로 최상의 시공 서비스를 제공하겠습니다. 일반 가정집 리모델링 전문업체입니다.', 'Construction0003.jpg', 0, 0, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '인테리어랑', 'firm1234', 'firm0017@gmail.com', '서울특별시 동대문구 답십리동 463-29', '02-237-3387', '합리적인 비용으로 최상의 시공 서비스를 제공하겠습니다. 거품을 뺀 원가 견적을 내드리는 전문 시공 업체입니다', 'Construction0001.jpg', 0, 0, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '뉴인테리어', 'firm1234', 'firm0018@gmail.com', '서울특별시 동대문구 전농동 497-55', '02-925-8520', '고객과의 소통을 기반으로 최고의 시공서비스를 제공하는 인테리어 업체입니다. 거품을 뺀 원가 견적을 내드리는 전문 시공 업체입니다', 'Construction0001.jpg', 0, 0, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '시공사', 'firm1234', 'firm0019@gmail.com', '서울특별시 동작구 상도동 산57-64', '02-765-6620', '거품을 뺀 원가 견적을 내드리는 전문 시공 업체입니다. 무료방문상담을 통해 보다 체계적으로 시공을 도와드립니다.', 'Construction0002.jpg', 0, 0, 0, 2);
INSERT INTO tblFirm (seq, id, pw, email, address, tel, introduction, portfolio, availablePoint, approval, delFlag, categorySeq) VALUES (seqFirm.nextVal, '시공월드', 'firm1234', 'firm0020@gmail.com', '서울특별시 영등포구 문래동6가 35', '02-765-6620', '고객과의 소통을 기반으로 최고의 시공서비스를 제공하는 인테리어 업체입니다. 거품을 뺀 원가 견적을 내드리는 전문 시공 업체입니다. 무료방문상담을 통해 보다 체계적으로 시공을 도와드립니다.', 'Construction0003.jpg', 0, 0, 0, 2);

/* 고객 요청서 */
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-02','yyyy-mm-dd'), '서울특별시 강남구 삼성동 25-12', '아파트', to_date('2021-01-05','yyyy-mm-dd'), '욕실 수리를 희망합니다.', 30, 2, 1);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-02','yyyy-mm-dd'), '서울특별시 강남구 삼성동 60 경기하이츠빌라', '빌라형 주택', to_date('2021-01-04','yyyy-mm-dd'), '도배를 새로 하고 싶습니다.', 48, 2, 2);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-03','yyyy-mm-dd'), '서울특별시 강남구 삼성동 35-22 삼성동 35-22 도시형생활주택', '주택', to_date('2021-01-05','yyyy-mm-dd'), '발코니 확장 공사를 의뢰하고 싶습니다.', 60, 2, 3);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-03','yyyy-mm-dd'), '서울특별시 강남구 삼성동 153-21 재경빌딩', '고층빌딩', to_date('2021-01-05','yyyy-mm-dd'), '바닥재 교체를 희망합니다.', 50, 2, 4);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-04','yyyy-mm-dd'), '서울특별시 강남구 역삼동 711-3 역삼자이아파트', '아파트', to_date('2021-01-07','yyyy-mm-dd'), '욕실 수리를 희망합니다. 현재 욕실 2개 모두 수리가 필요한 상태입니다.', 30, 2, 5);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-04','yyyy-mm-dd'), '서울특별시 강남구 역삼동 839-5 역삼동 839-5 공동주택', '주택', to_date('2021-01-07','yyyy-mm-dd'), '현재 거주하는 곳의 모든 문을 새로 교체하고 싶습니다.', 40, 2, 6);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-05','yyyy-mm-dd'), '서울특별시 강남구 역삼동 636-33 프리우스역삼아파트', '아파트', to_date('2021-01-07','yyyy-mm-dd'), '욕실 인테리어 공사를 의뢰드리려 합니다.', 43, 2, 7);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-05','yyyy-mm-dd'), '서울특별시 강남구 역삼동 636-33 프리우스역삼아파트', '아파트', to_date('2021-01-07','yyyy-mm-dd'), '창호 교체를 문의드리고 싶습니다.', 28, 2, 8);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-06','yyyy-mm-dd'), '서울특별시 강남구 신사동 535-26 소호빌딩', '아파트', to_date('2021-01-08','yyyy-mm-dd'), '발코니 확장 공사, 욕실 인테리어 공사를 의뢰드립니다.', 28, 2, 9);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-06','yyyy-mm-dd'), '서울특별시 강남구 신사동 502-1 비율라빌딩', '아파트', to_date('2021-01-09','yyyy-mm-dd'), '창호 교체, 단열재 교체를 희망합니다.', 35, 2, 10);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-07','yyyy-mm-dd'), '서울특별시 강남구 신사동 501 신사미타워', '아파트', to_date('2021-01-09','yyyy-mm-dd'), '발코니 확장 공사, 욕실 인테리어 공사를 의뢰드립니다.', 28, 2, 11);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-07','yyyy-mm-dd'), '서울특별시 강남구 청담동 2 신우빌딩', '빌라형 주택', to_date('2021-01-10','yyyy-mm-dd'), '단열재 교체 건을 문의 드립니다.', 40, 2, 12);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-08','yyyy-mm-dd'), '서울특별시 강남구 청담동 6 백영청담빌딩', '빌라형 주택', to_date('2021-01-10','yyyy-mm-dd'), '바닥재 전면 교체를 희망합니다.', 40, 2, 13);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-08','yyyy-mm-dd'), '서울특별시 강남구 청담동 5-25 청담휴먼스타빌', '빌라', to_date('2021-01-10','yyyy-mm-dd'), '도배를 전면 새로 하고 싶습니다.', 38, 2, 14);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-09','yyyy-mm-dd'), '서울특별시 강남구 대치동 503 개포1,2차 우성아파트', '아파트', to_date('2021-01-11','yyyy-mm-dd'), '발코니 확장 공사를 진행하고 싶습니다.', 28, 2, 15);

INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-09','yyyy-mm-dd'), '서울특별시 강남구 대치동 888 대치아이파크아파트', '아파트', to_date('2021-01-11','yyyy-mm-dd'), '이사 후, 청소를 희망합니다.', 28, 1, 16);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-10','yyyy-mm-dd'), '서울특별시 강남구 삼성동 140-6 현대시트빌딩', '고층빌딩', to_date('2021-01-13','yyyy-mm-dd'), '사무실 이전 후, 이사청소를 희망합니다.', 28, 1, 17);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-10','yyyy-mm-dd'), '서울특별시 강남구 삼성동 8-2 브라운스톤 레전드', '빌라', to_date('2021-01-13','yyyy-mm-dd'), '이사 후, 욕실만 청소 서비스를 희망합니다.', 32, 1, 18);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-11','yyyy-mm-dd'), '서울특별시 강남구 논현동 217-34 학동아파트', '아파트', to_date('2021-01-13','yyyy-mm-dd'), '거주하고 있는 집을 전체 청소하고 싶습니다.', 38, 1, 19);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-11','yyyy-mm-dd'), '서울특별시 강남구 논현동 238-10 시너지정형외과빌딩', '빌라', to_date('2021-01-13','yyyy-mm-dd'), '사무실 내 전체 공간을 청소 희망합니다.', 85, 1, 20);

-- 가짜 데이터
/*
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-12','yyyy-mm-dd'), '서울특별시 강남구 청담동 46-12 청담파크빌', '아파트', to_date('2021-01-15','yyyy-mm-dd'), '거주하는 집의 욕실 2개에 대한 청소 서비스를 희망합니다.', 32, 1, 21);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-12','yyyy-mm-dd'), '서울특별시 강남구 청담동 134-21 청담 삼익아파트', '아파트', to_date('2021-01-14','yyyy-mm-dd'), '이사 후의 청소 서비스를 문의드립니다.', 40, 1, 22);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-13','yyyy-mm-dd'), '서울특별시 강남구 논현동 119 포바강남타워', '빌라', to_date('2021-01-15','yyyy-mm-dd'), '현재 사무실 내 공간을 전체 청소 희망합니다.', 60, 1, 23);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-13','yyyy-mm-dd'), '서울특별시 강남구 청담동 43 청담우방아파트', '아파트', to_date('2021-01-16','yyyy-mm-dd'), '이사청소 서비스를 받고 싶습니다.', 60, 1, 24);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-14','yyyy-mm-dd'), '서울특별시 강남구 삼성동 3-1 삼성월드타워아파트', '아파트', to_date('2021-01-17','yyyy-mm-dd'), '거주하는 공간의 욕실만 청소를 희망합니다.', 60, 1, 25);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-14','yyyy-mm-dd'), '서울특별시 강남구 논현동 164-14 원창빌딩', '빌라', to_date('2021-01-17','yyyy-mm-dd'), '사무실 내의 모든 공간을 전체 청소하고 싶습니다.', 60, 1, 26);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-15','yyyy-mm-dd'), '서울특별시 강남구 대치동 511 한보미도맨션', '오피스텔', to_date('2021-01-17','yyyy-mm-dd'), '사무실 내의 모든 공간을 전체 청소하고 싶습니다.', 55, 1, 27);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-15','yyyy-mm-dd'), '서울특별시 강남구 대치동 506 선경아파트', '아파트', to_date('2021-01-18','yyyy-mm-dd'), '이사후, 전체 공간을 모두 청소하고 싶습니다.', 55, 1, 28);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-16','yyyy-mm-dd'), '서울특별시 강남구 대치동 942-4 쥬비스타워', '오피스텔', to_date('2021-01-20','yyyy-mm-dd'), '거주하는 공간을 전체 청소 서비스 신청합니다.', 30, 1, 29);
INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, to_date('2021-01-16','yyyy-mm-dd'), '서울특별시 강남구 청담동 43 청담우방아파트', '아파트', to_date('2021-01-21','yyyy-mm-dd'), '이사한 곳을 모두 청소하는 서비스를 문의 드립니다.', 30, 1, 30);
*/




--3단계




--1:1 문의
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '방 나갔나요?', '강남 햇빛 빌라 방 나갔나요??', to_date('2021-01-01 09:30', 'yyyy-mm-dd hh24:mi'), 1);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '위치 질문?', '정확한 위치가 궁금합니다!!!!!', to_date('2021-01-02 12:12', 'yyyy-mm-dd hh24:mi'), 2);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '전세 가격 문의?', '표기된 전세 가격이 정확한가요?', to_date('2021-01-03 15:32', 'yyyy-mm-dd hh24:mi'), 3);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '월세 문의', '해당 매물 보증금 올리고 월세 깎을 수 있을까요?', to_date('2021-01-03 13:23', 'yyyy-mm-dd hh24:mi'), 4);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '주변 시설 문의', '근처 어떠한 시설이 있는지 궁금합니다.', to_date('2021-01-04 09:12', 'yyyy-mm-dd hh24:mi'), 5);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '전세로 변경', '월세말고 전세로는 안되나요?', to_date('2021-01-04 12:32', 'yyyy-mm-dd hh24:mi'), 6);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '해당 매물 존재하나요??', '너무 마음에 들어서 그러는데 아직도 매물이 존재하나요??', to_date('2021-01-05 05:30', 'yyyy-mm-dd hh24:mi'), 7);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '방 햇빛', '방에 햇빛이 잘 드는지 궁금해요!!!', to_date('2021-01-05 09:30', 'yyyy-mm-dd hh24:mi'), 8);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '반전세로 가능할까요?', '해당 매물 반전세로 가능한지 궁금합니다.', to_date('2021-01-05 15:23', 'yyyy-mm-dd hh24:mi'), 9);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '월세가 너무 비싸네요', '월세를 조금만 깎을 수 없을까요', to_date('2021-01-05 09:30', 'yyyy-mm-dd hh24:mi'), 10);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '단기 계약', '3달만 방이 필요합니다. 단기로 계약 가능할까요?', to_date('2021-01-06 12:30', 'yyyy-mm-dd hh24:mi'), 11);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '전세 문의', '전세로 희망합니다.', to_date('2021-01-06 02:32', 'yyyy-mm-dd hh24:mi'), 12);
insert into tblChat (seq, subject, content, regDate, chatListSeq) values (seqChat.nextVal, '안녕하세요, 문의 드립니다.', '해당 매물과 비슷한 조건으로 논현동에 방 있을까요?', to_date('2021-01-07 09:30', 'yyyy-mm-dd hh24:mi'), 13);

--광고 결제
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-01-01', 'yyyy-mm-dd'), '삼성카드', 1, 1);
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-02-08', 'yyyy-mm-dd'), '삼성카드', 2, 2);
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-02-08', 'yyyy-mm-dd'), '우리카드', 3, 3);
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-01-03', 'yyyy-mm-dd'), 'NH농협카드', 4, 5);
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-01-03', 'yyyy-mm-dd'), '카카오페이카드', 5, 6);
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-01-04', 'yyyy-mm-dd'), '삼성카드', 6, 7);
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-01-04', 'yyyy-mm-dd'), 'NH농협카드', 7, 9);
insert into tblAdPay (seq, regDate, method, adInfoSeq, approBrokerSeq) values (seqAdPay.nextVal, to_date('2021-01-06', 'yyyy-mm-dd'), '우리카드', 8, 11);

--광고권한 
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 1);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 1, 2);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 1, 3);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 4);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 5);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 6);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 7);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 8);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 9);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 10);
insert into tblAdPermit (seq, permition, approBrokerSeq) values (seqAdPermit.nextVal, 0, 11);

--희망입주글
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 개포동',26,1,'숲세권에 가격이 착했으면 좋겠어요',1,1,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 압구정동',378,6,'역이랑 가까우면서 아이들 통학하기 좋은 집을 찾고있어요~^^',2,2,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 논현동',46,2,'가성비 좋은 투룸 구합니다',3,3,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 대치동',29,1,'근처에 헬스장 있는방 없나요?',4,4,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 신사동',132,4,'남향에 역이랑 가까우면 좋겠습니다',5,5,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 압구정동',35,2,'홈플러스쪽 집구합니다. 매매도 생각하고 있으니 연락주세요~',6,6,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 도곡동',77,3,'조망권좋고 교통망 좋은 집 구합니다',7,7,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 삼성동',70,3,'대치동 내 아파트/다세대주택 전월세 구합니다',8,8,1);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 세곡동',26,1,'등산을 하려 하는데 근처에 산이 있는곳 없나요?',9,9,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 수서동',82,3,'4인 가족이 머물 베란다 있는 아파트 구합니다',10,10,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 역삼동',57,2,'애완동물 사육 가능한 투룸 구합니다',11,11,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 신사동',245,4,'착한 가격에 넓고 새로지은집 찾습니다',12,12,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 역삼동',50,2,'남자 혼자살 전세집 구합니다',13,13,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 율현동',37,1,'원룸 전세 급하게 구합니다',14,14,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 일원동',53,2,'피아노 연주 가능한 집 구합니다',15,15,1);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 자곡동',29,1,'곰팡이가 안스는 곳으로 보증금 싼곳 구합니다',16,16,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 청담동',77,3,'겔러리 온듯한 착각에 빠지게 만드는 깔끔한 빌라구합니다',17,17,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 삼성동',33,1,'버스정류장/역이랑 가까운 오피스텔 구합니다',18,18,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 대치동',37,1,'치안 좋은 단기 원룸 구해요~',19,19,0);
insert into tblHopeWrite(seq,zone,area,roomAmount,content,memberSeq,hopePriceSeq,delFlag) values(seqHopeWrite.nextval,'서울시 강남구 개포동',46,2,'주차 가능하면서 역이랑 가까운집 구합니다',20,20,0);

-- 작성한자유_중개사
insert into tblFreeBroker values (seqFreeBroker.nextVal, 2, 2);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 4, 4);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 6, 6);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 8, 8);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 10, 4);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 12, 4);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 14, 2);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 16, 6);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 18, 6);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 20, 8);
insert into tblFreeBroker values (seqFreeBroker.nextVal, 22, 4);

-- 작성한문의_중개사
insert into tblInquiryBroker values (seqInquiryBroker.nextVal, 1, 1);
insert into tblInquiryBroker values (seqInquiryBroker.nextVal, 3, 3);
insert into tblInquiryBroker values (seqInquiryBroker.nextVal, 5, 5);
insert into tblInquiryBroker values (seqInquiryBroker.nextVal, 7, 7);

-- 작성한댓글_중개사
insert into tblCommentBroker values (seqCommentBroker.nextVal, 2, 1);
insert into tblCommentBroker values (seqCommentBroker.nextVal, 4, 3);
insert into tblCommentBroker values (seqCommentBroker.nextVal, 6, 5);
insert into tblCommentBroker values (seqCommentBroker.nextVal, 8, 7);
insert into tblCommentBroker values (seqCommentBroker.nextVal, 10, 9);

-- 후기삭제요청
insert into tblReviewDelete values (seqReviewDelete.nextVal, '저희 중개사와 거래한 고객이 아닙니다.', '2021-02-05', 1, 2, 0);
insert into tblReviewDelete values (seqReviewDelete.nextVal, '엉뚱한 후기를 올렸습니다.', '2021-02-05', 2, 7, 0);
insert into tblReviewDelete values (seqReviewDelete.nextVal, '거래하지 않은 회원이 후기를 올렸어요.', '2021-02-05', 3, 4, 0);

-- 방게시글 tblRoomPost(seq, memberSeq, roomInfoSeq, roomPriceSeq, subject, detail, regDate, delFlag)

-- 회원 20명 기준
insert into tblRoomPost values (seqRoomPost.nextVal, 1, 1, 1, '강남역 도보3분 풀옵션 내놓습니다.', '빌트인 테라스완비 채광 및 전망까지 좋은 오피스텔 내놓습니다. 중개해주실 중개사 구합니다.', to_date('2021-01-01', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 1, 2, 2, '역삼역 오피스텔 내놔요.', '역삼역 도보2분거리 강남역 도보7분거리 전망좋음 주변 편의시설 훌륭함 채광 굿굿굿', to_date('2021-01-02', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 2, 3, 3, '역삼역 근처 깔끔하고 넓은 오피스텔입니다.', '역삼역 근처이고 오피스텔이 넓습니다. 편의시설이 다양하고 역세권이라 이동이 편리합니다.', to_date('2021-01-03', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 2, 4, 4, '강남역 오피스텔 내놓습니다.', '강남역 오피스텔 입니다. 가격은 문의 가능합니다.', to_date('2021-01-04', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 3, 5, 5, '오피스텔 역삼 근처 리모델링 했습니다.', '리모델링한 오피스텔 저렴하게 내놓습니다.', to_date('2021-01-05', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 3, 6, 6, '신축급 역삼역 근처 풀옵션 오피스텔 내놔요.', '한달 가능 강남역과 역삼역 도보 5분(신축급) 깨끗하고 깔끔한 풀옵션입니다!', to_date('2021-01-06', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 4, 7, 7, '역삼역 오피스텔 월세로 내놔요.', '스포츠센터, 주민센터, 문화센터 등등 다양한 편의시설이 있습니다. 월세로 내놓습니다.', to_date('2021-01-07', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 4, 8, 8, '가성비 역삼 오피스텔 내놓습니다.', '역삼역 도보5분으로 지하철 이용이 가능합니다! 도보5분이내 버스정류장이 있어 교통이 편리합니다! 각종 편의시설이 주위에 위치하고 있습니다!', to_date('2021-01-08', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 5, 9, 9, '역삼역 도보5분 오피스텔 내놓습니다.', '1층 현관보안,비디오폰,CCTV,카드키 사용으로 보안철저!!', to_date('2021-01-09', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 5, 10, 10, '풀옵션 깔끔하고 넓은 역삼 오피스텔', '은행,병원,약국,초중고학교,대중교통,카페,편의점,마트 PC방,세탁소,빨래방 등 각종 편의시설이 인접해 있습니다.', to_date('2021-01-10', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 6, 11, 11, '원룸 귀한 전세로 내놔요.', '* 주차편리 * 생활편의시설 다양하게 위치 * 조용한 주거단지 * 채광 및 통풍 좋은 집', to_date('2021-01-11', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 6, 12, 12, '올수리한 원룸 내놔요.', '역삼역 도보 5분거리인 원룸이고 교통이 편리하고 접근성이 뛰어납니다.', to_date('2021-01-12', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 7, 13, 13, '원룸 풀옵션 월세 내놓습니다.', '역삼역 근처이며 풀옵션 월세 내놓습니다.​', to_date('2021-01-13', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 7, 14, 14, '풀옵션 원룸 역삼 근처 내놓습니다.', '-풀옵션 -저렴한 가격에 완전 넓은 평수 -보안이좋음', to_date('2021-01-14', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 8, 15, 15, '역삼역 3분거리 깔끔한 월세 내놔요.', '▷▶ 베란다있어서 공간활용 좋아요 ▷▶ 주방 세미분리형 좋아요 ▷▶ 역삼역 3분거리 근접해서 좋아요 ▷▶ 화장실 샤워부스 좋아요', to_date('2021-01-15', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 8, 16, 16, '월세 강남대성학원생들 추천 원룸입니다.', '◐ 난방방식 : 개별난방 ◐ 보안시설 : 현관 도어락 설치, 인터폰', to_date('2021-01-16', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 9, 17, 17, '월세로 원룸 역삼 근처 내놓습니다.', '-빌트인으로 공간활용 유리 -가격대비 넓은 평수 -체리톤과 화이트톤에 조화 -풀옵션 원룸', to_date('2021-01-16', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 9, 18, 18, '리모델링 완료된 원룸 역삼역 근처입니다.', '-리모델링 완료된 신축급 매물 -조명이 세련되고 밝음 -빌트인으로 공간활용 유리 -가격대비 최고의 인테리어 가성비 좋음 -채광좋고 환기 잘됨', to_date('2021-01-17', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 10, 19, 19, '역삼 근처고 올수리한 원룸 내놔요.', 'ㅇ 역삼역 도보 5분거리 ㅇ 교통이 편리하고 접근성이 뛰어남', to_date('2021-01-17', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 10, 20, 20, '보안 좋은 역삼 근처 원룸', 'ㅇ 강남역 도보 3분거리, 강남역 도보거리 ㅇ 강남대로와 버스노선 다수', to_date('2021-01-19', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 11, 21, 21, '역삼역 귀한 투룸 전세로 내놔요.', '▶ 역삼역 도보5분 조용한 주택가 ▶ 수도요금 포함 ▶ 1년 계약만 가능, 혼자사시는 분만 가능', to_date('2021-01-20', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 11, 22, 22, '초역세권역삼역 투룸 전세입니다.', '역삼역 도보 5분거리. 깔끔하고 넓은 투룸.', to_date('2021-01-21', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 12, 23, 23, '역삼동 투룸 내놓습니다. 전세입니다.', '- 역삼동 신축 투룸 오늘 나온 매물 입니다 - 깨끗하게 사용 중이며, 안방 붙밖이장 까지 잘 되어 있습니다.', to_date('2021-01-22', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 12, 24, 24, '깔끔한 투룸 전세고 역삼 근처입니다.', '▷▶ 맞벽나온 거실 좋아요 ▷▶ 에.세.냉 풀옵션 좋아요', to_date('2021-01-22', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 13, 25, 25, '몇없는 전세고 역삼역 투룸 내놔요.', '✔옵션: 에어컨, 냉장고, 세탁기 ✔주용도: 다세대주택 ✔보안: 보안시설o', to_date('2021-01-23', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 13, 26, 26, '투룸 월세 역삼역 근처 내놓습니다.', '️ 주침실의 공간이 넓고 창가쪽책상이 있어 편리합니다. ️ 방하나는 드레스룸이나 원하는 공간으로 활용이 가능합니다.', to_date('2021-01-24', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 14, 27, 27, '역삼역 도보5분 투룸 월세 내놓습니다.', '-수납좋은 붙박이장으로 정리 정돈에 최적입니다. -모던한 디자인으로 모든분들께 인기 만점입니다. -분리형 구조로 공간을 나눠 사용하실수있어 편리합니다.', to_date('2021-01-26', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 14, 28, 28, '강남역 역삼역 사이 투룸 월세 내놔요.', '용자 전혀 없습니다. 입주시기는 2월중으로 협의 바랍니다.', to_date('2021-01-26', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 15, 29, 29, '월세 역삼동 투룸 내놓습니다.', '@ 역삼역 언주역 강남역 도보가능한 위치에있습니다.', to_date('2021-01-27', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 15, 30, 30, '깔끔한 인테리어고 월세 역삼동입니다.', '빌트인 가구가 많아 수납 및 공간 활용성이 높습니다. 강남역과 7분거리에 위치해 있습니다.', to_date('2021-01-27', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 16, 31, 31, '아파트 역삼 매매로 내놓습니다. ', '올리모델링 호실로 투자가치 높은 물건입니다 문의가 많습니다. 서둘러 연락주세요~ 상담문의 환영~~', to_date('2021-01-28', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 16, 32, 32, '역삼역 인근 아파트 매매로 내놔요.', '역삼역 인근 아파트이고 매매로 내놓습니다. 보안이 철저합니다. 입주 바로 가능합니다.', to_date('2021-01-28', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 17, 33, 33, '강남역 초역세권 아파트 매매 내놔요.', '- 신분당선 강남역 도보 4분, 2호선 강남역 도보 6분 위치 - 강남역 인근 최상의 상업시설과 인프라', to_date('2021-01-29', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 17, 34, 34, '올수리 매매 역삼 아파트 내놔요.', '- 내부상태깨끗 - 바로입주가능합니다. - 단지내 다양한 편의시설과 상가 - 먹거리와 편의시설이 많은곳', to_date('2021-01-29', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 18, 35, 35, '강남역 초역세권 아파트 내놓습니다.', '- 정상입주 가능 입주일은 서로 조정 - 보시는건 미리 예약을 해야하니 전화주시면 상담해드리겠습니다.', to_date('2021-01-30', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 18, 36, 36, '주변 커뮤니티가 좋은 역삼 아파트 전세 내놔요.', '- 주택가 위치 - 먹거리와 편의시설이 많은곳', to_date('2021-01-31', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 19, 37, 37, '내부 올수리한 역삼역 아파트 전세 내놔요.', '- 채광 우수 - 베란다 양쪽으로 있고 내부 올수리 완료', to_date('2021-01-31', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 19, 38, 38, '역삼역 인근 아파트 전세 내놓습니다.', '아파트 전세로 내놓고요 역삼역 인근입니다. 중개사 구합니다.', to_date('2021-01-31', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 20, 39, 39, '역삼역 초인접 넓은 아파트 월세 내놓습니다.', '올리모델링 비품 및 컨디션 좋습니다', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 20, 40, 40, '저렴한 월세로 역삼 아파트 내놓습니다.', '○ 100% 실매물 100% 실가격입니다.', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 20, 41, 41, '역삼 오피스텔 내놓습니다.', '♥ 오늘 나온 역삼동 최저가 전세매물입니다 ♥ 즉시 입주 가능합니다 ♥ 전입신고 , 확정일자 가능 ', to_date('2021-02-02', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 20, 42, 42, '오피스텔 역삼역 근처 전세로 내놔요.', '✔ 오픈형 원룸구조로 사이즈 좋은 가성비  원룸입니다. ✔ 새롭게 도배를 하여 깨끗한 원룸입니다. ✔ 채광이 좋아 습기 곰팡이가 없는 구조입니다.', to_date('2021-02-03', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 20, 43, 43, '역삼역이 코앞인 오피스텔 월세 내놓습니다.', 'ㅇ 역삼동 국기원 블럭에 위치한 오픈형 원룸입니다 ㅇ2호선 역삼역, 강남역 / 9호선 언주역 , 신논현역', to_date('2021-02-04', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 20, 44, 44, '위치 좋은 역삼역 근처 오피스텔 월세 내놔요.', '올리모델링 비품 및 컨디션 좋습니다 주방분리형 구조에 베란다까지 있어 공간활용 좋습니다 공동현관 보안,CCTV 있어 보안 좋습니다!', to_date('2021-02-05', 'yyyy-mm-dd'), 0);
insert into tblRoomPost values (seqRoomPost.nextVal, 20, 45, 45, '역삼역 도보5분인 오피스텔 월세 내놓습니다.', '생활공간이 넓어 답답함이 없습니다! 큰 창문이 위치하고 있어 환풍과 환기에 용이합니다! 역삼역 도보5분거리에 위치하고 있습니다!', to_date('2021-02-05', 'yyyy-mm-dd'), 0);

-- 매물게시글 tblHousePost(seq, approBrokerSeq, houseInfoSeq, housePriceSeq, subject, content, regDate, delFlag)

-- 승인중개사가 20명 있다 가정 하에
-- 승인중개사가 11명이라서 살짝 수정했습니다.
insert into tblHousePost values (seqHousePost.nextVal, 1, 1, 1, '역삼역 신축 오피스텔! 분리형 원룸 원거실로 월세 보고 가세요~', '❤역삼역 센트럴 오피스텔❤ 역삼역 1번 출구 역세권입니다! 일대 8년만에 준공된 신축 오피스텔이며 스타일과 실용성을 더한 내외장 인테리어와 편리한 주변환경, 스마트한 라이프 인프라를 자랑합니다. 2호선 역삼역 역세권의 혜택과 쇼핑, 문화 그리고 비즈니스환경까지 완벽한 생활의 가치를 품었습니다. 편리한 자주식 및 기계식 혼합 형태의 주차장 설계로 총397대의 주차가 가능 합니다. 주말에도 출근을 하기 때문에 부담없이 보러오세요!', to_date('2021-01-02', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 2, 2, '역삼역 초역세권 풀옵션 오피스텔', '역삼역 도보2분거리 강남역 도보7분거리 전망좋음 주변 편의시설 훌륭함 채광 굿굿굿', to_date('2021-01-03', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 3, 3, '깔끔하고 넓은 호실입니다.', '대로변과 가까워 대중교통이용 하시기 편리합니다 도보5분거리안에 편의점 세탁소 은행등 편의시절이 있습니다 단기 매물 다수 보유 중이니 편하게 문의 주세요.', to_date('2021-01-04', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 4, 4, '강남역 오피스텔', '강남역 오피스텔 입니다 사이즈 특 大 오픈형으로 넓은 집 원하시는 분께 안성 맞춤!! 이외 다른 매물도 함께 같이 보실수 있습니다. 모두 직접 촬영한 실매물, 실사진, 실가격 광고를 등록하고 있습니다.', to_date('2021-01-05', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 5, 5, '할인가능VV 리모델링,통창,보안', '도배 청소도 새로해 굉장히 깔끔합니다 매일 실매물을 직접 찍어 올리며 내집구하듯 꼼꼼하게 체크/확인해드리겠습니다.', to_date('2021-01-06', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 6, 6, 'UU월세보증금협의가능UU 1달 가능한 신축급 역삼역 도보5분 깔끔한 풀옵션 오피스텔', '역삼역 인근 역세권이라 대중교통 걱정은 NONO 한달 가능 강남역과 역삼역 도보 5분(신축급) 깨끗하고 깔끔한 풀옵션~!!', to_date('2021-01-07', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 7, 7, '월세 강남대성학원생들 추천', '채광좋고 환기잘되는 곳으로 시원하고 따뜻한 구조 입니다 중개대상물 종류(용도) : 업무시설(오피스텔) 임대 : 일반임대 구조형태 : 오픈형 근처시설 : 스포츠센터, 주민센터, 문화센터 등등', to_date('2021-01-08', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 8, 8, '가성비 초특급 오피스텔', '깔끔하게 떨어지는 인테리어로 너무 예쁜집입니다 ☛  역삼역 도보5분으로 지하철 이용이 가능합니다! ☛  도보5분이내 버스정류장이 있어 교통이 편리합니다! ☛  각종 편의시설이 주위에 위치하고 있습니다!', to_date('2021-01-09', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 2, 9, 9, '1달 가능한 신축급 역삼역 도보5분 풀옵션 오피스텔', '1층 현관보안,비디오폰,CCTV,카드키 사용으로 보안철저!! 냉장고 조건부 인수입니다. 강남 서초 송파 전지역 매물 보유. 강남 전지역 픽업가능합니다', to_date('2021-01-10', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 2, 10, 10, '강남역 도보5분 빌트인 풀옵션 깔끔하고 넓은 호실', '은행,병원,약국,초중고학교,대중교통,카페,편의점,마트 PC방,세탁소,빨래방 등 각종 편의시설이 인접해 있습니다. 365일 24시간 언제나 상담,중개 가능합니다. ', to_date('2021-01-11', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 3, 11, 11, '역삼역세권 직장인추천 원룸 귀한 전세', '* 주차편리 * 생활편의시설 다양하게 위치 * 조용한 주거단지 * 채광 및 통풍 좋은 집', to_date('2021-01-12', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 3, 12, 12, '할인가능VV 올수리첫입주,선착순', '제가 직접 찍은 실매물, 실사진 입니다. ㅇ 역삼역 도보 5분거리 ㅇ 교통이 편리하고 접근성이 뛰어남', to_date('2021-01-13', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 4, 13, 13, '역삼역 3분 거리 위치한 원룸 풀옵션 단기임대', '내부는 도배 완료된 상태로 컨디션 좋습니다! ○ 24시 전화 or 문자 문의 가능!! 늦은 시간에도 친절한 상담 도와드리겠습니다. 편하게 문의주세요~ ○ 퇴근시간 이후 늦은 시간에도 부동산 방문 및 매물 확인 가능합니다!​', to_date('2021-01-14', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 4, 14, 14, '우드톤 저렴하고 넓은 풀옵션 원룸 치안좋은 원룸', '-풀옵션 -저렴한 가격에 완전 넓은 평수 -보안이좋음 근처 편의시설 역시 잘 갖춰져 있습니다.', to_date('2021-01-15', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 5, 15, 15, '역삼역 3분거리 깔끔한 월세 세미 분리형 원룸', '▷▶ 베란다있어서 공간활용 좋아요 ▷▶ 주방 세미분리형 좋아요 ▷▶ 역삼역 3분거리 근접해서 좋아요 ▷▶ 화장실 샤워부스 좋아요', to_date('2021-01-16', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 5, 16, 16, '월세 강남대성학원생들 추천', '◐ 난방방식 : 개별난방 ◐ 보안시설 : 현관 도어락 설치, 인터폰', to_date('2021-01-17', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 6, 17, 17, '조용하고 여유공간이 있는 추천 원룸', '-빌트인으로 공간활용 유리 -가격대비 넓은 평수 -체리톤과 화이트톤에 조화 -풀옵션 원룸 리모델링 컨디션좋은 !  분리형구조 원룸 큰방입니다. 공실 즉시입주가능합니다.', to_date('2021-01-17', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 6, 18, 18, '유럽풍 인테리어로 리모델링 완료된 원룸', '역삼역 도보3분, 강남역, 버스노선 다수 -리모델링 완료된 신축급 매물 -조명이 세련되고 밝음 -빌트인으로 공간활용 유리 -가격대비 최고의 인테리어 가성비 좋음 -채광좋고 환기 잘됨', to_date('2021-01-18', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 7, 19, 19, '올수리첫입주, 선착순', 'ㅇ 역삼역 도보 5분거리 ㅇ 교통이 편리하고 접근성이 뛰어남', to_date('2021-01-18', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 7, 20, 20, '보안,통창,전망', 'ㅇ 강남역 도보 3분거리, 강남역 도보거리 ㅇ 강남대로와 버스노선 다수 즉시 입주가능합니다! 침대,책상,책장,의자등 무료 인수 가능합니다.', to_date('2021-01-20', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 21, 21, '역삼역 도보 5분 귀한 투룸 전세', '▶ 역삼역 도보5분 조용한 주택가 ▶ 수도요금 포함 ▶ 1년 계약만 가능, 혼자사시는 분만 가능', to_date('2021-01-21', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 22, 22, '초역세권역삼역 예쁜방 넓은투룸', '역삼역 도보 5분거리. 깔끔하고 넓은 투룸. 대로변 가까운 위치, 교통 역삼에서 최상의 조건입니다.', to_date('2021-01-22', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 9, 23, 23, '역삼동 투룸 거실공간 굿', '- 역삼동 신축 투룸 오늘 나온 매물 입니다 - 깨끗하게 사용 중이며, 안방 붙밖이장 까지 잘 되어 있습니다. 주말에도 출근을 하기 때문에 부담없이 보러오세요!', to_date('2021-01-23', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 9, 24, 24, '역삼역~언주역 모두 도보이용가능합니다 깔끔한 투룸 전세', '▷▶ 맞벽나온 거실 좋아요 ▷▶ 에.세.냉 풀옵션 좋아요', to_date('2021-01-23', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 25, 25, '몇없는 전세 방입니다.', '✔옵션: 에어컨, 냉장고, 세탁기 ✔주용도: 다세대주택 ✔보안: 보안시설o', to_date('2021-01-24', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 26, 26, '투룸구조 창가쪽 책상이 매력인 집', '️ 주침실의 공간이 넓고 창가쪽책상이 있어 편리합니다. ️ 방하나는 드레스룸이나 원하는 공간으로 활용이 가능합니다.', to_date('2021-01-25', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 11, 27, 27, '역삼역 도보5분 사이즈좋은 투룸', '-수납좋은 붙박이장으로 정리 정돈에 최적입니다. -모던한 디자인으로 모든분들께 인기 만점입니다. -분리형 구조로 공간을 나눠 사용하실수있어 편리합니다.', to_date('2021-01-27', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 11, 28, 28, '조용한 주택가 강남역 역삼역 사이', '용자 전혀 없습니다. 입주시기는 2월중으로 협의 바랍니다.', to_date('2021-01-27', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 4, 29, 29, 'v월세조정가능v 역삼동', '@ 역삼역 언주역 강남역 도보가능한 위치에있습니다.', to_date('2021-01-28', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 4, 30, 30, '깔끔한 인테리어 큰창', '빌트인 가구가 많아 수납 및 공간 활용성이 높습니다. 강남역과 7분거리에 위치해 있습니다.', to_date('2021-01-28', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 4, 31, 31, '올리모델링 실입주가능 ', '올리모델링 호실로 투자가치 높은 물건입니다 문의가 많습니다. 서둘러 연락주세요~ 상담문의 환영~~', to_date('2021-01-29', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 6, 32, 32, '역삼역 인근 아파트', '2호선, 9호선 같은블럭에 붙어있습니다 전화문의주시면 안전하게 진행해 드리겠습니다.', to_date('2021-01-29', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 6, 33, 33, '가장 귀한 강남역 초역세권', '주택가 중심으로 보안 좋습니다 - 신분당선 강남역 도보 4분, 2호선 강남역 도보 6분 위치 - 강남역 인근 최상의 상업시설과 인프라', to_date('2021-01-30', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 7, 34, 34, '올수리 매매', '화이트톤의 화사하고 하~얀 매물 - 내부상태깨끗 - 바로입주가능합니다. - 단지내 다양한 편의시설과 상가 - 먹거리와 편의시설이 많은곳', to_date('2021-01-30', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 7, 35, 35, '강남역 초역세권 갭투자 가능', '- 정상입주 가능 입주일은 서로 조정 - 보시는건 미리 예약을 해야하니 전화주시면 상담해드리겠습니다.', to_date('2021-01-31', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 3, 36, 36, '보안및 주변 커뮤니티가 좋습니다.', '- 주택가 위치 - 먹거리와 편의시설이 많은곳 희소성 있는 추천 매물 입니다.', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 2, 37, 37, '내부 올수리 완료', '★ 정직과 신뢰를 가지고 최선을 다해 중개 하겠습니다.★ - 채광 우수 - 베란다 양쪽으로 있고 내부 올수리 완료 편의시설이 한곳에 밀집되어 있어 생활 편리성이 아주 높은곳!! ', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 2, 38, 38, '역삼역 인근 아파트', '건물내  CCTV와 세컴이있어 보안도 좋습니다. 전화문의주시면 안전하게 진행해 드리겠습니다. 무융자 전세자금 대출 가능', to_date('2021-02-01', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 39, 39, '역삼역 초인접 넓은 아파트 단기', '올리모델링 비품 및 컨디션 좋습니다 3개월 기준 금액으로 1~2개월은 협의 후 가능합니다. ', to_date('2021-02-02', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 1, 40, 40, '가성비 좋은 저렴한 아파트 월세', '사이즈로 승부하는 가성비끝판왕 ○ 100% 실매물 100% 실가격입니다.', to_date('2021-02-02', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 41, 41, '♥ 역삼 최저가 전세 ♥ ', '♥ 오늘 나온 역삼동 최저가 전세매물입니다 ♥ 즉시 입주 가능합니다 ♥ 전입신고 , 확정일자 가능 ', to_date('2021-02-03', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 8, 42, 42, '역삼 역세권 넓고 저렴한원룸!', '✔ 오픈형 원룸구조로 사이즈 좋은 가성비  원룸입니다. ✔ 새롭게 도배를 하여 깨끗한 원룸입니다. ✔ 채광이 좋아 습기 곰팡이가 없는 구조입니다.', to_date('2021-02-04', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 11, 43, 43, '역삼역이 바로 코앞에~!!!', '화이트톤 빌트인으로 깔끔합니다. ㅇ 역삼동 국기원 블럭에 위치한 오픈형 원룸입니다 ㅇ2호선 역삼역, 강남역 / 9호선 언주역 , 신논현역', to_date('2021-02-05', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 10, 44, 44, '역삼역 위치 좋은 원룸', '올리모델링 비품 및 컨디션 좋습니다 주방분리형 구조에 베란다까지 있어 공간활용 좋습니다 공동현관 보안,CCTV 있어 보안 좋습니다!', to_date('2021-02-06', 'yyyy-mm-dd'), 0);
insert into tblHousePost values (seqHousePost.nextVal, 5, 45, 45, '역삼역 도보5분 모던 원룸!', '생활공간이 넓어 답답함이 없습니다! 큰 창문이 위치하고 있어 환풍과 환기에 용이합니다! 역삼역 도보5분거리에 위치하고 있습니다!', to_date('2021-02-06', 'yyyy-mm-dd'), 0);

/* 승인업체목록 */
/* 업체 번호 1~5, 11~15는 승인완료업체*/
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 1, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 2, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 3, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 4, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 5, to_date('2021-01-01','yyyy-mm-dd'));

INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 11, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 12, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 13, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 14, to_date('2021-01-01','yyyy-mm-dd'));
INSERT INTO tblApprovalF (seq, firmSeq, approvalDate) VALUES (seqApprovalF.nextVal, 15, to_date('2021-01-01','yyyy-mm-dd'));




--4단계




--매물추천
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 1, 1);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 2, 1);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 3, 4);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 4, 5);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 5, 6);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 6, 7);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 7, 4);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 8, 3);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 9, 1);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 10, 7);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 12, 8);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 13, 9);
insert into tblRecoHouse (seq, hopeWriteSeq, approBrokerSeq) values (seqRecoHouse.nextVal, 14, 6);

--광고 시작
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 1);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 2);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 3);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 4);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 5);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 6);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 7);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 8);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 2, 9);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 2, 10);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 3, 11);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 3, 12);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 4, 15);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 4, 16);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 5, 17);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 5, 18);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 6, 19);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 6, 20);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 7, 23);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 7, 24);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 8, 27);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 8, 28);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 5, 32);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 5, 33);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 6, 34);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 6, 35);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 3, 36);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 2, 37);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 2, 38);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 39);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 1, 40);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 4, 43);
insert into tblPostAd (seq, adPaySeq, housePostSeq) values (seqPostAd.nextVal, 6, 45);

--가상인테리어
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,1,'img1.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,2,'img2.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,3,'img3.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,4,'img4.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,5,'img5.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,6,'img6.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,7,'img7.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,8,'img8.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,9,'img9.png');
insert into tblVRInterior(seq,hopeWriteSeq,imgURL) values(seqVRInterior.nextVal,10,'img10.png');

--허위매물신고
insert into tblFalseReport(seq,housePostSeq,memberSeq,reportReason,delFlag) values(seqFalseReport.nextVal,3,3,'매물이 나갔음',0);
insert into tblFalseReport(seq,housePostSeq,memberSeq,reportReason,delFlag) values(seqFalseReport.nextVal,4,12,'등록된 정보와 다름',0);
insert into tblFalseReport(seq,housePostSeq,memberSeq,reportReason,delFlag) values(seqFalseReport.nextVal,7,14,'매물이 나갔음',0);
insert into tblFalseReport(seq,housePostSeq,memberSeq,reportReason,delFlag) values(seqFalseReport.nextVal,12,16,'등록된 정보와 다름',1);

-- 방이미지 tblRoomImg(seq, url, roomPostSeq)

-- 게시글 당 사진 2개
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 1);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 1);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 2);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 2);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 3);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 3);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 4);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 4);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 5);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 5);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 6);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 6);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 7);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 7);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 8);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 8);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 9);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 9);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 10);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 10);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 11);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 11);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 12);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 12);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 13);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 13);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 14);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 14);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 15);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 15);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 16);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 16);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 17);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 17);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 18);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 18);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 19);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 19);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 20);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 20);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 21);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 21);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 22);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 22);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 23);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 23);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 24);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 24);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 25);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 25);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 26);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 26);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 27);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 27);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 28);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 28);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 29);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 29);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 30);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 30);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 31);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 31);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 32);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 32);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 33);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 33);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 34);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 34);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 35);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 35);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 36);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 36);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 37);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 37);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 38);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 38);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 39);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 39);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 40);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 40);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0001.jpg', 41);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0002.jpg', 41);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0003.jpg', 42);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0004.jpg', 42);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0005.jpg', 43);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0006.jpg', 43);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0007.jpg', 44);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0008.jpg', 44);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0009.jpg', 45);
insert into tblRoomImg values (seqRoomImg.nextVal, 'room0010.jpg', 45);

-- 매물이미지 tblHouseImg(seq, url, housePostSeq)

-- 게시글 당 사진 2개
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 1);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 1);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 2);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 2);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 3);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 3);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 4);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 4);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 5);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 5);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 6);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 6);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 7);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 7);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 8);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 8);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 9);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 9);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 10);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 10);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 11);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 11);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 12);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 12);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 13);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 13);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 14);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 14);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 15);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 15);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 16);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 16);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 17);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 17);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 18);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 18);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 19);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 19);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 20);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 20);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 21);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 21);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 22);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 22);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 23);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 23);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 24);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 24);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 25);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 25);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 26);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 26);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 27);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 27);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 28);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 28);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 29);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 29);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 30);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 30);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 31);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 31);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 32);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 32);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 33);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 33);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 34);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 34);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 35);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 35);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 36);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 36);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 37);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 37);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 38);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 38);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 39);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 39);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 40);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 40);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0001.jpg', 41);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0002.jpg', 41);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0003.jpg', 42);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0004.jpg', 42);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0005.jpg', 43);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0006.jpg', 43);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0007.jpg', 44);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0008.jpg', 44);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0009.jpg', 45);
insert into tblHouseImg values (seqHouseImg.nextVal, 'house0010.jpg', 45);

-- 매물거래상태 tblHouseDealState(seq, housePostSeq, state)
insert into tblHouseDealState values (seqHouseDealState.nextVal, 1, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 2, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 3, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 4, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 5, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 6, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 7, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 8, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 9, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 10, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 11, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 12, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 13, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 14, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 15, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 16, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 17, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 18, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 19, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 20, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 21, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 22, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 23, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 24, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 25, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 26, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 27, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 28, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 29, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 30, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 31, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 32, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 33, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 34, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 35, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 36, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 37, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 38, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 39, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 40, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 41, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 42, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 43, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 44, 0);
insert into tblHouseDealState values (seqHouseDealState.nextVal, 45, 0);

/* 업체 견적서 */
/*
매칭된 데이터(고객요청서 - 업체 견적서 간)
고객 11 - 업체1(승인번호1) / 고객12- 업체2(승인번호 2) / 고객13 - 업체3, 업체4, 업체5
고객 1- 업체 11(승인번호 6) / 고객 2 - 업체 12(승인번호 7) / 고객 13 업체 13(승인번호 8), 업체 15(승인번호 10)

채택은 11-1, 12-2, 13-3 / 1-11, 2-12, 3-13
*/

INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-02','yyyy-mm-dd'), 6, 1, 2000000, '안녕하세요, 고객님의 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 욕실 1개를 시공을 진행하실 경우의 평균가임을 안내 드립니다.(30평 일반 가정집의 욕실). 시공의 경우, 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 1);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-01','yyyy-mm-dd'), 7, 2, 1200000, '안녕하세요, 고객님의 도배서비스 요청서에 대한 간략한 예비견적서를 드립니다. 우선 벽지 소재에 대한 언급이 없으신데, 벽지 옵션의 선택에 따라 비용의 차이가 많이 나게 됩니다. 광폭합지로 전면 도배를 선택하시는 것과 실크지로 전면 도배를 선택하시는 것은 40평 기준, 총 120만원 정도의 비용차가 발생합니다. 모든 곳에 광폭합지로 도배를 원하신다면 약 160만원의 비용이 예상됩니다. 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 1);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-02','yyyy-mm-dd'), 8, 3, 5000000, '안녕하세요, 고객님의 요청서에 대한 간략한 예비견적서를 드립니다. 발코니 확장공사의 경우, 평균 500만원 근처의 비용으로 예상견적을 내드리고 있습니다. 난방/보온/단열 작업 옵션을 추가하지 않은 60평 발코니 확장 공사에 대한 평균 금액이라고 생각하시면 되겠습니다^^ 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 1);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-02','yyyy-mm-dd'), 10, 3, 6800000, '안녕하세요, 발코니 확장공사 요청서에 대한 예비견적서를 드립니다. 발코니 확장공사의 경우, 저희 업체는 평균 700만원 근처의 비용으로 진행을 하고 있습니다. 요즘 많이 선택하시는 폴딩 도어 추가 옵션이 포함된 60평 발코니 확장 공사에 대한 평균 금액입니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);

INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 1, 16, 250000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 전체 거주공간 청소를 희망하실 시 평균가임을 안내 드립니다. 일반 가정집 28평의 경우, 30만원 안으로 이사청소 서비스를 진행해드리고 있습니다. 새집증후군 예방을 위한 곰팡이 제거 옵션을 선택 시, 추가 비용을 5만원으로 책정하고 있습니다^^ 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 1);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 2, 17, 280000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 비용의 경우, 30평 내외의 공간은 평균 28만원 정도의 금액으로 전 공간 청소서비스를 진행합니다. 얼룩, 페인트 잉크 제거 옵션을 선택 시, 추가적인 비용이 발생할 수 있음을 안내 드립니다. 직접 전화 혹은 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 1);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-11','yyyy-mm-dd'), 3, 18, 200000, '안녕하세요, 고객님의 욕실 청소 요청서에 대한 간략한 예비견적서를 드립니다. 욕실 청소 비용의 경우, 평수가 적기 때문에 평균 10만원의 기본 금액에 필요하신 옵션을 추가하여 진행하는 방향으로 서비스를 제공해드리고 있습니다^^ 많이들 추가하시는 옵션인 곰팡이 제거, 살균 소독 옵션을 선택 시, 총 비용은 20만원이라고 예상됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 1);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-11','yyyy-mm-dd'), 4, 18, 100000, '안녕하세요, 고객님의 요청서에 대한 예비견적서를 드립니다. 욕실만 청소를 하실 경우, 평균 10만원 근처의 비용으로 진행을 하고 있습니다. 이는 추가옵션 선택이 없을 시에 대한 평균 금액입니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-11','yyyy-mm-dd'), 5, 18, 150000, '안녕하세요, 고객님의 요청서에 대한 예비견적서를 드립니다. 욕실 중, 1 곳만 청소를 원하신다면 평균 15만원 근처의 비용으로 진행을 하고 있습니다. 저희 업체의 경우 살균소독을 통해 서비스 품질을 보장해드릴 수 있습니다^^ 추가옵션 선택이 없을 시에 대한 평균 금액입니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);

-- 포인트 사용내역과 연결할 미채택 견적서발송내역
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 1, 11, 250000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 전체 거주공간 청소를 희망하실 시 평균가임을 안내 드립니다. 일반 가정집 28평의 경우, 30만원 안으로 이사청소 서비스를 진행해드리고 있습니다. 새집증후군 예방을 위한 곰팡이 제거 옵션을 선택 시, 추가 비용을 5만원으로 책정하고 있습니다^^ 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 1, 11, 250000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 전체 거주공간 청소를 희망하실 시 평균가임을 안내 드립니다. 일반 가정집 28평의 경우, 30만원 안으로 이사청소 서비스를 진행해드리고 있습니다. 새집증후군 예방을 위한 곰팡이 제거 옵션을 선택 시, 추가 비용을 5만원으로 책정하고 있습니다^^ 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 1, 11, 250000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 전체 거주공간 청소를 희망하실 시 평균가임을 안내 드립니다. 일반 가정집 28평의 경우, 30만원 안으로 이사청소 서비스를 진행해드리고 있습니다. 새집증후군 예방을 위한 곰팡이 제거 옵션을 선택 시, 추가 비용을 5만원으로 책정하고 있습니다^^ 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);

INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 2, 11, 250000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 전체 거주공간 청소를 희망하실 시 평균가임을 안내 드립니다. 일반 가정집 28평의 경우, 30만원 안으로 이사청소 서비스를 진행해드리고 있습니다. 새집증후군 예방을 위한 곰팡이 제거 옵션을 선택 시, 추가 비용을 5만원으로 책정하고 있습니다^^ 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 2, 10, 250000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 전체 거주공간 청소를 희망하실 시 평균가임을 안내 드립니다. 일반 가정집 28평의 경우, 30만원 안으로 이사청소 서비스를 진행해드리고 있습니다. 새집증후군 예방을 위한 곰팡이 제거 옵션을 선택 시, 추가 비용을 5만원으로 책정하고 있습니다^^ 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);
INSERT INTO tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) VALUES (seqEstimate1th.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 2, 9, 250000, '안녕하세요, 고객님의 이사청소 요청서에 대한 간략한 예비견적서를 드립니다. 우선 예상비용은 저희 업체 측에서 추가 옵션 선택없이 전체 거주공간 청소를 희망하실 시 평균가임을 안내 드립니다. 일반 가정집 28평의 경우, 30만원 안으로 이사청소 서비스를 진행해드리고 있습니다. 새집증후군 예방을 위한 곰팡이 제거 옵션을 선택 시, 추가 비용을 5만원으로 책정하고 있습니다^^ 직접 방문상담을 통해서 정확한 견적을 받아보시는 것이 준비에 있어 도움이 됩니다. 자세한 문의상담을 이어가기 위해 저희 업체 쪽으로 상담 신청을 주시면 신속하고 친절한 답변드리겠습니다. 감사합니다.', 0);

/* 포인트 결제기록 */
INSERT INTO tblPaymentLog (seq, paymentDate, payment, approvalFSeq) VALUES (seqPaymentLog.nextVal, to_date('2021-01-01','yyyy-mm-dd'), 5000, 1);
INSERT INTO tblPaymentLog (seq, paymentDate, payment, approvalFSeq) VALUES (seqPaymentLog.nextVal, to_date('2021-01-01','yyyy-mm-dd'), 10000, 2);

/* 포인트 사용기록 */
/*
하루 견적서 3개 발송 이후, 
동일 날짜에 견적서 발송하려면 포인트 500(가격 500원) 필요.
*/
INSERT INTO tblUsageLog (seq, usageDate, useAmount, approvalFSeq) VALUES (seqUsageLog.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 500, 1);
INSERT INTO tblUsageLog (seq, usageDate, useAmount, approvalFSeq) VALUES (seqUsageLog.nextVal, to_date('2021-01-10','yyyy-mm-dd'), 500, 2);

/* 1:1 온라인 상담 */
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:10', 'yyyy-mm-dd hh24:mi'), 1, '안녕하세요, 견적 상담을 신청하고 싶어서 1:1 문의드리게 되었습니다. 혹시 내일도 상담이 가능하실지요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:12', 'yyyy-mm-dd hh24:mi'), 1, '네, 가능합니다. 시간은 오후 12시 ~ 8시 사이로 방문상담 진행 가능합니다.',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:20', 'yyyy-mm-dd hh24:mi'), 1, '그러면 방문상담 내일 오후 3시 가능하실까요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 13:01', 'yyyy-mm-dd hh24:mi'), 1, '네, 고객님과 바로 연락 가능한 연락처 남겨주시면 감사하겠습니다. 방문상담 진행 30분 전에 문자 알림 드리겠습니다^^',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 13:04', 'yyyy-mm-dd hh24:mi'), 1, '네, 제 연락처는 010-***-****입니다. 이리로 전화주시거나 문자 주시면 됩니다. 내일 뵙겠습니다.',0);

INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:10', 'yyyy-mm-dd hh24:mi'), 2, '안녕하세요, 견적 상담을 신청하고 싶어서 1:1 문의드리게 되었습니다. 혹시 4일도 상담이 가능하실지요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:12', 'yyyy-mm-dd hh24:mi'), 2, '네, 가능합니다. 시간은 오후 12시 ~ 8시 사이로 방문상담 진행 가능합니다. 전화 상담, 방문상담 진행 모두 가능하나 확실하고 자세한 견적상담을 위해 가급적 방문상담을 권해드리고 있습니다.',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:20', 'yyyy-mm-dd hh24:mi'), 2, '그러면 방문상담 1월 4일 오후 1시 가능하실까요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 13:01', 'yyyy-mm-dd hh24:mi'), 2, '네, 고객님과 바로 연락 가능한 연락처 남겨주시면 감사하겠습니다. 방문상담 진행 30분 전에 문자 알림 드리겠습니다^^',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 13:04', 'yyyy-mm-dd hh24:mi'), 2, '네, 제 연락처는 010-***-****입니다. 이리로 전화주시거나 문자 주시면 됩니다. 내일 뵙겠습니다.',0);

INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:10', 'yyyy-mm-dd hh24:mi'), 3, '안녕하세요, 견적 상담을 신청하고 싶어서 1:1 문의드리게 되었습니다. 혹시 1월 3일도 상담이 가능하실지요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:12', 'yyyy-mm-dd hh24:mi'), 3, '네, 가능합니다. 시간은 오후 12시 ~ 8시 사이로 방문상담 진행 가능합니다. 전화 상담, 방문상담 진행 모두 가능하나 확실하고 자세한 견적상담을 위해 가급적 방문상담을 권해드리고 있습니다.',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 12:20', 'yyyy-mm-dd hh24:mi'), 3, '그러면 전화상담 3일 오후 1시 가능하실까요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 13:01', 'yyyy-mm-dd hh24:mi'), 3, '네, 고객님과 바로 연락 가능한 연락처 남겨주시면 감사하겠습니다. 상담 진행 30분 전에 문자 알림 드리겠습니다^^',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02 13:04', 'yyyy-mm-dd hh24:mi'), 3, '네, 제 연락처는 010-***-****입니다. 이리로 전화주시거나 문자 주시면 됩니다. 내일 뵙겠습니다.',0);

INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 5, '안녕하세요, 견적 상담을 신청하고 싶어서 1:1 문의드리게 되었습니다. 혹시 6일도 상담이 가능하실지요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 5, '네, 가능합니다. 시간은 오후 12시 ~ 8시 사이로 방문상담 진행 가능합니다. 전화 상담, 방문상담 진행 모두 가능하나 확실하고 자세한 견적상담을 위해 가급적 방문상담을 권해드리고 있습니다.',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 5, '그러면 전화상담 1월 6일 오후 1시 가능하실까요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 5, '네, 고객님과 바로 연락 가능한 연락처 남겨주시면 감사하겠습니다. 상담 진행 30분 전에 문자 알림 드리겠습니다^^',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 5, '네, 제 연락처는 010-***-****입니다. 이리로 전화주시거나 문자 주시면 됩니다. 내일 뵙겠습니다.',0);

INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 6, '안녕하세요, 견적 상담을 신청하고 싶어서 1:1 문의드리게 되었습니다. 혹시 7일도 상담이 가능하실지요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 6, '네, 가능합니다. 시간은 오후 12시 ~ 8시 사이로 방문상담 진행 가능합니다. 전화 상담, 방문상담 진행 모두 가능하나 확실하고 자세한 견적상담을 위해 가급적 방문상담을 권해드리고 있습니다.',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 6, '그러면 방문상담 1월 7일 오후 1시 가능하실까요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 6, '네, 고객님과 바로 연락 가능한 연락처 남겨주시면 감사하겠습니다. 방문상담 진행 30분 전에 문자 알림 드리겠습니다^^',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 6, '네, 제 연락처는 010-***-****입니다. 이리로 전화주시거나 문자 주시면 됩니다. 내일 뵙겠습니다.',0);

INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 7, '안녕하세요, 견적 상담을 신청하고 싶어서 1:1 문의드리게 되었습니다. 혹시 1월 8일 상담이 가능하실지요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 7, '네, 가능합니다. 시간은 오후 12시 ~ 8시 사이로 방문상담 진행 가능합니다. 전화 상담, 방문상담 진행 모두 가능하나 확실하고 자세한 견적상담을 위해 가급적 방문상담을 권해드리고 있습니다.',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 7, '그러면 방문상담 1월 8일 오후 1시 가능하실까요?',0);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 7, '네, 고객님과 바로 연락 가능한 연락처 남겨주시면 감사하겠습니다. 방문상담 진행 30분 전에 문자 알림 드리겠습니다^^',1);
INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent,whoFlag) VALUES (seqChatAsk.nextVal, to_date('2021-01-02', 'yyyy-mm-dd hh24:mi'), 7, '네, 제 연락처는 010-***-****입니다. 이리로 전화주시거나 문자 주시면 됩니다. 내일 뵙겠습니다.',0);

/* 견적상담 */
INSERT INTO tblEstimate (seq, estimate1thSeq, consultationSeq, estimateDay) VALUES (seqEstimate.nextVal, 1, 1, to_date('2021-01-03','yyyy-mm-dd'));
INSERT INTO tblEstimate (seq, estimate1thSeq, consultationSeq, estimateDay) VALUES (seqEstimate.nextVal, 2, 1, to_date('2021-01-04','yyyy-mm-dd'));
INSERT INTO tblEstimate (seq, estimate1thSeq, consultationSeq, estimateDay) VALUES (seqEstimate.nextVal, 3, 2, to_date('2021-01-03','yyyy-mm-dd'));

INSERT INTO tblEstimate (seq, estimate1thSeq, consultationSeq, estimateDay) VALUES (seqEstimate.nextVal, 5, 2, to_date('2021-01-06','yyyy-mm-dd'));
INSERT INTO tblEstimate (seq, estimate1thSeq, consultationSeq, estimateDay) VALUES (seqEstimate.nextVal, 6, 1, to_date('2021-01-07','yyyy-mm-dd'));
INSERT INTO tblEstimate (seq, estimate1thSeq, consultationSeq, estimateDay) VALUES (seqEstimate.nextVal, 7, 1, to_date('2021-01-08','yyyy-mm-dd'));

/* 서비스 완료 */
INSERT INTO tblCompletion (seq, estimate1thSeq, charge, receiptURL) VALUES (seqCompletion.nextVal, 1, 2100000,'receipt0001.jpg');
INSERT INTO tblCompletion (seq, estimate1thSeq, charge, receiptURL) VALUES (seqCompletion.nextVal, 2, 1200000,'receipt0002.jpg');
INSERT INTO tblCompletion (seq, estimate1thSeq, charge, receiptURL) VALUES (seqCompletion.nextVal, 3, 4900000,'receipt0003.jpg');

INSERT INTO tblCompletion (seq, estimate1thSeq, charge, receiptURL) VALUES (seqCompletion.nextVal, 5, 250000,'receipt0005.jpg');
INSERT INTO tblCompletion (seq, estimate1thSeq, charge, receiptURL) VALUES (seqCompletion.nextVal, 6, 280000,'receipt0006.jpg');
INSERT INTO tblCompletion (seq, estimate1thSeq, charge, receiptURL) VALUES (seqCompletion.nextVal, 7, 200000,'receipt0007.jpg');

/* 일정 등록 */
/*
견적서 번호 1, 2, 3 / 5, 6, 7 에 대한 일정 등록 데이터
일정은 모두 완료 상태임(현재보다 과거의 일들)
*/
INSERT INTO tblPlan (seq, serviceDate, estimateURL, progressSeq, estimate1thSeq) VALUES (seqPlan.nextVal, to_date('2021-01-05','yyyy-mm-dd'), 'estimateConstruction0001.jpg', 3, 1);
INSERT INTO tblPlan (seq, serviceDate, estimateURL, progressSeq, estimate1thSeq) VALUES (seqPlan.nextVal, to_date('2021-01-04','yyyy-mm-dd'), 'estimateConstruction0002.jpg', 3, 2);
INSERT INTO tblPlan (seq, serviceDate, estimateURL, progressSeq, estimate1thSeq) VALUES (seqPlan.nextVal, to_date('2021-01-05','yyyy-mm-dd'), 'estimateConstruction0003.jpg', 3, 3);

INSERT INTO tblPlan (seq, serviceDate, estimateURL, progressSeq, estimate1thSeq) VALUES (seqPlan.nextVal, to_date('2021-01-11','yyyy-mm-dd'), 'estimateConstruction0001.jpg', 3, 5);
INSERT INTO tblPlan (seq, serviceDate, estimateURL, progressSeq, estimate1thSeq) VALUES (seqPlan.nextVal, to_date('2021-01-13','yyyy-mm-dd'), 'estimateConstruction0002.jpg', 3, 6);
INSERT INTO tblPlan (seq, serviceDate, estimateURL, progressSeq, estimate1thSeq) VALUES (seqPlan.nextVal, to_date('2021-01-13','yyyy-mm-dd'), 'estimateConstruction0003.jpg', 3, 7);

/* 서비스후기 */
/*
reviewConstruction0001: 욕실공사 사진
reviewConstruction0002: 도배시공 사진
reviewConstruction0003: 발코니확장공사 사진

reviewClean0001: 가정이사청소 사진
reviewClean0002: 사무실이전청소 사진
reviewClean0002: 욕실청소 사진
*/
/*
요청서를 채택한 고객인 1,2,3,16,17,18 고객 후기
*/
INSERT INTO tblServiceReview (seq, completionSeq, regDate, reviewContent, contentURL, delFlag, memberSeq) VALUES (seqServiceReview.nextVal, 1, to_date('2021-01-07','yyyy-mm-dd'), '전문가님 덕분에 저희 욕실이 이렇게 안락하게 바뀌었어요. 주변 분들 욕실 인테리어로 고민하시는 분 계시면 꼭 소개드리고 싶은 그런 곳이에요. 감사합니다^^ 기분좋게 욕실 쓰네요.', 'reviewConstruction0001.jpg', 0, 1);
INSERT INTO tblServiceReview (seq, completionSeq, regDate, reviewContent, contentURL, delFlag, memberSeq) VALUES (seqServiceReview.nextVal, 2, to_date('2021-01-06','yyyy-mm-dd'), '주변에 도배 제대로 안 되어서 다시 도배하시려는 분 있음 이 곳에서 해보라고 하고 싶어요. 저희는 나름 저렴하면서도 실속있게 도배했어요. 날이 좋지 않아서 벽지가 제대로 예쁘게 마를지 고민이었는데, 실력이 좋으셔서 깔끔하게 잘 되었네요ㅎㅎ', 'reviewConstruction0002.jpg', 0, 2);
INSERT INTO tblServiceReview (seq, completionSeq, regDate, reviewContent, contentURL, delFlag, memberSeq) VALUES (seqServiceReview.nextVal, 3, to_date('2021-01-09','yyyy-mm-dd'), '발코니 확장 공사 후기입니다. 나름 추천받고 선택한 곳인데... 기대만큼 아주 만족스럽진 않습니다. 비용이 꽤 되어서 그런지, 아직 문제나 이상은 없지만.. 조금 서비스가 아쉬운 측면이 있네요.', 'reviewConstruction0003.jpg', 0, 3);

INSERT INTO tblServiceReview (seq, completionSeq, regDate, reviewContent, contentURL, delFlag, memberSeq) VALUES (seqServiceReview.nextVal, 4, to_date('2021-01-15','yyyy-mm-dd'), '이사청소 업체를 어디를 선택해야 하나 고민이 많았었는데... 이곳 선택하길 잘했네요. 전문가 분들께서 정말 깔끔하게 청소해주셨습니다. 새집에서 사는 기분 제대로 듭니다^^', 'reviewClean0001.jpg', 0, 16);
INSERT INTO tblServiceReview (seq, completionSeq, regDate, reviewContent, contentURL, delFlag, memberSeq) VALUES (seqServiceReview.nextVal, 5, to_date('2021-01-17','yyyy-mm-dd'), '새로 사무실을 이전해서 청소업체를 불렀어야 했는데, 깔끔하게 새 사무실 느낌 나게 잘해주셨습니다. 종종 다시 뵙겠습니다', 'reviewClean0002.jpg', 0, 17);
INSERT INTO tblServiceReview (seq, completionSeq, regDate, reviewContent, contentURL, delFlag, memberSeq) VALUES (seqServiceReview.nextVal, 6, to_date('2021-01-16','yyyy-mm-dd'), '다른 건 다 괜찮은데 비용이 좀 아쉽네요.. 전체 공간 청소비용이랑 별 차이가 안나는 것 같아요.. 욕실 한 곳 청소 서비스인데 말이에요.', 'reviewClean0003.jpg', 0, 18);