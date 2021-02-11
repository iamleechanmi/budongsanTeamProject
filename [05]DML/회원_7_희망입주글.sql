-- 작성자 : 이찬미
-- [회원] 희망입주글 DML
-------------------------------------------------------------------------------
-- 청강님 view vwHopeWrite를 먼저 생성해야 합니다.
-------------------------------------------------------------------------------
create or replace view vwHopeWrite
as
select
    hpw.seq as seq, -- 글 번호
    m.seq as mseq, -- 회원 번호
    m.name as mname, -- 회원 이름
    m.phone as phone, -- 회원 전화번호
    hpt.dealType as hDType, -- 희망거래유형
    hpp.price as hPrice, -- 희망가격
    case
        when hpp.rent is null then 0
        when hpp.rent is not null then hpp.rent
    end as hRent, -- 희망월세
    hpw.zone as hAddress, -- 지역
    hpw.area as hArea, -- 희망면적(전용면적)
    hpw.roomamount as hRoomNum, -- 희망방개수
    hpw.content as content, -- 내용
    case
        when vri.imgURL is null then 'none'
        when vri.imgURL is not null then vri.imgURL
    end as imgURL -- 가상인테리어 이미지주소(HTML태그)
from tblHopeWrite hpw
    inner join tblHopePrice hpp
        on hpp.seq = hpw.hopePriceSeq
            inner join tblHopeType hpt
                on hpt.seq = hpp.hopeTypeSeq
                    inner join tblMember m
                        on m.seq = hpw.memberSeq
                            left outer join tblVRInterior vri
                                on hpw.seq = vri.hopeWriteSeq
where m.delFlag <> 1 and hpw.delFlag <> 1;
-------------------------------------------------------------------------------
-- 희망입주글 총 페이지수 계산하는 함수(회원은 자기가 작성한 글만 볼 수 있다. 회원번호, 페이지수 필요)
-------------------------------------------------------------------------------
create or replace function fnHopeMaxPage(
    pseq number, -- 회원 번호를 받는다.
    page number -- 현재 페이지수를 받는다.
) return number
is
    vpage number;
    vmaxPage number;
begin
    -- 회원 본인이 작성한 희망입주글의 최대 페이지수를 변수에 저장한다.
    select ceil((select count(seq) from vwHopeWrite where mseq = pseq) / 10) into vmaxPage from dual;
    
    -- 최대 페이지수에서 현재 페이지수를 뺀 값을 저장한다.
    select vmaxPage - page into vpage from dual;
    
    return case
                when vpage <= 0 then vmaxPage -- 마지막 페이지이므로 최대 페이지수를 반환
                when vpage = vmaxPage then 1 -- 첫 페이지이므로 1을 반환
                else page -- 현재 페이지수를 반환
            end;
end;
-------------------------------------------------------------------------------
-- 희망입주글 목록 조회(회원 본인이 쓴 글 목록을 출력한다. 회원번호, 페이지수 필요)
-- 희망입주글 목록에는 [번호, 거래유형, 가격, 지역, 면적, 방개수]이 출력된다. -> 작성일 있는 줄 알았는데 테이블에 없습니다.
-------------------------------------------------------------------------------
create or replace procedure procListHopeWrite(
    pmseq number, -- 회원 번호
    ppage number, -- 페이지수
    pcursor out sys_refcursor
)
is
begin
    open pcursor for select
                        seq, -- 번호
                        hDType, -- 희망 거래 유형
                        hPrice, -- 희망 가격
                        hAddress, -- 희망 지역
                        hArea, -- 희망 면적
                        hRoomNum -- 희망 방 개수
                    from (select rownum as rnum, hw.* from vwHopeWrite hw where mseq = pmseq)
                        where rnum between 10*(fnHopeMaxPage(pmseq, ppage)-1)+1 and fnHopeMaxPage(pmseq, ppage)*10;
end procListHopeWrite;
-------------------------------------------------------------------------------
-- 특정 희망입주글 조회(희망입주글번호 필요)
-------------------------------------------------------------------------------
select
    hDType, -- 희망 거래 유형
    hPrice, -- 희망 가격
    hRent, -- 희망 월세
    hAddress, -- 지역
    hArea, -- 희망 면적
    hRoomNum, -- 희망 방 개수
    content, -- 내용
    imgURL -- 가상인테리어 이미지주소
from vwHopeWrite
    where seq = 희망입주글번호;
-------------------------------------------------------------------------------
-- 희망입주글 작성(회원번호 필요)
-------------------------------------------------------------------------------
create or replace procedure procAddHopeWrite(
    pmseq number, -- 회원 번호
    pdType varchar2, -- 거래 유형(전세/월세/매매)
    pprice number, -- 가격
    prent number, -- 월세
    pzone varchar2, -- 지역
    parea varchar2, -- 면적
    proomAmount varchar2, -- 방 개수
    pcontent varchar2, -- 내용
    pimgURL varchar2 -- 가상인테리어 이미지주소
)
is
begin
    -- 희망 입주 가격 정보 테이블(tblHopePrice)에 추가
    insert into tblHopePrice
        values (seqHopePrice.nextVal, pprice, prent, (select seq from tblHopeType where dealType = pdType));
    
    -- 희망 입주글 테이블에 추가
    insert into tblHopeWrite
        values (seqHopeWrite.nextVal, pzone, parea, proomAmount, pcontent, pmseq, seqHopePrice.currVal, 0);

    -- 가상 인테리어 테이블에 추가
    insert into tblVRInterior
        values (seqVRInterior.nextVal, seqHopeWrite.currVal, pimgURL);
    commit;
exception
    when others then
        rollback;
end procAddHopeWrite;

--begin
--    procAddHopeWrite(1, '전세', 2000, 200, '서울시 강남구 대치동', 40, 2, '이런 방 없을까요?', 'vr0001.jpg');
--end;
--select * from vwhopewrite;
-------------------------------------------------------------------------------
-- 희망입주글 삭제(희망입주글번호 필요)
-------------------------------------------------------------------------------
update tblHopeWrite set delFlag = 1 where seq = 희망입주글번호;