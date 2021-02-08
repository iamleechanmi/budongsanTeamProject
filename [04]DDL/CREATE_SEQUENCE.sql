-- 매물
CREATE SEQUENCE seqHouseBasic;
CREATE SEQUENCE seqHouseBuildingType;
CREATE SEQUENCE seqHouseDealType;
CREATE SEQUENCE seqHouseInfo;
CREATE SEQUENCE seqHousePrice;
CREATE SEQUENCE seqHouseImg;
CREATE SEQUENCE seqHousePost;
CREATE SEQUENCE seqHouseDealState;

-- 방
CREATE SEQUENCE seqRoomBasic;
CREATE SEQUENCE seqRoomDealType;
CREATE SEQUENCE seqRoomBuildingType;
CREATE SEQUENCE seqRoomInfo;
CREATE SEQUENCE seqRoomPrice;
CREATE SEQUENCE seqRoomImg;
CREATE SEQUENCE seqRoomPost;

-- 업체
CREATE SEQUENCE seqCategory;
CREATE SEQUENCE seqFirm;
CREATE SEQUENCE seqUsageLog;
CREATE SEQUENCE seqApprovalF;
CREATE SEQUENCE seqPaymentLog;
CREATE SEQUENCE seqEstimate1th;
CREATE SEQUENCE seqService;
CREATE SEQUENCE seqRequest;
CREATE SEQUENCE seqChatAsk;
CREATE SEQUENCE seqEstimate;
CREATE SEQUENCE seqConsultation;
CREATE SEQUENCE seqProgress;
CREATE SEQUENCE seqPlan;
CREATE SEQUENCE seqCompletion;
CREATE SEQUENCE seqServiceReview;

create sequence seqBrokerReview;
create sequence seqChatList;
create sequence seqChat;
create sequence seqMember;
create sequence seqRecoHouse;
create sequence seqHopeWrite;
create sequence seqHopePrice;
create sequence seqHopeType;
create sequence seqVRInterior;
create sequence seqVRInteriorGagu;
create sequence seqFalseReport;

CREATE SEQUENCE seqAdmin;
CREATE SEQUENCE seqNews;
CREATE SEQUENCE seqNotice;
CREATE SEQUENCE seqReviewDelete;
CREATE SEQUENCE seqInquiry;
CREATE SEQUENCE seqInquiryComment;
CREATE SEQUENCE seqInquiryMember;
CREATE SEQUENCE seqInquiryBroker;
CREATE SEQUENCE seqFree;
CREATE SEQUENCE seqFreeMember;
CREATE SEQUENCE seqFreeBroker;
CREATE SEQUENCE seqFreeComment;
CREATE SEQUENCE seqCommentMember;
CREATE SEQUENCE seqCommentBroker;
CREATE SEQUENCE seqPrivacyPolicy ;
CREATE SEQUENCE seqTermsOfService;
CREATE SEQUENCE seqSiteInfo;


-- 시퀀스 생성
create sequence seqBroker;                  --중개사
create sequence seqApproBroker;             --승인중개사
create sequence seqAdPermit;                --광고 권한
create sequence seqAdPay;                   --광고 결제
create sequence seqAdInfo;                  --광고 정보
create sequence seqPostAd;                  --광고시작




