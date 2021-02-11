-- 작성자 : 이찬미
-- [업체] 포인트 DML
-------------------------------------------------------------------------------
-- 업체 견적서 등록 시 포인트 차감 트리거(하루 3번 무료, 이후 등록 시 500포인트 차감)
-------------------------------------------------------------------------------
create or replace trigger trgUsePoint
    before
    insert on tblEstimate1th
    for each row
declare
    vfirmSeq number;
    vcnt number := 0; -- 오늘 몇번 등록했는지 셀 카운트 변수
begin
    select firmSeq into vfirmSeq from tblApprovalF where seq = :new.approvalFSeq;
    
    -- 업체 견적서 테이블에서 오늘 몇번 등록했는지 세서 vcnt에 저장
    select nvl(max(count(approvalFSeq)), 0) into vcnt from tblEstimate1th 
        where approvalFSeq = :new.approvalFSeq and to_char(regDate, 'yyyymmdd') = to_char(sysdate, 'yyyymmdd') 
            group by approvalFSeq;
        
    -- 3번 이상일 경우 포인트 차감
    if vcnt >= 3 then
        -- 포인트 사용 기록 테이블에 추가
        insert into tblUsageLog values (seqUsageLog.nextVal, default, 500, :new.approvalFSeq);
    
        -- 업체 테이블의 보유 포인트 수정
        update tblFirm set availablePoint = availablePoint - 500 where seq = vfirmSeq;
    end if;
end;
-------------------------------------------------------------------------------
-- 포인트 충전
-------------------------------------------------------------------------------
create or replace procedure procAddPaymentLog(
    paseq number, -- 승인 업체 번호
    ppayment number -- 결제액
)
is
begin
    -- 포인트 결제 기록 테이블에 추가
    insert into tblPaymentLog 
        values (seqPaymentLog.nextVal, default, ppayment, paseq);
    
    -- 업체 테이블의 보유 포인트 추가
    update tblFirm set availablePoint = availablePoint + ppayment
        where seq = (select firmSeq from tblApprovalF where seq = paseq);
    commit;
exception
    when others then
        rollback;
end procAddPaymentLog;
-------------------------------------------------------------------------------
-- 포인트 충전 내역 총 페이지수 계산하는 함수(업체는 자기의 충전 내역만 볼 수 있다. 승인업체번호, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace function fnPaymentMaxPage(
    paseq number, -- 승인 업체 번호를 받는다.
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from tblPaymentLog where approvalFSeq = paseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 포인트 충전 내역 조회(최대 10개의 업체 본인의 충전 내역을 출력한다. 승인업체번호, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace procedure procListPaymentLog(
    paseq number, -- 승인 업체 번호
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 포인트 결제 기록 번호
                        payment, -- 결제액
                        paymentDate -- 결제 일자
                    from(select rownum as rnum, seq, payment||'p' as payment, paymentDate, approvalFseq
                        from tblPaymentLog where approvalFseq = paseq order by paymentDate desc)
                        where rnum between 10*(fnPaymentMaxPage(paseq, ppage)-1)+1 and fnPaymentMaxPage(paseq, ppage)*10; 
end procListPaymentLog;

--declare
--    vcursor sys_refcursor;
--    vseq tblPaymentLog.seq%type;
--    vpayment varchar2(20);
--    vpaymentDate tblPaymentLog.paymentDate%type;
--begin
--    procListPaymentLog(1, 1, vcursor);
--    loop
--        fetch vcursor into vseq, vpayment, vpaymentDate;
--        exit when vcursor%notfound;
--        DBMS_OUTPUT.put_line(vseq||','||vpayment||','||vpaymentDate);
--    end loop;
--end;
-------------------------------------------------------------------------------
-- 포인트 사용 내역 총 페이지수 계산하는 함수(업체는 자기의 사용 내역만 볼 수 있다. 승인업체번호, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace function fnUsageMaxPage(
    paseq number, -- 승인 업체 번호를 받는다.
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from tblUsageLog where approvalFSeq = paseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 포인트 사용 내역 조회(최대 10개의 업체 본인의 사용 내역을 출력한다. 승인업체번호, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace procedure procListUsageLog(
    paseq number, -- 승인 업체 번호
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 포인트 사용 기록 번호
                        useAmount, -- 사용액
                        usageDate -- 사용 일자
                    from(select rownum as rnum, seq, useAmount||'p' as useAmount, usageDate, approvalFseq
                        from tblUsageLog where approvalFseq = paseq order by usageDate desc)
                        where rnum between 10*(fnUsageMaxPage(paseq, ppage)-1)+1 and fnUsageMaxPage(paseq, ppage)*10; 
end procListUsageLog;

--declare
--    vcursor sys_refcursor;
--    vseq tblUsageLog.seq%type;
--    va varchar2(20);
--    vd tblUsageLog.usageDate%type;
--begin
--    procListUsageLog(1, 1, vcursor);
--    loop
--        fetch vcursor into vseq, va, vd;
--        exit when vcursor%notfound;
--        DBMS_OUTPUT.put_line(vseq||','||va||','||vd);
--    end loop;
--end;