-- 업체, 회원 dml drop

-- 업체
drop view vwApprovalF;
drop function fnApprovalFMaxPage;
drop procedure procListApprovalF;
drop trigger trgUsePoint;
drop procedure procAddEstimate1th;
drop procedure procAddPaymentLog;
drop function fnPaymentMaxPage;
drop procedure procListPaymentLog;
drop function fnUsageMaxPage;
drop procedure procListUsageLog;
drop procedure procFindEstimate1th;
drop procedure procAddRequest;
drop view vwRequest;
drop view vwEstimate1th;
drop procedure procMemberChatAsk;
drop procedure procFirmChatAsk;
drop procedure procAddPlan;
drop procedure procAddCompletion;
drop procedure procAddServiceReview;
drop procedure procAddEstimate;

-- 회원
drop function fnFreeMaxPage;
drop procedure procListFree;
drop procedure procAddFreeMember;
drop procedure procCommentMember;
drop function fnInquiryMaxPage;
drop procedure procListInquiry;
drop procedure procAddInquiryMember;
drop view vwRoomPost;
drop function fnRoomMaxPage;
drop procedure procListRoomPost;
drop procedure procAddRoomPost;
drop procedure procReplaceRoomPost;
drop view vwHousePost;
drop function fnHouseMaxPage;
drop procedure procListHousePost;
drop procedure procAddHousePost;
drop procedure procReplaceHousePost;
drop procedure procAddFalseReport;
drop function fnChatMemberMaxPage;
drop view vwChatMember;
drop procedure procListChatMember;
drop procedure procAddChatMember;
drop view vwBrokerReview;
drop procedure procAddBrokerReview;
drop function fnHopeMaxPage;
drop procedure procListHopeWrite;
drop procedure procAddHopeWrite;