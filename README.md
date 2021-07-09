# 0. 안내

`본 README.md 파일은 팀원 개개인이 모두 기존 repo에서 fork한뒤 각자의 포트폴리오 사용 목적으로 제작`

`공용이 아닌 김윤수 전용 READMD.md임을 안내드립니다`

# 1. PREVIEW & 개요

[KH]스마트 콘텐츠 융합 응용SW 엔지니어 양성과정 중 파이널프로젝트 이며

"와디즈 " 라는사이트 벤치마킹하여 구현한 사이트입니다.

Spring Legacy Project로 진행하였으며 Spring의 구조를 전반적으로 이해하려

노력하며 진행하였습니다.

### `배포한 사이트 주소 입니다.` [사이트이동](http://interact-funding.kro.kr/)

### `유튜브 동영상 보기` [보러가기](https://youtu.be/WEz3ak2d11I)

### `프로젝트 관련 ppt다운로드` [링크](https://kimyunsu-temp.s3.ap-northeast-2.amazonaws.com/IF%ED%8C%8C%EC%9D%B4%EB%84%90.pptx)

## 2. 프로젝트 요구사항

### 반드시 Spring Boot가 아닌 Spring Legacy를 활용하여 구현하여

### 프레임워크를 활용하는데 있어 기본적인 동작원리를 이해하고 활용 할 수 있도록 설계 할것

## 3.역할 및 담당기능

### 김윤수

`팀장을 맡아 진행하였으며 프로젝트 진행을 전체적으로 이끌고 주도함`

`공용페이지 / 회원관련 페이지 모두 전담하여 구축`

`1. 프로젝트 기반마련`

Spring의 환경설정을 모두 도맡아하여 팀원들은 편하게 코딩을 이어나갈수있도록 세팅하고

깃허브에 oraganization을 만들어 원격저장소를 만들고 contributor로 참여시켜 GitHub를 활용

협업을 진행 할 수 있도록 협업의 기반을 마련함.

특히 공통으로 작업하는 파일 같은 경우 깃을 사용할때 충돌이 발생하지 않도록 각각의 이름으로

주석처리를 하여 해당하는 본인의 주석영역에만 소스코드를 작성할수있게끔 하였음

`2. source Code Merge`

일단 현 프로젝트의 경우 원격저장소에 각자의 브랜치를 생성하여 본인이 관리하는 브랜치에 push하며

master브랜치에서 pull받는 식으로 진행하였는데, 각각의 브랜치에서 master로 pull request를 하면

소스코드를 검수하고 master 브랜치로 merge 하는 역할을 하였습니다.

`3. 필요사항 분석 및 DB구축`

DB설계를 주도적으로 하여 전체적인 구조와 틀을 잡고 AWS-EC2를 활용하여 공용 DB를 생성하여

팀원들이 접속을 할 수 있게끔 구현함

`4. 로그인`

로그인은 기본적으로 Spring Security를 활용하였고 소셜로그인 기능을 추가하여

remember-me를 활용한 로그인 유지 기능도 구현하며 Authority에 관한 DB테이블을 생성해

서버단에서 SimpleGrantedAuthority객체를 활용하였음.

카카오 API를 활용한 OAUTH 2.0을 활용 소셜로그인의 흐름에 대해 공부하고 이해함

`5. 회원가입`

자체 회원가입과 소셜 로그인 회원을 구분하기 위해 DB컬럼에 Platform을 추가 하였으며

이를 토대로 회원가입 버튼을 눌러서 가입하는 경우는 자체회원으로 등록하며

소셜로그인시 해당 소셜 로그인 이메일정보에 해당하는 값과 platform=kakao 인 레코드가

조회되지 않는다면 소셜전용 회원가입으로 이동 할 수 있게 하였다.

추가적으로 자체회원가입을 진핸하는 경우에는 이메일인증을 거치게 되는데 Java_mail을 활용함

`6. 비밀번호 재발급`

비밀번호의 경우 사용자의 이메일과 이름을 제출받으면 새로운 비밀번호를 변경할 수 있는

링크를 해당 이메일로 전송한다. 해당 이메일의 비밀번호를 변경 할 수 있는 링크를 클릭시

비밀번호를 변경 할 수 잇는 페이지로 연결 되며 해당 페이지에서 비밀번호를 변경 할 수 있고

링크를 통해 비밀번호를 변경하면 다시는 그 링크를 이용 할 수 없게 설계 하였다.

`7. 헤더부분`

헤더부분은 모든 페이지에서 include하여 사용 하기 때문에 이를 활용하여 공용으로

사용하면 좋을만한 기능인 쪽지 보내기 기능과 모달창을 구현하였다.

팀원들이 내가 정해놓은 모달을 호출하기만 하면 손쉽게 해당 유저에게 쪽지를 보낼수있고

기본적인 라이브러리, JS 등등 공통된 사항을 최적화 하는것에 초점을 맞춰 작업하였다.

`8. 마이페이지`

마이페이지는 좌측에는 간단하게 로그인과 관리자권한이 있는 경우 관리페이지로 넘어갈수있는 버튼이 존재하고

회원의 포인트와 내역을 조회할수있는 기능, 펀딩에 참여해 신청한 리워드를 관리 하거나

참여한 펀딩의 갯수가 몇개인지, 또는 생성한 펀딩을 관리 할 수 있는 페이지로 이동 할 수 있고

쿠폰을 입력하면 해당 쿠폰에 맞는 포인트를 충전 할 수있는 쿠폰 모달 영역,

또는 포인트를 실제 결제 시스템과 연결하여 결제한 금액만큼 포인트를 충전할 수 있는 기능을 구현하였고

하단에는 좋아요를 눌렀던 펀딩의 리스트를 보여준다.

`9. 배포및 도메인 연결`

[이전 프로젝트](http://meetpeople.kro.kr) 에서 AWS-EC2 환경에서 Tomcat으로 배포했던 경험을 바탕으로

팀원에게 방법을 공유해 원활하게 진행 될 수 있도록 알려주며 진행함

`10. 팀원의 막힌 부분 해결`

`인덱스 페이지 - 최근 살펴본 펀딩`

DB와 Gson라이브러리를 활용하여 로그인 상태에서 펀딩 상세페이지를 조회할때 int[]로 펀딩 번호를 최대

4개까지 보관하여 Gson을 통해 JSon으로 변환하여 DB에 저장한다. 그 데이터를 활용하여

인덱스 페이지에 최근 살펴본 펀딩이라는 목록을 동적 생성해준다.

`펀딩 세부페이지 - 좋아요, 실시간대화(소켓 Stomp통신)`

좋아요의 경우 로그인을 한 사용자만 이용 가능하며 처음 누르는 경우 좋아요 테이블에 status컬럼 Y로 등록

다시 누를경우 status컬럼이 N으로 변경되어 기록을 남기며 또다시 누를경우 Y로 업데이트 한다.

소켓통신의 경우 Stomp.config 클래스와 컨트롤러를 알려주며 진행함.

`펀딩 등록 - 전체적인 메커니즘`

펀딩등록의 경우 로그인한 사용자만 등록을 할 수가 있는데 중간에 작성을 보류하고 추후 다시 작성을 할수있게

최초 펀딩 생성시 status컬럼 N으로 not null 제약 조건에 해당하는 내용만 작성을 하고 DB에 등록하며

나머지 작성하는 내용은 사용자가 입력할때마다 해당부분은 update하는 방식으로 진행하여

원하는 계획 방향으로 진행되게 하였다.

`기타 - 팀원들이 막히는 부분 원격, 개념을 알려주는식으로 최대한 해결해주려고 노력함`

## 4. 개발 목표 및 설계 주안점

1.Spring Framework, MVC 패턴, JQuery의 활용 능력 습득

2.Bootstrap Framework 프레임워크 활용능력 습득

3.Gson 사용법 활용 능력 습득

4.JSTL 동적변수를 활용능력습득

## 5. 핵심 구현 기술 설명

### Legacy Spring MVC Project를 기반으로 OracleDB와 Mybatis를 활용하였고

### Lombok과 Log4j, SpringSecurity, Oauth2.0, 이메일발송 라이브러리 기술을 활용 하였으며

### JavaScript라이브러리로는 import라는 결제라이브러리와 kakaoAuth

### 협업도구로 GitHub를 활용하여 Organization 에서 repo를 하나 생성하여 협업을 진행

## 6. 구현 기간

### - 프로젝트 기획 기간

2021.06.03~2021.06.10

### - 프로젝트 구현 기간

2021.06.03~2021.07.08

## 7. 사용 언어 및 도구

O/S : Windows 10

Server : Tomcat 9.0

DBMS : Oracle 11g

개발 언어 : JAVA, JSP, JavaScript, SQL, HTML5, CSS3

개발 툴 : STS4, SQL Developer, Visual Studio Code

Framework/library

Spring, MyBatis, Bootstrap, CoolSMS , Mail-1.4.7, ojdbc6, summerNote, ImPort, taglibs, spring-webmvc

카카오 지도/로컬, Scheduler (자동 알림), 카카오 OAUTH2.0

## 8.프로젝트 참여소감

팀원 대부분 열심히 참여해줘서 너무 고마웠고 즐겁게 프로젝트를 진행하여 좋았다.

특히 이전 프로젝트에서는 기간도 짧았고 팀원 대부분 Git을 제대로 사용 하는방법을 몰라서

모든 자료를 취합하여 개인 repo에 올려서 힘들었지만 이번 파이널 프로젝트에서는

Git을 활용하는 방법을 스터디 할 시간이 충분하여 공용 repo를 생성한뒤

개개인의 branch를 생성하여 push할땐 각자의 branch에 올리고 pull을 할땐 master에서 pull하는 방식으로

협업다운 협업을 할 수 있어서 좋았다.

소셜로그인 관련해서는 대부분 인터넷의 예제가 Spring boot기반이여서 legacy로 진행하는 이번 프로젝트의 경우

설정을 세팅하는데 조금 오래 걸렸고 수동으로 해줬다는게 안타까웠다.

하지만 Servlet 환경에서 진행했던 이전 프로젝트에 비해 Spring환경은 말그대로 봄이 온듯 비교적 너무 좋았다.

## 9.별첨

### `협업을 진행한 원본 REPO` [KH-IF](https://github.com/KH-IF/interact_funding)

### `프로젝트 발표자료 모음 폴더` [이동](./final)

# Contributors

[<img src="https://user-images.githubusercontent.com/62824389/124744204-7ac8de80-df59-11eb-86ff-28b65ca19886.jpg" width="150">](https://github.com/kimdia200)
[<img src="https://user-images.githubusercontent.com/62824389/124744203-7ac8de80-df59-11eb-8ca8-db42233b9833.jpg" width="120">](https://github.com/hohyuncheon)
[<img src="https://user-images.githubusercontent.com/62824389/124744193-78668480-df59-11eb-9eae-8e0c67a20689.jpg" width="120">](https://github.com/KIMJOOYEON97)
[<img src="https://user-images.githubusercontent.com/62824389/124744198-7997b180-df59-11eb-9aab-48a4b4939e28.jpg" width="120">](https://github.com/dygksqkr12)
[<img src="https://user-images.githubusercontent.com/62824389/124744201-7a304800-df59-11eb-89ec-e78f9cc84800.jpg" width="120">](https://github.com/onreverse01)
[<img src="https://user-images.githubusercontent.com/62824389/124744200-7a304800-df59-11eb-9ec3-537d0ab215ac.jpg" width="120">](https://github.com/rlwi440)
