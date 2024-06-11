drop table member;
drop table notice;
drop table customerinquiry;
drop table faq;
drop table payment;

select * from member

CREATE TABLE `twoving`.`member` (
  `userid` VARCHAR(45) NOT NULL,
  `ptseq` INT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `indate` DATETIME NOT NULL DEFAULT now(),
  `useyn` CHAR(1) NULL DEFAULT 'Y',
  PRIMARY KEY (`userid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE `twoving`.`notice` (
  `nseq` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `indate` DATETIME NOT NULL DEFAULT now(),
  `readcount` INT NULL DEFAULT 0,
  `noticeyn` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`nseq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `twoving`.`customerinquiry` (
  `ciseq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `inquirylist` VARCHAR(100) NOT NULL,
  `devicephone` VARCHAR(100) NULL,
  `devicemodelname` VARCHAR(100) NULL,
  `runenvironment` VARCHAR(45) NULL,
  `runplace` VARCHAR(45) NULL,
  `runtime1` VARCHAR(50) NULL,
  `runtime2` VARCHAR(50) NULL,
  `runcontent` VARCHAR(50) NULL,
  `inquirytitle` VARCHAR(50) NOT NULL,
  `inquirycontent` VARCHAR(1000) NOT NULL,
  `reply` VARCHAR(1000) NULL,
  `indate` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`ciseq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE `twoving`.`faq` (
  `qseq` INT NOT NULL AUTO_INCREMENT,
  `inquirylist` VARCHAR(100) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `content` VARCHAR(10000) NOT NULL,
  `indate` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`qseq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE `twoving`.`payment` (
  `pmseq` INT NOT NULL AUTO_INCREMENT,
  `subscribeyn` CHAR(1) NOT NULL DEFAULT 'N',
  `productname` VARCHAR(50) NOT NULL,
  `paymentprice` VARCHAR(50) NOT NULL,
  `paymentmeans` VARCHAR(50) NULL DEFAULT '신용카드',
  `paymentday` DATETIME NOT NULL DEFAULT now(),
  `runperiod1` DATETIME NOT NULL DEFAULT now(),
  `runperiod2` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`pmseq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `twoving`.`passticket` (
  `ptseq` INT NOT NULL AUTO_INCREMENT,
  `productname` VARCHAR(50) NOT NULL,
  `monthcost` VARCHAR(50) NOT NULL,
  `doubleview` VARCHAR(50) NOT NULL,
  `profile` VARCHAR(50) NOT NULL,
  `imagequality` VARCHAR(50) NOT NULL,
  `contentdownload` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ptseq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into passticket(productname, monthcost, doubleview, profile, imagequality, contentdownload) values('광고형 스탠다드', '5,500원', '2대', '4개', '1080p', '15회');
insert into passticket(productname, monthcost, doubleview, profile, imagequality, contentdownload) values('베이직', '9,500원', '1대', '4개', '720p', '200회');
insert into passticket(productname, monthcost, doubleview, profile, imagequality, contentdownload) values('스탠다드', '13,500원', '2대', '4개', '1080p', '300회');
insert into passticket(productname, monthcost, doubleview, profile, imagequality, contentdownload) values('프리미엄', '17,000원', '4대', '4개', '1080p(4K 일부)', '400회');

select* from passticket;

ALTER TABLE member
   ADD FOREIGN KEY (ptseq)
   REFERENCES passticket (ptseq)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
;

ALTER TABLE payment
   ADD FOREIGN KEY (userid)
   REFERENCES member (userid)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
;

insert into payment(userid, subscribeyn, productname, paymentprice) values('one', 'Y', '프리미엄', '17,000원');

ALTER TABLE member modify phone varchar(45) 

insert into member(userid, ptseq, pwd, name, phone, email)
values('one',1, '1111','김나리','017-777-7777','acc@abc.com');

insert into member(userid, ptseq, pwd, name, phone, email)
values('two',2, '2222','김길동','017-7321-7777','acc312@abc.com');

select* from member;
select* from payment;


insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','Toss Pay');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','Google Play');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '프리미엄', '17,000원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','네이버플러스 멤버십');
insert into payment(subscribeyn, productname, paymentprice, paymentmeans) values('Y','광고형 스탠다드', '5,500원','Toss Pay');
insert into payment(productname, paymentprice, paymentmeans) values( '베이직', '9,500원','Toss Pay');
insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','Toss Pay');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','Google Play');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '프리미엄', '17,000원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','네이버플러스 멤버십');insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','Toss Pay');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','Google Play');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '프리미엄', '17,000원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','네이버플러스 멤버십');insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','Toss Pay');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','Google Play');
insert into payment(productname, paymentprice, paymentmeans) values( '스탠다드', '13,900원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '프리미엄', '17,000원','신용카드');
insert into payment(productname, paymentprice, paymentmeans) values( '광고형 스탠다드', '5,500원','네이버플러스 멤버십');



SELECT* FROM notice;

select* from payment;

delete from payment where pmseq=8;

insert into faq(inquirylist, subject, content) values('전체', '	
[기타] 티빙 고객센터 카카오 챗봇 및 실시간 채팅 상담 이용하기', '새롭게 바뀐 티빙 카카오 챗봇에서 궁금한 점을 빠르게 해결해 보세요. 
더욱 자세한 내용이 궁금하시다면 상담사 연결을 통해 실시간 채팅 상담 도 가능합니다. 

■ 티빙 카카오 챗봇 이용 안내 
① 카카오톡에서 TVING 검색 후 채널 추가 
② 티빙 카카오 챗봇에서 궁금한 내용 선택하여 손쉽게 이용 

■ 티빙 실시간 채팅 상담 이용 안내 
① 티빙 카카오 챗봇 문항에서 [상담사 연결] 선택 
② 상담사에게 궁금한 내용 직접 문의하여 상담 진행 

* 티빙 실시간 채팅 상담은 평일 09:00 ~ 17:00에 이용 가능합니다.');

insert into faq(inquirylist, subject, content) values('회원/로그인', '[로그인] 이용권이 있는 계정이 무엇인지 찾고 싶어요.', 
'유료 가입한 계정을 찾고 싶을 때,
아래 방법으로 계정을 찾으신 후 계정 유형을 선택하여 로그인하여 주시기 바랍니다.

■ 이용 계정 확인 방법
① 티빙 WEB/APP 접속
② [티빙 시작하기] 버튼 클릭
③ 가장 하단 [아이디 찾기] 클릭
④ 본인인증으로 찾기 → [본인인증하기] 클릭
⑤ 가입한 계정 ID들 안내
⑥ 계정 ID 옆 (유료)로 표기된 계정으로 로그인

※ 이메일로 찾기 시 확인되지 않으니, 반드시 본인인증으로 찾기로 이용 계정 확인해주세요.
※ SNS 회원은 해당 SNS 아이디가 아닌 티빙 가입 시 등록한 이메일을 알려드립니다.
※ 본인인증이 완료된 계정만 확인이 가능합니다.
※ 네이버플러스멤버십 이용권 계정은 본인인증찾기로 확인되지 않습니다.

보다 자세한 확인이 필요한 경우, [1:1 게시판 문의] 또는 [tving@cj.net]로 문의해 주시면 가입하신 계정 확인하여 답변드리겠습니다.');


insert into faq(inquirylist, subject, content) values('이용권/결제', 
'[변경] 정기결제수단 변경은 어떻게 하나요?', 

'결제수단 변경은 PC와 모바일웹에서 변경하실 수 있습니다.
변경 방법은 아래 경로를 확인해 주세요.

■ 결제수단 변경 방법
(모바일웹)
1. www.tving.com 접속 후 로그인
2. 우측 상단 [결제 수단] 클릭
3. 변경할 결제 정보 입력 후 완료

(PC)
1. www.tving.com 접속 후 로그인
2. 우측 상단 프로필 클릭
3. MY 버튼 클릭
4. 이용권/캐시 내역 메뉴 클릭
5. 결제 수단 항목의 [변경] 버튼 클릭
6. 변경할 결제 정보 입력 후 완료

※ 티빙 APP에서는 결제수단 변경이 어렵습니다.
※ 결제 수단은 신용카드, 네이버페이, 카카오페이, 토스페이로 변경할 수 있습니다.
※ 결제 수단 변경 시 다음 결제일부터 적용됩니다.
※ 결제 중인 휴대폰 결제를 타 결제 수단으로 변경하시는 경우, 더 이상 휴대폰 결제는 이용하실 수 없습니다.');

insert into faq(inquirylist, subject, content) values('재생/오류', 
'[플레이어] 콘텐츠 재생 중 화면 비율은 어떻게 변경하나요?', 
'콘텐츠 재생 중 화면 비율은 핀치 인/아웃 제스처로 변경할 수 있어요. 
* 꽉찬 화면으로 변경 : 전체 화면 모드에서 두 손가락으로 화면을 확대하듯이 늘려주세요. 
* 원본 비율로 변경 : 전체 화면 모드에서 두 손가락으로 화면을 축소하듯이 모아주세요.');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[해지] 정기결제 해지가 무엇인가요?',
'정기결제 해지란 티빙에서 구독중인 이용권의 정기 자동 결제를 중단하는 것을 말합니다. 
정기결제 해지 시 다음 회차부터 결제가 중단되며, 현재 이용중인 회차는 이용권 만료일까지 이용 가능합니다. 
정기결제 해지는 아래의 방법으로 신청 가능하시오니 이용에 참고 부탁드립니다. 
■ 정기결제 해지 방법 
- PC WEB : www.tving.com > 로그인 > MY > 나의 이용권 > 이용권 클릭 > ‘변경/해지’ 버튼 클릭하여 해지 
- Mobile APP : TVING APP > 로그인 > MY > 나의 이용권 > 이용권 클릭 > ‘정기결제 해지하기’ 버튼 클릭하여 해지 
* 구글/애플 인앱결제로 구독하신 이용권은 각 스토어로 구독취소 신청하셔야 구독해지가 가능합니다. 
* 네이버/통신사 등 제휴처 상품을 이용 중인 경우 각 제휴처로 문의가 필요합니다. '
);

insert into faq(inquirylist, subject, content) values('서비스 이용', 
'[광고] 광고를 그만 보고 싶어요.',
'광고형 요금제로 콘텐츠를 시청하시는 경우 시간 당 최대 4분 정도의 광고가 표시될 수 있습니다.
광고 없이 시청을 원하시는 경우 광고가 없는 이용권으로 구독을 변경하실 수 있으며, 상세 내용은 [이용권] 페이지에서 확인 가능합니다.');

insert into faq(inquirylist, subject, content) values('회원/로그인',
'[로그인] TV에서 직접 로그인은 어떻게 하나요?',
'[TV에서 로그인 하기] 방법은 다음과 같습니다. 
■ TV에서 직접 로그인하기 방법 
① [TV에서 로그인 하기] 버튼 선택 
② [TVING ID] 또는 [CJ ONE ID] 중 사용하시는 계정 유형 선택 
③ TV 화면의 키보드에서 리모컨으로 아이디 입력 후 [다음] 선택 
④ TV 화면의 키보드에서 리모컨으로 비밀번호 입력 후 [다음] 선택 
* 단, [TV에서 로그인 하기] 방법은 TVING ID와 CJ ONE ID 유형만 이용 가능합니다. 
* SNS 계정을 사용하시는 경우 [스마트폰에서 로그인 하기]를 이용해 주세요.');

insert into faq(inquirylist, subject, content) values('회원/로그인',
'[로그인] SNS 계정은 TV에서 직접 로그인할 수 없나요?',
'[TV에서 로그인 하기]는 TVING ID와 CJ ONE ID 2가지 유형만 이용 가능합니다. 
SNS 계정은 [스마트폰에서 로그인하기]를 통해 로그인해 주셔야 하는 점 양해 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('회원/로그인',
'[로그인] TV에서 QR코드로 로그인은 어떻게 하나요?',
'QR코드로 로그인하는 방법은 다음과 같습니다. 
■ 스마트폰에서 로그인하기 방법 안내 
① [스마트폰에서 로그인 하기] 버튼 선택 
② 휴대폰 카메라 앱으로 TV 화면의 [QR코드]를 비춘 후 스마트폰 화면에 표기되는 [링크] 클릭 
③ 스마트폰 화면에서 사용하는 [계정 유형] 선택 (모든 유형 로그인 가능) 
④ 스마트폰에서 아이디, 비밀번호 입력 후 [로그인 하기] 버튼 클릭 
QR코드 방식이 어려우시다면, [직접 입력해서 접속하기] 안내에 따라 한 번 더 로그인해 주세요.');

insert into faq(inquirylist, subject, content) values('회원/로그인',
'[회원] 티빙 회원가입 방법이 궁금해요.',
'TVING 회원가입은 TVING 계정, SNS 연동 계정, CJ ONE 통합 계정으로 가입이 가능합니다.
* SNS 연동 계정 종류 : Facebook, Naver, Kakao, Apple

■ 회원가입 방법
1) PC (WEB)
① 티빙 WEB 접속
② [티빙 시작하기] 클릭
③ 가입할 계정 유형 선택 (TVING, SNS, CJ ONE 중 유형 선택)
④ 회원가입하기

 2) MOBILE (APP)
① 티빙 APP 접속
② [티빙 시작하기] 클릭
③ 가입할 계정 유형 선택 (TVING, SNS, CJ ONE 중 유형 선택)
④ 회원가입하기');


insert into faq(inquirylist, subject, content) values('이용권/결제', 
'[요금제] 광고형 스탠다드 이용권이 무엇인가요?', 
'광고형 스탠다드 이용권은 저렴한 요금으로 고품질의 혜택이 제공되는 이용권으로, 시청 시 광고가 표시될 수 있습니다.
■ 광고형 스탠다드 이용권 안내
① 동시시청 2대, 최대 1080P 화질(FHD), 프로필 4개 생성, PC/모바일/태블릿/TV 앱 지원
② 타임머신, Quick VOD, PIP 시청 기능(라이브 채널), 다운로드(월 15회) 제공
③ 크롬캐스트 서비스 미지원
＊파라마운트+ 등 일부 콘텐츠 이용이 제한될 수 있습니다.
＊제휴사의 요금제/부가서비스 상품 혜택은 각 제휴사의 이용권 안내를 확인해 주세요.
＊이용권 상세 내용은 PC 공지사항 또는 이용권 구매 페이지를 확인해 주세요.
＊2024년 6월 18일 <파라마운트+> 콘텐츠 및 브랜드관 서비스가 종료됩니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제', 
'[요금제] KT 티빙 라이트 이용권의 광고 시청 정책이 어떻게 되나요?', 
'광고노출 정책은 광고형 스탠다드 이용권과 동일합니다. 티빙의 광고형 스탠다드 FAQ를 확인해 주세요.');

insert into faq(inquirylist, subject, content) values('이용권/결제', 
'[요금제] 광고형 스탠다드에서에서 광고는 어떻게 제어하나요?', 
'광고 시청 중에는 되감기/빨리감기/재생 속도 제어 기능이 지원되지 않으며, 일시정지만 가능한 점 참고 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제', 
'[요금제] 광고형 스탠다드에서에서 광고 스킵(건너뛰기)이 가능한가요?',
'광고 건너뛰기의 경우 특정 시간 동안 광고 시청 이후 건너뛰기 기능이 제공되는 광고와 그렇지 않은 광고가 있어 시청 시 확인하실 수 있습니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제', 
'[요금제] 광고형 스탠다드에서 광고는 어떻게 표시되나요?',
'시청 전과 시청 중 광고가 제공될 수 있으며, 시청 중 광고는 플레이어 내 구간이 표시됩니다.
광고는 제공 상황에 따라 노출되지 않을 수 있습니다.');

insert into faq(inquirylist, subject, content) values('재생/오류',
'[KBO] 중계 시청 시, 라이브 예정입니다 메세지가 확인됩니다.',
'KBO 재생 시, 라이브 예정입니다 메시지가 확인되신다면 이용하시는 단말기의 시간 설정이 현재 시간이 아닐 수 있습니다.
이용하시는 단말기의 시간을 다시 한 번 확인 후 이용해 주시기 바랍니다.
* 단, 티빙은 국내 서비스로 해외 시청 또는 VPN 등으로 IP 우회 이용 시 정상 시청이 어려운 점 참고 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('재생/오류', 
'[다운로드] 시리즈와 영화 콘텐츠 다운로드는 어떻게 하나요?', 
'콘텐츠 다운로드는 광고형 스탠다드 이상 이용권 구독 시 AOS 및 iOS 모바일/태블릿 앱 v9.1.0 이상 버전에서 이용 가능합니다. 
1) 시리즈 다운로드 
- 모바일/태블릿 티빙 앱 실행 > 콘텐츠 리스트 진입 > 각 에피소드 리스트 우측 [다운로드] 버튼 클릭하여 다운로드 
2) 영화 다운로드 
- 모바일/태블릿 티빙 앱 실행 > 영화 콘텐츠 진입 > 플레이어 하단 [다운로드] 버튼 클릭하여 다운로드 
다운로드한 콘텐츠는 7일간 온/오프라인 시청 가능하며, 
티빙 앱 하단 [다운로드] 메뉴에서 다운로드 받으신 콘텐츠 확인 및 시청이 가능합니다. 
* PC 및 TV 기기에서는 다운로드가 제공되지 않습니다. 
* 다운로드 받은 콘텐츠의 이용기간 만료 시 온라인 상태에서 연장 가능합니다.');

insert into faq(inquirylist, subject, content) values('재생/오류',
'[다운로드] 시리즈와 영화 콘텐츠를 다운로드하면 오프라인 시청이 가능한가요?',
'콘텐츠 다운로드는 광고형 스탠다드 이상 이용권 구독 시 AOS 및 iOS 모바일/태블릿 앱 v9.1.0 이상 버전에서 이용가능하며, 
다운로드 완료한 시리즈와 영화 콘텐츠는 7일간 온/오프라인 시청 가능합니다. 
이용기간이 만료된 경우 온라인 상태에서 기간 연장 가능합니다. 
해외에서 이용기간이 만료된 경우에도 온라인 상태로 티빙 앱 접속 시 기간 연장 가능합니다. (신규 다운로드는 불가능)');

insert into faq(inquirylist, subject, content) values('재생/오류',
'[다운로드] 시리즈와 영화 콘텐츠를 다운로드하면 해외에서도 시청 가능한가요?',
'모바일/태블릿 기기에 다운로드 완료 상태인 경우 해외에서도 오프라인 시청이 가능합니다. 
다운로드 완료한 시리즈 및 영화 콘텐츠의 이용기간은 7일이며, 
이용기간이 만료된 경우 해외에서도 온라인 상태로 티빙 앱 접속 시 기간 연장 가능합니다. 

단, 해외에서 시리즈 및 영화 콘텐츠의 신규 다운로드는 제공되지 않으며, 
국내에서 다운로드 완료한 콘텐츠만 이용 가능한 점 참고 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('해지/환불',
'[해지/환불] 중도 해지가 무엇인가요?',
'중도 해지란 티빙에서 구독한 이용권의 이용을 중단하고 즉시 해지하는 것을 말합니다. 
이용권 중도 해지 시, 이용권 이용이 즉시 중단되고 이용권도 즉시 해지되며, 이용 중인 회차의 미사용 기간에 대한 금액이 환불됩니다. 
중도 해지는 아래의 방법으로 신청 가능하시오니 이용에 참고 부탁드립니다. 

■ 중도 해지 방법 
- PC WEB : www.tving.com > 로그인 > 고객센터 > 고객문의 > 문의 유형 [환불/해지 신청] 선택하여 접수 
- Mobile APP : TVING APP > 로그인 > MY > 고객센터 > 1:1 문의 > 문의 유형 [환불/해지 신청] 선택하여 접수 
* 이용권 구매 후 7일이 경과하거나, 이용권의 시청 내역이 있는 경우에는 사용일 수만큼 차감(일할 계산) 후 환불됩니다. 
  (단, 연간 이용권의 경우는 할인 구매가가 아닌 12개월 정가 기준으로 차감됩니다) 
* 네이버/통신사 등 제휴처 상품을 이용중인 경우 각 제휴처의 환불 규정을 따릅니다. ');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[해지/환불] 청약 철회가 무엇인가요?',
'청약 철회란 티빙 이용권 구매 후 사용내역이 없는 경우 결제일로부터 7일 이내 청약을 철회하고 결제 취소 또는 전액 환불하는 것을 말합니다. 
청약철회가 필요하신 경우 아래의 방법으로 신청 가능하시오니 이용에 참고 부탁드립니다. 

■ 청약 철회 방법 
- PC WEB : www.tving.com > 로그인 > 고객센터 > 고객문의 > 문의 유형 [환불/해지 신청] 선택하여 접수 
- Mobile APP : TVING APP > 로그인 > MY > 고객센터 > 1:1 문의 > 문의 유형 [환불/해지 신청] 선택하여 접수 
* 구글/애플 인앱결제로 구독하신 이용권은 각 스토어 고객센터로 환불 신청이 필요합니다. 
* 네이버/통신사 등 제휴처 상품을 이용 중인 경우 각 제휴처로 문의가 필요합니다. ');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[해지] 티빙에서 직접 결제한 이용권 해지하고 싶어요.',
'티빙 직접결제로 구매한 상품의 정기결제 직접 해지 방법은 다음과 같습니다.
■ 정기결제 직접 해지 방법 안내
1) PC에서 해지하기
① TVING WEB 로그인
② 우측 상단 [프로필 아이콘] 클릭
③ [MY] 버튼 클릭
④ [나의 이용권] 또는 [이용권/캐시 내역] 버튼 클릭
⑤ 구독중인 이용권 [변경/해지] 버튼 클릭
⑥ 최하단 [자동결제 해지 신청하기] 버튼 클릭하여 해지 진행
2) APP에서 해지하기
① TVING APP 로그인
② 우측 상단 [프로필 아이콘] 클릭
③ [나의 이용권] 또는 [이용권] 버튼 클릭
④ 구독중인 이용권 [변경/해지] 버튼 클릭
⑤ 최하단 [자동결제 해지 신청하기] 버튼 클릭하여 해지 진행
※ 정기결제 해지 완료된 상품은 다음 결제 도래일에 결제가 일어나지 않으며, 이용권의 권한 만료일까지는 이용하실 수 있습니다.
※ 해지 신청 완료 시, 구독중인 상품명 아래 [해지 취소] 버튼이 표시됩니다.
※ 해지 신청을 취소하고 싶으신 경우, 구독중인 상품명 아래의 [해지 취소] 버튼으로 진행할 수 있습니다
더욱 자세한 문의는 [1:1 게시판 문의] 또는 [tving@cj.net]로 접수해 주시면 빠르게 도움 드리겠습니다.');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[환불] 모바일 상품권의 환불은 어떻게 하나요?', 
'모바일 상품권 환불, 유효기간 연장 등 추가 문의 사항이 있으신 경우, 티빙에서 확인해 드리기 어렵습니다.
번거로우시겠지만 모바일 상품권 구매처로 관련 문의 및 환불 상담을 부탁드립니다.');


insert into faq(inquirylist, subject, content) values('서비스/이용',
'[편의기능] 광고형 스탠다드에서 팝업 플레이어 PIP 버튼(기능)이 없어요.',
'광고형 요금제로 콘텐츠를 시청하시는 경우, PIP 시청 기능은 라이브 채널만 제공됩니다.
베이직/스탠다드/프리미엄 이용권으로 변경하시면 VOD 시청 시에도 해당 기능을 사용하실 수 있으며, 상세 내용은 [이용권] 페이지에서 확인 가능합니다.');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[크롬캐스트] 광고형 스탠다드에서 크롬캐스트 연결 버튼(기능)이 없어요.',
'광고형 요금제로 콘텐츠를 시청하시는 경우, 크롬캐스트 기능이 지원되지 않습니다.
TV 기기의 이용을 원하시는 경우 티빙 공식 APP을 설치하시면 이용이 가능합니다.
＊OS 버전 및 기기사양(메모리), 제조사에 따라 일부 기기에서는 서비스가 정상 동작하지 않을 수 있습니다.
베이직/스탠다드/프리미엄 이용권으로 변경하시면 크롬캐스트 기능을 사용하실 수 있으며, 상세 내용은 [이용권] 페이지에서 확인 가능합니다.');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[크롬캐스트] KT 티빙 라이트에서 크롬캐스트 연결 버튼(기능)이 없어요.',
'광고형 요금제로 콘텐츠를 시청하시는 경우, 크롬캐스트 기능이 지원되지 않습니다.
TV 기기의 이용을 원하시는 경우 티빙 공식 APP을 설치하시면 이용이 가능합니다.
＊OS 버전 및 기기사양(메모리), 제조사에 따라 일부 기기에서는 서비스가 정상 동작하지 않을 수 있습니다.
베이직/스탠다드/프리미엄 이용권으로 변경하시면 크롬캐스트 기능을 사용하실 수 있으며, 상세 내용은 [이용권] 페이지에서 확인 가능합니다.');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[편의기능] KT 티빙 라이트에서 다운로드가 진행이 안돼요.',
'KT 티빙 라이트 이용권으로 콘텐츠를 시청하시는 경우, 콘텐츠 다운로드 기능은 제공되지 않습니다.
베이직/스탠다드/프리미엄 이용권으로 변경하시면 해당 기능을 사용하실 수 있으며, 상세 내용은 [이용권] 페이지에서 확인 가능합니다.');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[편의기능] KT 티빙 라이트에서 팝업 플레이어 PIP 버튼(기능)이 없어요.',
'KT 티빙 라이트 이용권으로 콘텐츠를 시청하시는 경우, PIP 시청 기능은 라이브 채널만 제공됩니다. 
베이직/스탠다드/프리미엄 이용권으로 변경하시면 해당 기능을 사용하실 수 있으며, 상세 내용은 [이용권] 페이지에서 확인 가능합니다.');

insert into faq(inquirylist, subject, content) values('회원/로그인',
'[로그인] 자동 로그아웃이 되었는데, 제 계정을 모르겠어요.',
'APP과 PC WEB 계정 선택 화면에서 최근에 마지막으로 로그인하신 계정을 확인하실 수 있습니다.
최근 로그인하신 계정을 선택하여 주시고, 혹시라도 일치하는 회원정보가 없다는 알림 메시지가 나온다면 아래 사항을 확인하여 주세요.

■ TVING 계정 확인 방법
1) 계정 선택 화면 가장 하단 아이디 찾기 클릭
2) 본인인증으로 찾기 > 본인인증하기
3) 가입한 계정 ID들 안내  
4) 계정 ID 옆 (유료)로 표기된 계정으로 로그인

※ 이메일로 찾기 시 확인되지 않으니, 반드시 본인인증으로 찾기로 이용 계정 확인해주세요.
※ SNS 회원은 해당 SNS 아이디가 아닌 티빙 가입 시 등록한 이메일을 알려드립니다.
※ 본인인증이 완료된 계정만 확인이 가능합니다.
※ 네이버플러스멤버십 이용권 계정은 본인인증찾기로 확인되지 않습니다.
지속해서 로그인이 되지 않으시는 경우, 1:1 게시판 문의 또는 tving@cj.net 으로 문의해 주시면,
신속하게 가입하신 계정 확인하여 답변드리겠습니다.');

insert into faq(inquirylist, subject, content) values('회원/로그인',
'[회원] 회원정보를 변경하고 싶어요.',
'회원 가입 시 등록하신 TVING의 회원정보는 PC와 MOBILE의 [회원정보 수정] 메뉴에서 변경하실 수 있으며, 
CJ ONE 회원님은 CJ ONE 사이트의 [회원정보] 를 통해 변경이 가능합니다.

 ■ 회원정보 수정 안내
1) PC (WEB)
① 티빙 WEB 로그인
② 우측 상단 [프로필 아이콘] 클릭
③ [MY] 메뉴 클릭
④ [회원정보 수정] 메뉴 클릭
⑤ 비밀번호 추가 입력 후 메뉴 진입하여 회원정보 변경
2) MOBILE (APP)
① 티빙 APP 로그인
② 우측 상단 [프로필 아이콘] 클릭하여 MY 메뉴 진입
③ [회원정보 수정] 메뉴 클릭
④ 비밀번호 추가 입력 후 메뉴 진입하여 회원정보 변경');


insert into faq(inquirylist, subject, content) values('회원/로그인',
'[회원] 회원 탈퇴 방법이 궁금해요',
'회원 탈퇴를 원하시는 경우 아래와 같은 방법으로 진행하실 수 있습니다.

■ 회원탈퇴 방법
1) PC (WEB)
① 티빙 WEB 로그인
② 우측 상단 [프로필 아이콘] 클릭
③ [MY] 메뉴 클릭
④ [회원정보 수정] 메뉴 클릭
⑤ [회원탈퇴] 메뉴 클릭하여 탈퇴 진행
2) MOBILE (APP)
① 티빙 APP 로그인
② 우측 상단 [프로필 아이콘] 클릭하여 MY 메뉴 진입
③ [회원정보 수정] 메뉴 클릭
④ [회원탈퇴] 메뉴 클릭하여 탈퇴 진행

유료 서비스를 이용중이신 경우 회원 탈퇴 시 정기결제 해지와 상품 포기 동의가 진행됩니다. 
정기결제 해지 및 상품 포기 동의 시 보유하신 이용권 및 쿠폰의 이용이 즉시 중단됩니다.
회원탈퇴는 개인정보와 관련된 내용으로 반드시 본인이 내용을 숙지하고 동의하셔야 하기 때문에
 [1:1 게시판 문의]나 [tving@cj.net]로 요청하실 경우 지원이 불가한 점 양해 부탁드립니다.');
 
 
 insert into faq(inquirylist, subject, content) values('회원/로그인',
 '[프로필] 프로필 비밀번호 초기화 방법이 궁금해요.',
 '프로필 비밀번호 초기화 방법 안내드립니다.

■ 프로필 비밀번호 초기화 안내
1) PC
① 티빙 WEB 접속
② [티빙 시작하기] 버튼 클릭
③ 아이디, 비밀번호 입력 후 [로그인하기] 버튼 클릭
④ [프로필 편집] 버튼 클릭
⑤ 편집할 프로필 선택
⑥ [비밀번호 초기화] 버튼 클릭

2) APP
① 티빙 APP 접속
② [티빙 시작하기] 버튼 클릭
③ 아이디, 비밀번호 입력 후 [로그인하기] 버튼 클릭
④ 우측 상단 [편집] 버튼 클릭
⑤ 편집할 프로필 선택
⑥ [비밀번호 초기화] 버튼 클릭');

 insert into faq(inquirylist, subject, content) values('회원/로그인',
 '[프로필] 프로필 잠금 설정 방법이 궁금해요.',
 '프로필 잠금 설정 방법 안내드립니다.

구매하신 이용권에 따라 프로필을 최소 1개 ~ 4개까지 제공해 드리고 있습니다.
이 중 프로필 2개 이상이 제공되는 스탠다드, 프리미엄 이용권은 프라이버시 보호를 위하여 아래와 같이 프로필 잠금 설정 기능을 제공해 드리고 있습니다.

■ 프로필 잠금 설정 방법 안내
1) PC
① 티빙 WEB 접속
② [티빙 시작하기] 버튼 클릭
③ 아이디, 비밀번호 입력 후 [로그인하기] 버튼 클릭
④ [프로필 편집] 버튼 클릭
⑤ 편집할 프로필 선택
⑥ 프로필 잠금 설정 ON
⑦ 사용할 비밀번호 4자리 입력
2) APP
① 티빙 APP 접속
② [티빙 시작하기] 버튼 클릭
③ 아이디, 비밀번호 입력 후 [로그인하기] 버튼 클릭
④ 우측 상단 [편집] 버튼 클릭
⑤ 편집할 프로필 선택
⑥ 프로필 잠금 설정 ON
⑦ 사용할 비밀번호 4자리 입력');

 insert into faq(inquirylist, subject, content) values('회원/로그인',
 '[프로필] 자녀 보호 설정 기능을 알고 싶어요.',
 '티빙의 자녀 보호 기능은 프로필 단위의 성인인증과 잠금설정 기능을 통해 설정 가능합니다.
티빙의 모든 청소년 관람 불가 콘텐츠의 미리보기 및 본편은 성인인증을 완료한 프로필에서만 재생 가능하며,
성인인증을 완료하지 않은 프로필에서는 미리보기 및 본편 재생이 제한됩니다.
티빙 계정을 자녀분과 함께 사용하시는 경우 성인인증을 하지 않은 프로필로 시청하도록 설정해 주시면 안전한 이용이 가능합니다.
또한, 프로필 별 비밀번호 설정을 통해 성인인증을 완료한 프로필에 잠금설정을 진행하시면 부모님과 자녀분이 사용할 프로필을 구분하여 이용이 가능한 점 참고 부탁드립니다.
자녀보호를 위해 특정 프로필의 성인인증을 해제하고자 하시는 경우, 아래 정보를 기재하시어 [1:1 게시판 문의] 또는 [tving@cj.net]로 접수해 주시면 신속히 해제 도움드리겠습니다.
[성인인증 해제 신청 양식] 
1. 사용 아이디 : 
2. 해제할 프로필 이름 : 
3. 해제 사유 :
* 접속하신 프로필의 성인인증 완료 여부는 아래 경로에서 확인 가능합니다.
- MOBILE (APP) : 확인하실 프로필로 접속 > 우측 상단 [프로필 아이콘] 클릭 > 우측 상단 [톱니바퀴 아이콘] 클릭 > 프로필 성인인증 메뉴 확인');


insert into faq(inquirylist, subject, content) values('이용권/결제',
'[요금제] 광고형 스탠다드 이용권으로 이용할 수 없는 콘텐츠는 무엇인가요?',
'광고형 요금제에서는 파라마운트+ 등 일부 콘텐츠는 이용이 제한될 수 있습니다.
시청이 불가한 콘텐츠의 경우 콘텐츠 진입 시 이용권 업그레이드 안내 화면이 노출됩니다.
＊제휴사의 요금제/부가서비스 상품 혜택은 각 제휴사의 이용권 안내를 확인해 주세요.
＊2024년 6월 18일 <파라마운트+> 콘텐츠 및 브랜드관 서비스가 종료됩니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제',
'[요금제] KT 티빙 라이트 이용권은 어떤 콘텐츠를 볼 수 있나요?',
'KT 티빙 라이트 요금제에서 파라마운트+ 등 일부 콘텐츠는 이용이 제한될 수 있습니다.
시청이 불가한 콘텐츠의 경우 콘텐츠 진입 시 이용권 업그레이드 안내 화면이 노출됩니다.

＊2024년 6월 18일 <파라마운트+> 콘텐츠 및 브랜드관 서비스가 종료됩니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제',
'[요금제] KT 티빙 라이트 이용권이 무엇인가요?',
'KT 티빙 라이트 이용권은 저렴한 요금으로 고품질의 혜택이 제공되는 이용권으로, 시청 시 광고가 표시될 수 있습니다.

■ 티빙 라이트 이용권 혜택 안내
① 동시시청 3대, 프로필 4개 생성, 최대 1080P 화질(FHD), PC/모바일/태블릿/TV 앱지원
② 타임머신, Quick VOD, PIP 기능(라이브 채널) 제공
③ 크롬캐스트, 다운로드 서비스 미지원 

＊ 파라마운트+ 등 일부 콘텐츠 이용이 제한될 수 있습니다.
＊ 통신사 이용권 상세 내용은 KT 홈페이지 또는 고객센터로 문의해 주세요.
＊ 2024년 6월 18일 <파라마운트+> 콘텐츠 및 브랜드관 서비스가 종료됩니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제',
'[결제] 보조 결제 수단 변경 및 삭제 방법이 궁금해요.',
'등록된 보조 결제 수단의 우측 (⁝) 버튼 클릭하시면 다른 결제 수단으로 변경 및 삭제하실 수 있습니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제',
'[결제] 기본 결제 수단 변경 및 삭제 방법이 궁금해요.',
'등록된 기본 결제 수단의 우측 (+) 버튼을 클릭하시면 다른 결제 수단으로 변경하실 수 있습니다.

기본 결제 수단은 즉시 삭제할 수 없으며,
다른 결제 수단으로 변경하신 후 삭제가 가능한 점 이용에 참고 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('이용권/결제',
'[결제] 기본 결제 수단과 보조 결제 수단이 뭐에요?',
'* 기본 결제 수단 : 정기 결제 시 기본으로 결제되는 결제 수단
* 보조 결제 수단 : 기본 결제 수단으로 결제가 실패되는 경우, 이용권이 해지되지 않도록 등록한 예비 결제 수단

기본 결제 수단과 보조 결제 수단은 각각 1개씩 지정하실 수 있으며,
기본 결제 수단으로 결제가 실패하는 경우, 보조 결제 수단으로 결제됩니다.');


insert into faq(inquirylist, subject, content) values('재생/오류', 
'[KBO] 중계 시청 시, 라이브 예정입니다 메세지가 확인됩니다.', 
'KBO 재생 시, 라이브 예정입니다 메시지가 확인되신다면 이용하시는 단말기의 시간 설정이 현재 시간이 아닐 수 있습니다.
이용하시는 단말기의 시간을 다시 한 번 확인 후 이용해 주시기 바랍니다.

* 단, 티빙은 국내 서비스로 해외 시청 또는 VPN 등으로 IP 우회 이용 시 정상 시청이 어려운 점 참고 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('재생/오류', 
'[다운로드] 다운로드 후 기간 만료된 콘텐츠는 어떻게 시청하나요?', 
'모바일/태블릿 기기에 시리즈 및 영화 콘텐츠를 다운로드한 콘텐츠의 이용기간이 만료된 경우 
다운로드 메뉴의 콘텐츠 우측 상태 버튼을 클릭하여 기간을 연장할 수 있습니다. 

다운로드 콘텐츠 이용기간은 7일 연장 가능하며, 온라인 상태에서만 연장 가능한 점 참고 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('재생/오류', 
'[다운로드] 콘텐츠 다운로드 화질은 선택할 수 없나요?', 
'시리즈 및 영화 콘텐츠 다운로드 화질은 아래의 메뉴에서 선택 가능합니다. 

1) 다운로드 화질 선택 방법 
- 모바일/태블릿 티빙 앱 실행 > MY > 환경설정 > 다운로드 화질선택 > 고화질/일반화질 중 선택 (고화질은 스탠다드 이상만 가능) 

2) 이용권 별 다운로드 화질 제공 
- 광고형 스탠다드/베이직 : 일반화질 다운로드 가능 
- 스탠다드/프리미엄 : 고화질, 일반화질 선택하여 다운로드 가능 

* 콘텐츠 고화질 다운로드는 최대 1080p 화질로 다운로드 가능합니다.
* 제공되는 최대 화질이 720p인 콘텐츠는 고화질로 다운로드해도 720p로 다운로드 될 수 있습니다.');

insert into faq(inquirylist, subject, content) values('재생/오류', 
'[다운로드] 콘텐츠 다운로드 횟수에 제한이 있나요?', 
'콘텐츠 다운로드 횟수는 이용권 별로 다르게 제공되며, 상세 제공 횟수는 다음과 같습니다. 

1) 광고형 스탠다드 이용권: 月 15회 다운로드 가능
2) 베이직 이용권 : 月 200회 다운로드 가능 
3) 스탠다드 이용권 : 月 300회 다운로드 가능 
4) 프리미엄 이용권 : 月 400회 다운로드 가능 

* 다운로드 횟수는 다운로드 완료 기준으로 차감됩니다. 
* 동일한 콘텐츠를 다른 기기에 다운로드하는 경우에도 다운로드 횟수가 차감됩니다. 
* 다운로드 완료한 콘텐츠를 삭제 후 재다운로드 하는 경우에도 다운로드 횟수가 차감됩니다.');

insert into faq(inquirylist, subject, content) values('재생/오류',
'[다운로드] 다운로드한 콘텐츠 이용기간 연장 시 다운로드 횟수가 차감되나요?',
'콘텐츠 다운로드 횟수는 시리즈 또는 영화 콘텐츠를 다운로드 완료한 경우 1회씩 차감되며, 
이미 다운로드 완료한 콘텐츠의 이용기간이 만료되어 이용기간을 연장하는 경우에는 횟수가 차감되지 않습니다. 

단, 이용기간 만료된 콘텐츠를 삭제 후 재다운로드 하는 경우 다운로드 횟수가 차감됩니다.');	

insert into faq(inquirylist, subject, content) values('재생/오류', 
'[다운로드] 다운받았던 콘텐츠를 재다운로드해도 다운로드 횟수가 차감되나요?', 
'다운로드 횟수는 시리즈 및 영화 콘텐츠 다운로드 완료 시 횟수가 차감됩니다. 
이에 따라 동일한 콘텐츠를 다른 기기에 다운로드 하는 경우에도 횟수가 추가로 차감되며, 
다운로드한 콘텐츠를 삭제하고 동일 기기에 재다운로드 하는 경우에도 다운로드 횟수가 차감됩니다.');


insert into faq(inquirylist, subject, content) values('해지/환불', 
'[해지] 구글 인앱결제 이용권 해지하고 싶어요.',
'구글 인앱결제를 통해 구매하신 이용권은 Google Play 스토어로 [구독취소] 신청하셔야 구독해지가 가능합니다.
■ 구글 인앱결제 이용권 해지 방법 안내
1) Play 스토어 APP에서 해지하기
① 안드로이드 기기에서 [Play 스토어] APP 실행
② 우측 상단 [프로필 아이콘] 클릭
③ [결제 및 정기결제] 버튼 클릭
④ [정기결제] 버튼 클릭하여 구독 취소
2) 티빙 APP에서 해지하기
① 안드로이드 기기에서 티빙 APP 실행
② 우측 상단 [프로필 아이콘] 버튼 클릭
③ [이용권] 메뉴 클릭
④ 하단 유의사항의 [정기결제] 버튼 클릭하여 Play 스토어 이동
⑤ 구독 취소할 상품 선택하여 해지 진행
결제 창 하단에 구글 인앱 구독 유의사항이 기재 되어 있으니 확인 부탁드리며,
환불이 필요하신 경우 구매 후 48시간 이내에 [Play 스토어 → 우상단 프로필 아이콘 → 고객센터 → Google Play에서 환불 요청하기]로 신청이 필요한 점 참고 부탁드립니다.
※ 이용권 해지 시 다음 결제일부터 결제 연장되지 않으며, 이용권의 권한 만료일까지는 이용하실 수 있습니다.
※ 자동 결제 해지는 결제 예정일 최소 24 시간 전에 해지 신청해야 합니다. 
※ 결제 예정일 전 24 시간 이내에는 자동 결제 를 해지해도 이용권이 결제될 수 있습니다.
더욱 자세한 문의는 [1:1 게시판 문의] 또는 [tving@cj.net]로 접수해 주시면 빠르게 도움 드리겠습니다.');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[해지] 정기결제 해지를 했는데 네이버페이 앱에서 이용중으로 표시됩니다.',
'티빙에서 이용권 정기결제 해지 시 네이버페이로 구매한 이용권도 정상 해지되며, 다음 결제도래일부터 결제가 일어나지 않습니다.
다만, 정기결제 해지의 경우 현재 이용권의 만료일까지는 티빙 이용이 가능하시므로 고객님의 네이버페이 앱 내 이용중으로 표시될 수 있습니다.');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[해지] 이용권 해지 / 해지 철회가 안돼요.', 
'이용권 해지 / 해지 철회(취소)에 어려움이 있으신 경우, 다음의 경로를 통해 문의해 주세요.
1) PC 해지 문의 : TVING WEB 로그인 > 고객센터 > 고객문의 > 환불/해지 신청 카테고리 선택 후 문의 
2) APP 해지 문의 : TVING APP > 로그인 > MY > 고겍센터 > 1:1문의 > 환불/해지 신청 카테고리 선택 후 문의');

insert into faq(inquirylist, subject, content) values('해지/환불',
'[해지] 애플 인앱결제 이용권을 해지했는데 결제가 되었어요.',
'애플 인앱결제 이용권을 애플 내부 정책에따라 이용 기간 종료 최대 24시간 이전에 구독 취소(정기결제 해지)를 하지 않으시면 이용권이 자동으로 갱신됩니다.
애플 인앱결제 이용권 구독 취소(정기결제 해지)를 원하시는 경우 반드시 이용 기간 종료 24시간 이전까지 진행해주세요.
■ 애플 인앱결제 정기구독 해지 방법
1) 애플 앱스토어에서 해지하기
①  iOS 기기에서 [애플 앱스토어] APP 실행
② 우측 상단 [프로필 아이콘] 클릭
③ [구독] 버튼 클릭 후 구독 취소할 상품 선택
④ 구독 취소 완료
2) 기기 설정 메뉴에서 해지하기
① iOS 기기에서 [설정] APP 실행
② 최상단 [Apple ID] 메뉴 클릭
③ [구독] 버튼 클릭 후 구독 취소할 상품 선택
④ 구독 취소 완료
3) 티빙 APP에서 해지하기
① iOS 기기에서 티빙 APP 실행
② 우측 상단 [프로필 아이콘] 버튼 클릭
③ [이용권] 메뉴 클릭
④ 하단 유의사항의 [구독관리] 버튼 클릭하여 애플 앱 스토어 이동
⑤ 구독 취소할 상품 선택하여 해지 진행
결제 창 하단에 iOS 구독 유의사항이 기재 되어 있으니 확인 부탁드리며,
Apple 고객센터(080-333-4000)로 이용권 관련 문의 및 해지/환불 상담이 가능합니다.
※ 이용권 해지 시 다음 결제일부터 결제 연장되지 않으며, 이용권의 권한 만료일까지는 이용하실 수 있습니다.
※ 자동 결제 해지는 결제 예정일 최소 24시간 전에 해지 신청해야 합니다. 
※ 결제 예정일 전 24시간 이내에는 자동 결제를 해지해도 이용권이 결제될 수 있습니다.');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[환불] 네이버플러스 멤버십 이용권 환불하고 싶어요.',
'네이버플러스 멤버십으로 구매하신 티빙 이용권의 환불 방법 안내드립니다.
네이버플러스 멤버십으로 구매한 이용권의 경우, 고객님의 네이버 계정에 등록된 결제 수단으로 결제가 진행되며,
네이버 주식회사의 이용약관 정책에 따라서 티빙에 이용권 해지 및 환불 권한이 없는 점 양해 부탁드립니다.
번거로우시겠지만, 이용권 환불 안내가 필요하실 경우 네이버 고객센터(1588-3820) 또는 네이버 플러스 멤버십 스마트봇으로 문의 부탁드립니다.
더욱 자세한 문의는 [1:1 게시판 문의] 또는 [tving@cj.net]로 접수해 주시면 빠르게 도움 드리겠습니다.
※ 아래 [네이버플러스 멤버십] 버튼을 클릭하시면 네이버 서비스로 연결됩니다.
※ 아래 [1:1 게시판 문의하기] 버튼을 클릭하시면 티빙 서비스로 연결되며, 로그인 후 이용 가능합니다.');

insert into faq(inquirylist, subject, content) values('해지/환불', 
'[환불] 티빙에서 직접 결제한 이용권 환불하고 싶어요.', 
'티빙 직접결제로 구매하신 티빙 이용권의 환불 방법 안내드립니다.
■ 환불 요청 방법 안내
① 1:1 고객문의 게시판 > [환불/해지 신청] 카테고리 선택
② 환불 요청할 [상품명], [결제월] 및 상세 내용을 입력하여 환불 요청 등록
■ 환불 진행 절차 안내
① 티빙 고객센터에서 고객님 계정의 상품 구매 이력과 사용내역을 확인합니다.
② 사용 내역이 없는 경우, 고객센터에서 고객님이 구매하신 상품의 청약철회 및 결제취소를 진행합니다.
③ 결제취소된 상품은 고객님이 결제하신 수단으로 환불이 진행됩니다.
* 사용 내역이 없는 경우 당월 휴대폰과 신용카드 결제 건은 모두 결제 취소로 전액 환불됩니다. 
  단, 이전월 휴대폰 결제 건의 경우 통신사에서 결제 취소를 지원하지 않아 통장으로 환불됩니다.
* 신용카드, 간편결제 (네이버페이/카카오페이/토스페이) 결제 건인 경우 최대 당월과 이전월(최대 2개월) 결제분까지 결제취소가 가능합니다.
* 사용 내역이 있는 경우 사용 기간에 대하여 일할 차감 후 환불됩니다.
* 연간이용권 등 할인이 적용된 이용권은 정가 기준으로 일할 차감 후 환불됩니다.');


insert into faq(inquirylist, subject, content) values('서비스/이용', 
'[실시간TV] 정주행 채널은 유료인가요?', 
'정주행 채널은 무료 이용자도 시청이 가능합니다.');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[실시간TV] 무료 이용자도 실시간 LIVE 채널 시청할 수 있나요?', 
'유료 회원만 시청 가능했던 실시간TV 채널을 무료로 시청하실 수 있도록 전환하였습니다.
■ 전환 일자 : 2023년 12월 1일 금요일
■ 무료 채널 : tvN, JTBC 등 주요 실시간 LIVE 30개 채널
단, 4개 채널(OCN, OCN Movies, OCN Movies2, tvN SPORTS 채널)은 유료 서비스로 유지되며,
스포츠, KCON 등 이벤트성 채널은 무료 시청에 제한이 있을 수 있는 점 참고 부탁드립니다.
* 실시간TV 채널은 PC/모바일/태블릿 기기에서 이용하실 수 있습니다. (TV 앱 미제공)
* KBO는 2024년 3월 9일부터 4월 30일까지 한시적으로 무료 시청이 가능합니다. 
- 2024년 5월 1일부터 LIVE는 유료 채널로 서비스됩니다. (단, VOD 및 하이라이트는 무료 시청 가능)');

insert into faq(inquirylist, subject, content) values('서비스/이용', 
'[실시간TV] 타임머신 버튼 클릭 시, 이용권을 구독하라고 나와요.',
'무료 회원님의 경우 기본 재생 기능만 이용이 가능하며, 타임머신 기능 제공되지 않습니다.
타임머신 기능 이용을 원하신다면 티빙 이용권 구독 후 시청 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[서비스 이용] 무료 회원은 어떤 서비스를 이용할 수 있나요?',
'TVING 무료 회원은 일부 라이브 채널과 정주행 채널을 무료로 시청하실 수 있습니다.
라이브 채널 중 4개 채널(OCN, OCN Movies, OCN Movies2, tvN SPORTS 채널)은 유료 서비스로 유지되며,
스포츠, KCON 등 이벤트성 채널은 무료 시청에 제한이 있을 수 있는 점 참고 부탁드립니다.
* KBO는 2024년 3월 9일부터 4월 30일까지 한시적으로 무료 시청이 가능합니다. 
- 2024년 5월 1일부터 LIVE는 유료 채널로 서비스됩니다. (단, VOD 및 하이라이트는 무료 시청 가능)');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[이벤트] 연간 이용권 특별 할인 기간과 금액이 궁금해요.',
'연간 이용권 할인 이벤트를 안내드립니다.
※ 연간 이용권 할인 이벤트 안내
- 이벤트 기간 : 2023-12-01 ~ 2024-04-30
- 이벤트 가격
  : 베이직 연간 (94,800원 → 66,000원)
   스탠다드 연간 (130,800원 → 90,000원)
   프리미엄 연간 (166,800원 → 114,000원)
* 연간 이용권은 PC/모바일웹에서만 구매가 가능합니다. 
* 연간 이용권은 12월 1일 월간 이용권 신규 구독료 변경 이후에도 4월 30일까지 티빙 페스타 할인가와 동일한 가격으로 구매하실 수 있습니다.
* 작년 동일 기간에 구매하신 연간 이용권 정기결제 유지 시, 할인 가격으로 결제됩니다.  
* 할인 기간 동안 월정액 이용권을 연간 이용권으로 변경하셔도 할인 가격이 적용됩니다.  
* 할인 기간 동안 연간 이용권을 업/다운그레이드 하셔도 할인 가격이 적용됩니다.  
(단, 다운그레이드 시 사용하신 기간은 12개월 정가 기준 일할 차감됩니다.) ');

insert into faq(inquirylist, subject, content) values('서비스/이용', 
'[기타] 해외지역에서는 시청이 어렵다는 메시지와 함께 시청이 되지 않습니다.',
'티빙 서비스는 국내에서만 이용 가능하며, 
국내에서 시청 중이지만 해외 접속으로 메시지가 발생하는 경우 아래와 같이 확인 부탁드립니다.
① VPN 프로그램을 사용 중이라면 OFF 하여 다시 확인허가
② [IP 대역 확인하기] 버튼으로 한국인터넷진흥원 홈페이지에서 사용 중인 IP 국내 IP 여부 확인하기
- URL : http://whois.nic.or.kr/
③ 해외 IP로 확인되는 경우, 이용하고 계신 통신사로 문의하여 [IP 재할당] 필요
국내 IP인 것이 확인되시거나, 이용 중인 인터넷 통신사에서 국내 IP대역으로 재할당 받으신 경우 정상 이용이 가능하십니다.
위 조치 이후에도 동일 현상이 반복되시는 경우, [IP주소] 기재하여 [1:1 게시판 문의] 또는 [tving@cj.net]로 접수를 부탁드립니다.');

insert into faq(inquirylist, subject, content) values('서비스/이용',
'[자막] 크롬캐스트나 에어플레이에서도 배리어프리 자막 이용이 가능한가요?',
'버튼 배리어프리 자막 서비스가 제공되는 콘텐츠 시청 시, 크롬캐스트와 에이플레이 상태에서도 배리어프리 자막 서비스 이용이 가능합니다. 단, 자막 크기 설정은 지원하지 않습니다.');

select* from faq;

select* from payment where userid='one' order by pmseq desc;




ALTER TABLE `customerinquiry` ADD CONSTRAINT `PK_CUSTOMERINQUIRY` PRIMARY KEY (
	`ciseq`
);

insert into notice(userid, title, content, noticeyn) values('hong1', '제목입니다.', '내용입니다', 'N');
insert into notice(userid, title, content, noticeyn) values('hong2', '제목입니다.', '내용입니다', 'Y');
insert into notice(userid, title, content) values('hong3', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong4', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong5', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong6', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong7', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong8', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong9', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong10', '제목입니다.', '내용입니다');
insert into notice(userid, title, content) values('hong11', '제목입니다.', '내용입니다');


select* from member;
select* from notice;

select* from customerinquiry;

insert into customerinquiry(name, email, phone, inquiryList, devicephone, devicemodelname, runenvironment, runtime1, runtime2, runcontent, inquirytitle, inquirycontent)  values('hong1', 'syh6917@naver.com', '010-1111-1111', '회원/로그인', 'PC', '윈도우11', 'PC', '03:00', '07:00', '드라마', '안녕하세요', '드라마 관련 질문드립니다.');
insert into customerinquiry(name, email, phone, inquiryList, devicephone, devicemodelname, runenvironment, runtime1, runtime2, runcontent, inquirytitle, inquirycontent)  values('hong1', 'syh6917@naver.com', '010-1111-1111', '회원/로그인', 'PC', '윈도우11', 'PC', '03:00', '07:00', '드라마', '안녕하세요', '드라마 관련 질문드립니다.');
insert into customerinquiry(name, email, phone, inquiryList, devicephone, devicemodelname, runenvironment, runtime1, runtime2, runcontent, inquirytitle, inquirycontent)  values('hong1', 'syh6917@naver.com', '010-1111-1111', '회원/로그인', 'PC', '윈도우11', 'PC', '03:00', '07:00', '드라마', '안녕하세요', '드라마 관련 질문드립니다.');

select* from member;



-- 신상품 View 생성

create or replace view new_pro_view as

select pseq, name, price2, image from product where useyn='Y' order by indate desc limit 4;

​

select* from new_pro_view;

​

-- 베스트 상품 view 생성

create or replace view best_pro_view as

select pseq, name, price2, image from product where bestyn='Y' order by indate desc limit 4;
