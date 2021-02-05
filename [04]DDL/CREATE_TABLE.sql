/* 관리자 */
CREATE TABLE tblAdmin (
	seq NUMBER PRIMARY KEY, /* 번호 */
	id VARCHAR2(100) NOT NULL, /* 아이디 */
	pw VARCHAR2(100) NOT NULL, /* 비밀번호 */
	name VARCHAR2(100) NOT NULL /* 이름 */
);

--중개사
create table tblBroker (
	seq number primary key,                                          -- 중개사 번호(PK)
	email varchar2(100) not null,                                     -- 이메일(=ID) 
	pw varchar2(50) not null,                                        -- 비밀번호
	name varchar2(10) not null,                                      -- 사업자대표명  
	businessName varchar2(100) not null,                             -- 사업자상호
	brokerNum varchar2(50) not null,                                 -- 중개등록번호 
	address varchar2(100) not null,                                  -- 주소지 
	tel varchar2(20) not null,                                       -- 전화번호 
	businessNum varchar2(50) not null,                               -- 사업자등록번호
	documentURL varchar2(2000) not null,                              -- 서류경로
	delFlag number not null check(delFlag in(0, 1))               -- 탈퇴여부
);

/* 회원 */
CREATE TABLE tblMember (
	seq NUMBER PRIMARY KEY, /* 번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	pw VARCHAR2(50) NOT NULL, /* 비밀번호 */
	name VARCHAR2(20) NOT NULL, /* 이름 */
	ssn VARCHAR2(20) NOT NULL, /* 주민등록번호 */
	phone VARCHAR2(20) NOT NULL, /* 핸드폰번호 */
	address VARCHAR2(200) NOT NULL /* 주소 */
	delFlag NUMBER NOT NULL check (delFlag in(0, 1)) /* 탈퇴여부 */
);

/* 개인정보처리방침 */
CREATE TABLE tblPrivacyPolicy (
	seq NUMBER PRIMARY KEY, /* 번호 */
	detail VARCHAR2(2000) NOT NULL, /* 개인정보처리방침 */
	signUpType VARCHAR2(100) NOT NULL CHECK (signUpType in ('일반회원', '부동산중개사', '서비스업체')) /* 회원가입유형 */
);

/* 서비스약관 */
CREATE TABLE tblTermsOfService (
	seq NUMBER PRIMARY KEY, /* 번호 */
	detail VARCHAR2(2000) NOT NULL, /* 서비스약관 */
	signUpType VARCHAR2(100) NOT NULL CHECK (signUpType in ('일반회원', '부동산중개사', '서비스업체')) /* 회원가입유형 */
);

/* 사이트정보 */
CREATE TABLE tblSiteInfo (
	seq NUMBER PRIMARY KEY, /* 번호 */
	tel VARCHAR2(100) NOT NULL, /* 회사전화번호 */
	email VARCHAR2(200) NOT NULL, /* 회사이메일 */
	address VARCHAR2(200) NOT NULL, /* 회사주소 */
	representative VARCHAR2(100) NOT NULL, /* 대표자명 */
	policyManager VARCHAR2(100) NOT NULL /* 개인정보관리자명 */
); 

/* 자유게시판 */
CREATE TABLE tblFree (
	seq NUMBER PRIMARY KEY, /* 번호 */
	subject VARCHAR2(100) NOT NULL, /* 제목 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

/* 문의게시판 */
CREATE TABLE tblInquiry (
	seq NUMBER PRIMARY KEY, /* 번호 */
	subject VARCHAR2(100) NOT NULL, /* 제목 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일 */
	openFlag NUMBER NOT NULL CHECK (openFlag in (0, 1)), /* 공개여부 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

--광고 정보
create table tblAdInfo (
	seq number primary key,          -- 광고정보 번호(PK) 
	amount number not null,          -- 개수 
	endDate date not null,           -- 기간 
	price varchar2(100) not null     -- 금액 
);

/* 매물기초정보 */
CREATE TABLE tblHouseBasic (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	address VARCHAR2(200) NOT NULL, /* 주소 */
	exclusiveArea NUMBER NOT NULL, /* 전용면적 */
	supplyArea NUMBER NOT NULL, /* 공급면적 */
	selectedFloor NUMBER NOT NULL, /* 해당층 */
	totalFloor NUMBER NOT NULL, /* 총층수 */
	roomNum NUMBER NOT NULL, /* 방개수 */
	bathroomNum NUMBER NOT NULL, /* 욕실개수 */
	direction VARCHAR2(9) NOT NULL, /* 방향 */
	completionYeaer DATE NOT NULL, /* 준공년도 */
	parkingFlag NUMBER NOT NULL CHECK (parkingFlag in (0, 1)), /* 주차가능여부 */
	elevator NUMBER NOT NULL CHECK (elevator in (0, 1)), /* 엘리베이터 */
	pet NUMBER NOT NULL CHECK (pet in (0, 1)) /* 반려동물 */
);

/* 매물건물유형 */
CREATE TABLE tblHouseBuildingType (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	type VARCHAR2(20) NOT NULL CHECK (type in ('아파트', '빌라', '주택', '원룸', '투룸', '오피스텔', '사무실')) /* 유형 */
);

/* 매물거래유형 */
CREATE TABLE tblHouseDealType (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	type VARCHAR2(6) NOT NULL CHECK (type in ('매매', '전세', '월세')) /* 유형 */
);

/* 매물가격 */
CREATE TABLE tblHousePrice (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	price NUMBER NOT NULL, /* 가격(보증금/전세금/매매가) */
	rent NUMBER DEFAULT 0 NOT NULL, /* 월세 */
	monthlyFee NUMBER NOT NULL /* 월관리비 */
);

/* 방기초정보 */
CREATE TABLE tblRoomBasic (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	address VARCHAR2(100) NOT NULL, /* 주소 */
	exclusiveArea NUMBER NOT NULL, /* 전용면적 */
	supplyArea NUMBER NOT NULL, /* 공급면적 */
	selectedFloor NUMBER NOT NULL, /* 해당층 */
	totalFloor NUMBER NOT NULL, /* 총층수 */
	roomNum NUMBER NOT NULL, /* 방개수 */
	bathroomNum NUMBER NOT NULL, /* 욕실개수 */
	direction VARCHAR2(9) NOT NULL, /* 방향 */
	completionYeaer DATE NOT NULL, /* 준공년도 */
    parkingFlag NUMBER NOT NULL CHECK (parkingFlag in (0, 1)), /* 주차가능여부 */
	elevator NUMBER NOT NULL CHECK (elevator in (0, 1)), /* 엘리베이터 */
	pet NUMBER NOT NULL CHECK (pet in (0, 1)) /* 반려동물 */
);

/* 방거래유형 */
CREATE TABLE tblRoomDealType (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	type VARCHAR2(6) NOT NULL CHECK (type in ('매매', '전세', '월세')) /* 유형 */
);

/* 방건물유형 */
CREATE TABLE tblRoomBuildingType (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	type VARCHAR2(20) NOT NULL CHECK (type in ('아파트', '빌라', '주택', '원룸', '투룸', '오피스텔', '사무실')) /* 유형 */
);

/* 방가격 */
CREATE TABLE tblRoomPrice (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	price NUMBER NOT NULL, /* 가격(보증금/전세금/매매가) */
	rent NUMBER DEFAULT 0 NOT NULL, /* 월세 */
	monthlyFee NUMBER NOT NULL /* 월관리비 */
);


/* 희망거래유형 */
CREATE TABLE tblHopeType (
	seq NUMBER PRIMARY KEY, /* 번호 */
	dealType VARCHAR2(100) NOT NULL CHECK (dealType in ('매매', '전세', '월세')) /* 거래유형 */
);

/* 가상인테리어가구 */
CREATE TABLE tblVRInteriorGagu (
	seq NUMBER PRIMARY KEY, /* 번호 */
	width NUMBER NOT NULL, /* 가로길이 */
	vertical NUMBER NOT NULL, /* 세로길이 */
	height NUMBER NOT NULL, /* 높이 */
	productName VARCHAR2(200) NOT NULL, /* 제품명 */
	brandName VARCHAR2(50) NOT NULL, /* 제조사명 */
	imgURL VARCHAR2(2000) NOT NULL /* 이미지경로 */
);

--승인중개사
create table tblApproBroker (
	seq number primary key,                              -- 승인 중개사(PK)
	regDate date default sysdate not null,               -- 승인일자          -- ******regDate로 변경
	brokerSeq number not null references tblBroker(seq)  -- 중개사번호(FK)
);

/* 뉴스 */
CREATE TABLE tblNews (
	seq NUMBER PRIMARY KEY, /* 번호 */
	subject VARCHAR2(100) NOT NULL, /* 제목 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	imageURL VARCHAR2(2000) NOT NULL, /* 이미지경로 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일자 */
    adminSeq NUMBER NOT NULL REFERENCES tblAdmin(seq), /* 관리자번호 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

/* 공지사항 */
CREATE TABLE tblNotice (
	seq NUMBER PRIMARY KEY, /* 번호 */
	subject VARCHAR2(100) NOT NULL, /* 제목 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	imageURL VARCHAR2(2000) NOT NULL, /* 이미지경로 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일자 */
    adminSeq NUMBER NOT NULL REFERENCES tblAdmin(seq), /* 관리자번호 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

/* 자유게시판 댓글 */
CREATE TABLE tblFreeComment (
	seq NUMBER PRIMARY KEY, /* 번호 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일 */
	freeSeq NUMBER NOT NULL REFERENCES tblFree(seq), /* 자유글번호 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

/* 문의게시판 댓글 */
CREATE TABLE tblInquiryComment (
	seq NUMBER PRIMARY KEY, /* 번호 */
	detail VARCHAR2(2000) NOT NULL, /* 댓글내용 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 날짜 */
	adminSeq NUMBER NOT NULL REFERENCES tblAdmin(seq), /* 관리자번호 */
	inquirySeq NUMBER NOT NULL REFERENCES tblInquiry(seq), /* 문의글번호 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

--광고권한
create table tblAdPermit (
	seq number primary key,                                         -- 광고권한 번호(PK)
	permition number not null check(permition in(0, 1)),            -- 광고권한 
	approBrokerSeq number not null references tblApproBroker(seq)   -- 승인중개사번호(FK)
);

--광고 결제
create table tblAdPay (
	seq number primary key,                                        -- 광고결제 번호(PK)
	regDate date not null,                                         -- 결제일
	method varchar2(100) not null,                                 -- 결제수단 
	adInfoSeq number not null references tblAdInfo(seq),           -- 광고정보 번호
	approBrokerSeq number not null references tblApproBroker(seq)  -- 중개사번호(FK)
);

/* 매물정보 */
CREATE TABLE tblHouseInfo (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	houseBasicSeq NUMBER NOT NULL REFERENCES tblHouseBasic(seq), /* 기초정보번호 */
	houseBuildingTypeSeq NUMBER NOT NULL REFERENCES tblHouseBuildingType(seq), /* 건물종류번호 */
	houseDealTypeSeq NUMBER NOT NULL REFERENCES tblHouseDealType(seq) /* 거래유형번호 */
);

/* 방정보 */
CREATE TABLE tblRoomInfo (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	roomBasicSeq NUMBER NOT NULL REFERENCES tblRoomBasic(seq), /* 기초정보번호 */
	roomBuildingTypeSeq NUMBER NOT NULL REFERENCES tblRoomBuildingType(seq), /* 건물유형번호 */
	roomDealTypeSeq NUMBER NOT NULL REFERENCES tblRoomDealType(seq) /* 거래유형번호 */
);

/* 희망입주가격정보 */
CREATE TABLE tblHopePrice (
	seq NUMBER PRIMARY KEY, /* 번호 */
	price NUMBER NOT NULL, /* 가격(보증금/전세금/매매가) */
	rent NUMBER, /* 월세 */
	hopeTypeSeq NUMBER NOT NULL references tblHopeType(seq) /* 희망거래유형번호 */
);

--1:1 문의 내역
create table tblChatList (  
	seq number primary key,                                         --1:1문의내역 변호(PK)
	regDate date default sysdate not null,                          -- 문의일
	state number not null check(state in(0, 1)),                                          -- 문의상태
	memeberSeq number not null references tblMember(seq),           -- 회원번호
	approBrokerSeq number not null references tblApproBroker(seq)   -- 승인중개사번호(FK)
);

/* 후기/평점 */
CREATE TABLE tblBrokerReview (
	seq NUMBER NOT NULL primary key, /* 번호 */
	regDate DATE default sysdate NOT NULL, /* 날짜 */
	content VARCHAR2(2000) NOT NULL, /* 후기 내용 */
	star NUMBER NOT NULL, /* 평점 */
	imgURL VARCHAR2(2000) NOT NULL, /* 계약서이미지경로 */
	memberSeq NUMBER NOT NULL references tblMember(seq), /* 회원번호 */
	approBrokerSeq NUMBER NOT NULL references tblApproBroker(seq), /* 승인중개사번호 */
	delFlag NUMBER NOT NULL check (delFlag in(0, 1)) /* 삭제여부 */
);

/* 작성한자유_회원 */
CREATE TABLE tblFreeMember (
	seq NUMBER PRIMARY KEY, /* 번호 */
	freeSeq NUMBER NOT NULL REFERENCES tblFree(seq), /* 자유게시판번호 */
	memberSeq NUMBER NOT NULL REFERENCES tblMember(seq) /* 회원번호 */
);

/* 작성한자유_중개사 */
CREATE TABLE tblFreeBroker (
	seq NUMBER PRIMARY KEY, /* 번호 */
	freeSeq NUMBER NOT NULL REFERENCES tblFree(seq), /* 자유게시판번호 */
	approBrokerSeq NUMBER NOT NULL REFERENCES tblApproBroker(seq) /* 승인중개사번호 */
);

/* 작성한문의_회원 */
CREATE TABLE tblInquiryMember (
	seq NUMBER PRIMARY KEY, /* 번호 */
	inquirySeq NUMBER NOT NULL REFERENCES tblInquiry(seq), /* 문의게시판번호 */
	memberSeq NUMBER NOT NULL REFERENCES tblMember(seq) /* 회원번호 */
);

/* 작성한문의_중개사 */
CREATE TABLE tblInquryBroker (
	seq NUMBER PRIMARY KEY, /* 번호 */
	InquirySeq NUMBER NOT NULL REFERENCES tblInquiry(seq), /* 문의게시판번호 */
	approBrokerSeq NUMBER NOT NULL REFERENCES tblApproBroker(seq) /* 승인중개사번호 */
);

/* 작성한댓글_회원 */
CREATE TABLE tblCommentMember (
	seq NUMBER PRIMARY KEY, /* 번호 */
	freeCommentSeq NUMBER NOT NULL REFERENCES tblFreeComment(seq), /* 댓글번호 */
	memberSeq NUMBER NOT NULL REFERENCES tblMember(seq) /* 회원번호 */
);

/* 작성한댓글_중개사 */
CREATE TABLE tblCommentBroker (
	seq NUMBER PRIMARY KEY, /* 번호 */
	freeCommentSeq NUMBER NOT NULL REFERENCES tblFreeComment(seq), /* 댓글번호 */
	approBrokerSeq NUMBER NOT NULL REFERENCES tblApproBroker(seq) /* 승인중개사번호 */
);

/* 후기삭제요청 */
CREATE TABLE tblReviewDelete (
	seq NUMBER PRIMARY KEY, /* 번호 */
	detail VARCHAR2(2000) NOT NULL, /* 삭제사유 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 요청일자 */
	reviewSeq NUMBER NOT NULL REFERENCES tblBrokerReview(seq), /* 후기번호 */
	approBrokerSeq NUMBER NOT NULL REFERENCES tblapproBroker(seq), /* 승인중개사번호 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

--1:1 문의
create table tblChat (
	seq number primary key,                                     -- 1:1문의 번호(PK) 
	subject varchar2(200) not null,                             -- 제목 
	content varchar2(2000) not null,                            -- 내용 
	regDate date not null,                                      -- 문의시각 
	chatListSeq number not null references tblChatList(seq)     -- 문의번호(FK)
);

/* 희망입주글 */
CREATE TABLE tblHopeWrite (
	seq NUMBER PRIMARY KEY, /* 번호 */
	zone VARCHAR2(20) NOT NULL, /* 지역 */
	area VARCHAR2(20) NOT NULL, /* 면적 */
	roomAmount VARCHAR2(20) NOT NULL, /* 방개수 */
	content VARCHAR2(2000) NOT NULL, /* 내용 */
	memberSeq NUMBER NOT NULL references tblMember(seq), /* 회원번호 */
	hopePriceSeq NUMBER NOT NULL references tblHopePrice(seq), /* 희망입주가격번호 */
	delFlag NUMBER NOT NULL check (delFlag in(0, 1)) /* 삭제여부 */
);

/* 매물게시글 */
CREATE TABLE tblHousePost (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	approBrokerSeq NUMBER NOT NULL REFERENCES tblApproBroker(seq), /* 승인중개사번호 */
	houseInfoSeq NUMBER NOT NULL REFERENCES tblHouseInfo(seq), /* 매물정보번호 */
	housePriceSeq NUMBER NOT NULL REFERENCES tblHousePrice(seq), /* 매물가격번호 */
	houseImgSeq NUMBER NOT NULL REFERENCES tblHouseImg(seq), /* 이미지번호 */
	subject VARCHAR2(200) NOT NULL, /* 제목 */
	content VARCHAR2(2000) NOT NULL, /* 설명 */
	regDate DATE DEFAULT SYSDATE NOT NULL, /* 등록일 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1)) /* 삭제여부 */
);

/* 방게시글 */
CREATE TABLE tblRoomPost (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	memberSeq NUMBER NOT NULL REFERENCES tblMember(seq), /* 회원번호 */
	roomInfoSeq NUMBER NOT NULL REFERENCES tblRoomInfo(seq), /* 방정보번호 */
	roomPriceSeq NUMBER NOT NULL REFERENCES tblRoomPrice(seq), /* 방가격번호 */
	roomImgSeq NUMBER NOT NULL REFERENCES tblRoomImg(seq), /* 이미지번호 */
	subject VARCHAR2(200) NOT NULL, /* 제목 */
	detail VARCHAR2(2000) NOT NULL, /* 설명 */
	regDate DATE DEFAULT SYSDATE NOT NULL, /* 등록일 */
	delFlag NUMBER NOT NULL CHECK (delFlag in (0, 1))/* 삭제여부 */
);

/* 매물이미지 */
CREATE TABLE tblHouseImg (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	url VARCHAR2(2000) NOT NULL /* 이미지주소 */
	housePostSeq NUMBER NOT NULL REFERENCES tblHousePost(seq)/* 매물게시글번호 */
);

/* 방이미지 */
CREATE TABLE tblRoomImg (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	url VARCHAR2(2000) NOT NULL /* 이미지주소 */
    roomPostSeq NUMBER NOT NULL REFERENCES tblRoomPost(seq) /* 방게시글번호 */
);

--매물추천
create table tblRecoHouse (
	seq number primary key,                                         -- 매물추천 번호(PK)
	hopeWriteSeq number not null references tblHopeWrite(seq),      -- 글번호(FK)
	approBrokerSeq number not null references tblApproBroker(seq)   -- 승인중개사번호(FK)
);

--광고 시작
create table tblPostAd (
	seq number primary key,                                         -- 광고시작 번호(PK)
	adPaySeq number not null references tblAdPay(seq),              -- 광고결제 번호(FK)
	housePostSeq number not null references tblHousePost(seq)       -- 매물게시글번호(FK)
);

/* 매물거래상태 */
CREATE TABLE tblHouseDealState (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	housePostSeq NUMBER NOT NULL REFERENCES tblHousePost(seq), /* 메물게시글번호 */
	state NUMBER NOT NULL CHECK (state in (0, 1)) /* 거래상태 */
);

/* 가상인테리어 */
CREATE TABLE tblVRInterior (
	seq NUMBER PRIMARY KEY, /* 번호 */
	hopeWriteSeq NUMBER NOT NULL references tblHopeWrite(seq), /* 글번호 */
	imgURL VARCHAR2(2000) NOT NULL /* 이미지주소 */
);

/* 허위매물신고 */
CREATE TABLE tblFalseReport (
	SEQ NUMBER PRIMARY KEY, /* 번호 */
	housePostSeq NUMBER NOT NULL references tblHousePost(seq), /* 매물게시글번호 */
	memberSeq NUMBER NOT NULL references tblMember(seq), /* 회원번호 */
	reportReason VARCHAR2(2000) NOT NULL, /* 신고사유 */
	regDate DATE default sysdate NOT NULL, /* 등록일 */
	delFlag NUMBER NOT NULL check (delFlag in(0, 1)) /* 삭제여부 */
);

--업체
/*
1단계
*/

/* 서비스 품목 */
CREATE TABLE tblService (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	sType VARCHAR2(20) NOT NULL /* 서비스 품목(청소/시공) */
);

/* 업체 카테고리 */
CREATE TABLE tblCategory (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	categoryNum VARCHAR2(20) NOT NULL /* 카테고리 번호(청소/시공) */
);

/* 일정진행상태 */
CREATE TABLE tblProgress (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	pState VARCHAR2(20) NOT NULL /* 일정진행상태(예정/진행/완료) */
);

/* 견적상담형태 */
CREATE TABLE tblConsultation (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	cType VARCHAR2(20) NOT NULL /* 견적상담형태(방문/전화/진행무산) */
);


/*
2단계
*/

/* 고객 요청서 */
CREATE TABLE tblRequest (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	regDate DATE DEFAULT SYSDATE, /* 작성일 */
	address VARCHAR2(200) NOT NULL, /* 주소지 */
	shape VARCHAR2(200) NOT NULL, /* 가옥구조 */
	desiredDay DATE NOT NULL, /* 서비스시작일 */
	detail VARCHAR2(2000) NOT NULL, /* 상세전달사항 */
	area NUMBER NOT NULL, /* 면적 */
	serviceSeq NUMBER NOT NULL REFERENCES tblService(seq), /* 서비스 품목 번호(FK) */
	memberSeq NUMBER NOT NULL /* 회원번호 */
);

/* 업체 */
CREATE TABLE tblFirm (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	id VARCHAR2(100) NOT NULL, /* 아이디 */
	pw VARCHAR2(100) NOT NULL, /* 비밀번호 */
	email VARCHAR2(200) NOT NULL, /* 이메일 */
	address VARCHAR2(200) NOT NULL, /* 업체 주소 */
	tel VARCHAR2(20) NOT NULL, /* 업체 연락처 */
	introduction VARCHAR2(2000) NOT NULL, /* 업체 소개글 */
	portfolio VARCHAR2(2000) NOT NULL, /* 업체 포트폴리오(JPG) */
	availablePoint NUMBER NOT NULL, /* 보유 포인트 */
	approval NUMBER NOT NULL check (approval in(0, 1)), /* 승인 여부(미승인/승인) */
	delFlag NUMBER NOT NULL check (delFlag in(0, 1)), /* 탈퇴 여부 */
	categorySeq NUMBER NOT NULL REFERENCES tblCategory(seq)/* 업체카테고리번호(FK) */
);


/*
3단계
*/

/* 승인업체목록 */
CREATE TABLE tblApprovalF (
	seq NUMBER NOT NULL PRIMARY KEY, /* 업체승인번호 */
	firmSeq NUMBER NOT NULL REFERENCES tblFirm(seq), /* 업체 번호(FK) */
	approvalDate DATE DEFAULT SYSDATE /* 승인 일자 */
);

/*
4단계
*/

/* 포인트 사용기록 */
CREATE TABLE tblUsageLog (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	usageDate DATE DEFAULT SYSDATE, /* 사용 일자 */
	useAmount NUMBER NOT NULL, /* 사용액 */
	approvalFSeq NUMBER NOT NULL REFERENCES tblApprovalF(seq)/* 업체승인번호(FK) */
);

/* 포인트 결제기록 */
CREATE TABLE tblPaymentLog (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	paymentDate DATE DEFAULT SYSDATE, /* 결제 일자 */
	payment NUMBER NOT NULL, /* 결제액 */
	approvalFSeq NUMBER NOT NULL REFERENCES tblApprovalF(seq) /* 업체승인번호 */
);

/* 업체 견적서 */
CREATE TABLE tblEstimate1th (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	regDate DATE DEFAULT SYSDATE, /* 작성일 */
	approvalFSeq NUMBER NOT NULL REFERENCES tblApprovalF(seq), /* 업체승인번호(FK) */
	requestSeq NUMBER NOT NULL REFERENCES tblRequest(seq), /* 고객요청서번호(FK) */
	estimatedCost NUMBER NOT NULL, /* 예상 비용 */
	eContent VARCHAR2(2000) NOT NULL, /* 견적서내용 */
	adoptFlag NUMBER NOT NULL check (adoptFlag in(0, 1)) /* 채택여부 */
);

/*
5단계
*/

/* 1:1 온라인 상담 */
CREATE TABLE tblChatAsk (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	timeSent DATE DEFAULT SYSDATE, /* 내용발송시간 */
	estimate1thSeq NUMBER NOT NULL REFERENCES tblEstimate1th(seq), /* 견적서 번호(FK) */
	chatContent VARCHAR2(2000) NOT NULL /* 글 내용 */
);

/*
6단계
*/
/* 견적상담 */
CREATE TABLE tblEstimate (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	estimate1thSeq NUMBER NOT NULL REFERENCES tblEstimate1th(seq), /* 견적서 번호(FK) */
	consultationSeq NUMBER NOT NULL REFERENCES tblConsultation(seq), /* 견적상담형태번호 */
	estimateDay DATE NOT NULL /* 견적상담 일자 */
);

/* 일정 등록 */
CREATE TABLE tblPlan (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	serviceDate DATE NOT NULL, /* 서비스 제공일 */
	estimateURL VARCHAR2(2000) NOT NULL, /* 견적서사본(JPG) */
	progressSeq NUMBER NOT NULL REFERENCES tblProgress(seq), /* 일정진행상태번호(FK) */
	estimate1thSeq NUMBER NOT NULL REFERENCES tblEstimate1th(seq) /* 견적서 번호(FK) */
);

/* 서비스 완료 */
CREATE TABLE tblCompletion (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	estimate1thSeq NUMBER NOT NULL REFERENCES tblEstimate1th(seq), /* 견적서 번호(FK) */
	charge NUMBER NOT NULL, /* 금액 */
	receiptURL VARCHAR2(2000) NOT NULL /* 영수증 사본(JPG) */
);


/* 서비스후기 */
CREATE TABLE tblServiceReview (
	seq NUMBER NOT NULL PRIMARY KEY, /* 번호 */
	completionSeq NUMBER NOT NULL REFERENCES tblCompletion(seq), /* 서비스완료번호 */
	regDate DATE DEFAULT SYSDATE, /* 작성 일자 */
	reviewContent VARCHAR2(2000) NOT NULL, /* 후기 내용 */
	contentURL VARCHAR2(2000) NOT NULL, /* 후기 사진(JPG) */
	delFlag NUMBER NOT NULL check (delFlag in(0, 1)), /* 삭제 여부 */
	memberSeq NUMBER NOT NULL REFERENCES tblMember(seq) /* 회원번호 */
);












