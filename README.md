# 🏕 RisingTest

**iOS 아이디어스 클론 코딩 🧡**

> **프로젝트 기간 : 21.07.31 ~ 21.08.13**  
> **라이징캠프 2주간 클라이언트/서버 협업 프로젝트 진행**



## 📌 실행 영상

 [![iOS openAPI를 활용한 영화 예매 앱 만들기](https://img.youtube.com/vi/vE-tcEF3iuQ/0.jpg)](https://youtu.be/vE-tcEF3iuQ?t=0s)

👆🏻 👆🏻 👆🏻   `실행 영상 유튜브 링크`👆🏻 👆🏻 👆🏻  <br><br>


## 📌 개발 범위
![스크린샷 2022-01-25 오후 3 34 34](https://user-images.githubusercontent.com/77331348/150923756-87d6a3cb-1c36-4002-9c9c-bb77c52d7953.png)
```
1. 회원가입

2. 로그인(기존 회원, 카카오, 네이버)

3. 작품 투데이/실시간/NEW 탭별 조회

4. 작품 상세 조회

5. 작품 옵션 조회/선택 

6. 즉시구매 장바구니(단일 상품 구매)

7. 장바구니

8. 주문 결제

9. 클래스, 검색, 카테고리, 내 정보 탭 

10. 주문 배송 조회
```

## 📌 사용한 API

✔️ 총 13개
```
- 회원가입 POST API

- 로그인 POST API

- 작품 홈화면 탭별 조회 GET API

- 작품 상세페이지 조회 GET API

- 작품 옵션 조회 GET API

- 장바구니 작품 등록 POST API

- 장바구니 조회 GET API

- 즉시구매 주문 생성 POST API

- 즉시구매 장바구니 조회 GET API

- 결제페이지 결제 PATCH API

- 결제페이지 조회 GET API

- 장바구니 주문 생성 POST API

- 카카오 로그인 POST API
```
## 📌 개발 일지
<details markdown="1">
<summary>2021-07-31 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-07-31 오후 11 45 27](https://user-images.githubusercontent.com/77331348/127743692-0f1292b7-1c8f-474d-b440-977d22718a2b.png)
![스크린샷 2021-07-31 오후 11 52 40](https://user-images.githubusercontent.com/77331348/127743781-5898e014-9acf-438b-8b95-9f0740ec8769.png)

#### 1. 기획서 제출 - 100%


#### 2. 로그인 페이지 - 50%

+ UI 구성

+ (카카오톡/네이버 로그인 추가 예정 👊) 


#### 3. 회원가입 페이지 - 100%

+ UI 구성

+ 약관 동의 체크박스 구현 - 전체/개별 동의

+ 키보드 delegate 활용 - return 클릭 시, 키보드 내리기
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-01 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-01 오후 3 05 39](https://user-images.githubusercontent.com/77331348/127772808-140b4b25-2fb6-4ec4-8bad-81ae1eff0c7a.png)
![스크린샷 2021-08-01 오후 3 04 56](https://user-images.githubusercontent.com/77331348/127772805-010a8a34-69ea-40ca-92a1-5d1b4f03d733.png)

#### 1. 카카오 로그인 - 100%

#### 2. 네이비 로그인 - 100%

![스크린샷 2021-08-01 오후 10 29 45](https://user-images.githubusercontent.com/77331348/127772706-02ca0430-860f-4359-9225-86e5f92ae6ac.png)
![스크린샷 2021-08-01 오후 10 28 08](https://user-images.githubusercontent.com/77331348/127772713-90d85a85-4713-4e18-96cf-103224b44127.png)

#### 3. 이메일로 로그인 페이지 - 100%

#### 4. 하단/상단 탭바 및 전반적인 UI 구성 - 100%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-02 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-02 오후 11 20 30](https://user-images.githubusercontent.com/77331348/127877652-2fde8aca-a0b4-40c0-afd1-3eed6ca508c0.png)
![스크린샷 2021-08-02 오후 11 21 00](https://user-images.githubusercontent.com/77331348/127877671-95a77346-d9ba-4807-b986-73ef31fc2781.png)

#### 1. 로그인 UI 다듬기 - 100%

#### 2. 유효성 검사, 알림창 - 100%

#### 3. 회원가입 POST API - 100%

![스크린샷 2021-08-02 오후 11 27 30](https://user-images.githubusercontent.com/77331348/127877685-5a17a8f3-c2cd-4e5d-97ea-e502191743e5.png)
![스크린샷 2021-08-02 오후 11 18 12](https://user-images.githubusercontent.com/77331348/127877681-4ef3116b-610c-4e52-bb81-c09380f68c77.png)

#### 4. 로그인 POST API - 100%

#### 5. 작품 -> 투데이 페이지 - 30%

+ 광고 배너 구현 

+ 이벤트 스크롤 구현 

+ 광고/이벤트 클릭 시, 디테일 뷰와 연결 - 몇 번째 값인지 넘겨주기
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-03 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-03 오후 11 27 47](https://user-images.githubusercontent.com/77331348/128033151-355e4d09-dd4b-4612-b8c1-6340d094a9b0.png)

#### 1. 작품 -> 투데이 페이지 - 50%

+ 오늘의 작품 셀 구현 -> 앞으로 재사용 가능

![스크린샷 2021-08-03 오후 11 23 47](https://user-images.githubusercontent.com/77331348/128032791-cdc64567-3603-4375-a782-fb70bf8cfa12.png)
![스크린샷 2021-08-03 오후 11 23 58](https://user-images.githubusercontent.com/77331348/128032776-2e15fb00-746b-49d5-a0bd-da2d48e67b30.png)

#### 2. 작품 -> 상세 페이지 - 80%

+ 커스텀 내비게이션 바 - 100%

+ 하단 뷰 구성 - 100%

+ 상세 이미지, 요약 정보, 배송, 상세 정보 셀 구현 - 100%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-04 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-04 오후 11 29 00](https://user-images.githubusercontent.com/77331348/128199245-1b4a46cf-2c8e-4564-b385-16531dce9046.png)
![스크린샷 2021-08-04 오후 11 28 40](https://user-images.githubusercontent.com/77331348/128199259-55b58580-d488-428a-95c4-8f2d6fac26d4.png)

#### 1. 작품 -> 상세 페이지 - 90%

+ 작품 상세 정보 셀 - 텍스트 양에 따라 자동 높이 조절 - 100%

+ 구매 후기 셀 - 100%

+ 댓글 셀 - 사진 O/X 여부에 따라 두가지로 구현 - 100%

+ 작가 정보 셀 - 100%

+ 키워드 셀 (라이브러리 사용 x, 콜렉션 뷰 사용)- 100%

+ 작가 정보 셀 - 100%

+ 판매중인 다른 작품들, 이 작품과 함께 본 작품, 인기 작품 셀 - 50%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-05 진행 상황</summary>

### ⭐️ 성취도

<img width="340" alt="스크린샷 2021-08-05 오후 11 21 14" src="https://user-images.githubusercontent.com/77331348/128367213-ac38caa5-c13a-46db-a14c-b49c64651cca.png"><img width="341" alt="스크린샷 2021-08-05 오후 11 21 27" src="https://user-images.githubusercontent.com/77331348/128367222-5d19dd5a-6853-40b4-aae8-abee25344313.png">

<img width="339" alt="스크린샷 2021-08-05 오후 11 21 41" src="https://user-images.githubusercontent.com/77331348/128367324-7f0f9552-84fd-43e6-b379-25acec94ae92.png"><img width="352" alt="스크린샷 2021-08-05 오후 11 24 50" src="https://user-images.githubusercontent.com/77331348/128367347-c946501a-7b4a-4454-8fed-366ef8956de3.png">

#### 1. 작품 -> 상세 페이지 GET API - 90%

+ 작품 사진 리스트 - 100%

+ 상단 작품/하단 작가 정보 - 100%

+ 작품 정보제공 고시 - 100%

+ 리뷰 정보 - 100%

+ 리뷰별 주문 작품 - 100%

+ 작품 키워드 - 100%

+ 작품 댓글 - 100%

#### 2. 서버 브린님과 2차 회의

✔️  개발 우선순위 변경

- 변경 전) 작가 정보 ➡️ 작품 장바구니 ➡️ 작품 주문 결제/배송
- 변경 후) 작품 단일 구매 ➡️ 작품 장바구니 ➡️ 작품 주문 결제/배송 ➡️ 작가정보

✔️  개발 범위 정하기

- 홈화면: 배너, 이벤트, 내가 본 작품의 연관작품, 오늘의 작품, 오늘의 취미(클래스 이후 구현, 우선 UI만), 할인 상품, 실시간 구매 
- 구매 옵션 넘겨줄 값 정하기
     서버) 옵션별 정보, 옵션별 가격
     클라이언트) 옵션 index, 총수량, 총 가격
- 단일 구매 넘겨줄 값 정하기: 작품별 정보, 총 가격  
- 찜, 댓글, 배송지관련 api 논의하기
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-06 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-06 오후 10 39 26](https://user-images.githubusercontent.com/77331348/128519424-79edf5f6-f6ce-4366-a30b-255766f82bf8.png)
![스크린샷 2021-08-06 오후 10 39 43](https://user-images.githubusercontent.com/77331348/128519411-3e905500-f745-4883-8bbb-abdf32a79e4c.png)

#### 1. 작품 -> 투데이 페이지 GET API - 90%

#### 2. 작품 -> 투데이 페이지 타이머 - 100%

+ 광고 배너 2초에 한번 자동 스크롤 - 100%

+ 할인 마감 타이머  - 100%

![스크린샷 2021-08-06 오후 10 40 08](https://user-images.githubusercontent.com/77331348/128519417-02937193-f7d8-4f05-abbe-e9261779558d.png)
![스크린샷 2021-08-06 오후 10 40 16](https://user-images.githubusercontent.com/77331348/128519427-19013e95-43e2-4e50-82f8-d7011953d3f1.png)

#### 3. 작품 -> 상세 페이지 GET API - 100%

+ 판매중인 다른 작품들 - 100%

+ 이 작품과 함께 본 작품 - 100%

+ 인기 작품 - 100%

#### 4. 작품 -> 옵션 선택 UI - 50%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-07 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-07 오후 11 25 35](https://user-images.githubusercontent.com/77331348/128603470-79121ef9-1f11-4b53-b62b-1e65f0a7f3d6.png)
![스크린샷 2021-08-07 오후 11 25 48](https://user-images.githubusercontent.com/77331348/128603474-3c5798e5-730f-4a8f-ae9f-98b14db1869d.png)

![스크린샷 2021-08-07 오후 11 26 00](https://user-images.githubusercontent.com/77331348/128603477-6b186b9e-af45-4e29-a263-8aed39c8b939.png)
![스크린샷 2021-08-07 오후 11 25 17](https://user-images.githubusercontent.com/77331348/128603480-ed20a319-f6d0-45f9-9c53-2397f01c8d95.png)

#### 1. 작품 -> 옵션 선택 UI - 100%

#### 2. 작품 -> 옵션 선택 GET API - 100%

#### 3. 작품 -> 단일 구매 장바구니 UI - 100%

![스크린샷 2021-08-07 오후 11 26 20](https://user-images.githubusercontent.com/77331348/128603493-c5d82f31-fd5f-47fd-89f1-20fb1e81d53d.png)
![스크린샷 2021-08-07 오후 11 26 31](https://user-images.githubusercontent.com/77331348/128603495-c3faef4a-af32-4010-a1f3-f009bf56df99.png)

#### 4. 작품 -> 실시간, NEW 페이지 UI - 100%

+ 별점별 해당 별점 이미지 출력 - 100%

#### 5. 작품 -> 실시간, NEW 페이지 GET API - 100%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-08 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-08 오후 11 21 33](https://user-images.githubusercontent.com/77331348/128636012-f0a88a9a-e8b0-4051-8c9f-79f0374c6fa3.png)
![스크린샷 2021-08-08 오후 11 22 00](https://user-images.githubusercontent.com/77331348/128636017-bd9c761d-f625-4812-b64c-830694198f03.png)

#### 1. 작품 -> 주문/결제 페이지 UI - 100%

#### 2. 작품 -> 즉시구매 장바구니 담기 POST API - 50%

![스크린샷 2021-08-08 오후 11 22 50](https://user-images.githubusercontent.com/77331348/128636019-f189aca8-c48b-45fb-bef8-328f50e54fbc.png)

#### 3. 내 정보 페이지 UI - 80%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-09 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-09 오후 10 44 19](https://user-images.githubusercontent.com/77331348/128722754-c18819ae-5744-4cc5-a778-0a6faa19a47b.png)
![스크린샷 2021-08-09 오후 10 44 38](https://user-images.githubusercontent.com/77331348/128722760-5ea06dc5-91d6-4f54-8844-fe51e2b0fcb1.png)

#### 1. 검색 페이지 UI - 100%

#### 2. 카테고리 -> 작품 페이지 UI - 100%

![스크린샷 2021-08-09 오후 10 44 49](https://user-images.githubusercontent.com/77331348/128722763-83fee9e9-5324-4a6a-ba9a-4e3cc9c8b491.png)
![스크린샷 2021-08-09 오후 10 45 27](https://user-images.githubusercontent.com/77331348/128722744-6cf1753c-1981-4401-9c39-71d0f9a12448.png)

#### 3. 카테고리 -> 클래스 페이지 UI - 100%

+ 테이블뷰 접기/펴기 - 100%

#### 4. 작품 -> 즉시구매 장바구니 담기 POST API - 100%

#### 5. 2차 피드백 및 서버 브린님과 3차 회의 - 100%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-10 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-10 오후 10 25 14](https://user-images.githubusercontent.com/77331348/128880526-ff6cffd3-7141-461a-b19e-949e29adb801.png)
![스크린샷 2021-08-10 오후 10 25 24](https://user-images.githubusercontent.com/77331348/128880505-dd8b455d-86e0-4a50-8f73-ff48dd4c920f.png)

#### 1. 클래스 -> 온라인 페이지 UI - 100%

+ 광고 배너 2초 자동 스크롤

#### 2. 클래스 -> 오프라인 페이지 UI - 100%

![스크린샷 2021-08-10 오후 5 52 45](https://user-images.githubusercontent.com/77331348/128880530-413163e7-1d9a-42d6-b6f3-35dfd6f10cd6.png)

#### 3. 작품 -> 즉시 구매 장바구니 조회 GET API - 100%

+ UI와 연결 완료

#### 4. 작품 -> 결제 페이지 조회 GET API - 100%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-11 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-11 오후 11 43 00](https://user-images.githubusercontent.com/77331348/129050801-e7068895-ef1f-443d-98c7-2218d8a9ace5.png)
![스크린샷 2021-08-11 오후 11 44 13](https://user-images.githubusercontent.com/77331348/129050821-9e886e64-0b3a-4dd5-b3a5-526a72e0c36b.png)

![스크린샷 2021-08-11 오후 11 44 44](https://user-images.githubusercontent.com/77331348/129050829-10db1305-0287-4c29-a002-b8227951638a.png)
![스크린샷 2021-08-11 오후 11 45 19](https://user-images.githubusercontent.com/77331348/129050833-07921a05-c8db-4bff-92d1-2ef917015bdc.png)

#### 1. 작품 -> 결제 PATCH API - 100%

#### 2. 작품 -> 장바구니 작품 등록 POST API - 100%

#### 3. 작품 -> 장바구니 조회 GET API - 100%

#### 4. 작품 -> 장바구니 주문 생성 POST API - 100%

+ 1,2,3,4 모두 UI와 연결 완료

#### 5. 로그인, 홈 UI 수정 - 100%
<hr><br>
</details>
<details markdown="1">
<summary>2021-08-12 진행 상황</summary>

### ⭐️ 성취도

![스크린샷 2021-08-12 오후 11 32 49](https://user-images.githubusercontent.com/77331348/129216424-b324dfde-61b8-4444-a2cb-60f7b6895eab.png)
![스크린샷 2021-08-12 오후 11 33 11](https://user-images.githubusercontent.com/77331348/129216428-00e73c3d-28fe-467c-b52e-b7d4a287f8af.png)

#### 1. 내 정보 -> 주문 배송 페이지 UI - 100%

#### 2. 내 정보 -> 유저 주문 배송 GET API - 100%

![스크린샷 2021-08-12 오후 11 38 25](https://user-images.githubusercontent.com/77331348/129216407-14db44a2-4605-4492-a68b-53846c3c80fe.png)
![스크린샷 2021-08-12 오후 11 37 59](https://user-images.githubusercontent.com/77331348/129216429-9e8bc248-8821-42fe-a0de-53362bd2b250.png)

#### 3. 작품 -> 광고 배너, 이벤트 상세 페이지 UI - 100%

#### 4. 작품 -> 장바구니 UI 즉시구매 장비구니와 구별 - 100%

![스크린샷 2021-08-12 오후 11 33 41](https://user-images.githubusercontent.com/77331348/129216420-8785081d-f570-46e6-9b71-25bf0be51a08.png)
![스크린샷 2021-08-12 오후 11 34 02](https://user-images.githubusercontent.com/77331348/129216418-c5ec4b6b-1f81-472a-bb4c-b9950f605f19.png)

#### 5. 작품 -> 실시간, NEW 페이지 UI 수정 - 100%
+ 찜 하기, 이미지만 보기 구현
</details>

