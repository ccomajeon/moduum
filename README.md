# modumjeon
지역화폐 가이드라인

## 개요
최근 코로나로 인해 정부에서 지원금을 지역화폐로 지원하여 사용량이 급증하고 있고
지역의 자본 중앙 흡수를 억제하고 지역 중심 실물 가치 화폐로 소비생활 습관을 바꿀 수 있는 장점이 있으므로
지역 소비 활성화 대책 방법 중 하나라고 생각한다.

## 주요 기능
<ul>
  <li>지도를 클러스터를 이용하여 나타내고 리스트로 출력</li>
  <li>지역화폐 사용량 및 충전량, 연령별 사용빈도 등 분석 및 예측</li>
</ul>

# 모둠전이란?
## 지역 화폐와 장점
![슬라이드7](https://user-images.githubusercontent.com/64400666/91744267-301d5e00-ebf4-11ea-9067-cdb06564f996.PNG)

## 기획의도
![슬라이드8](https://user-images.githubusercontent.com/64400666/91744361-59d68500-ebf4-11ea-9aa2-7504af874b98.PNG)

## 개발 도구
![슬라이드9](https://user-images.githubusercontent.com/64400666/91744396-6955ce00-ebf4-11ea-8480-305924e7f832.PNG)

## 프로젝트에서의 담당 업무

### 1. 지역화폐 사용량 및 충전량, 연령별 사용빈도 등 분석 및 예측
#### 소스코드https://github.com/ccomajeon/ModumMuchine.git
#### (1)데이터 수집
지역화폐API를 받아와 DataBase에 삽입

#### (2)데이터 전처리
DataBase에 삽입된 API를 MyBatis를 사용하며 쿼리문으로 먼저 전처리
Pandas를 사용하여 이상치 제거 및 데이터 인코딩<br>
<img src="https://user-images.githubusercontent.com/64400738/90994611-40ca4480-e5f4-11ea-9881-7861a70af1c0.png" width="300" height="300">

#### (3)데이터 셋 분리 / 모델 학습 및 검증
Train_Test_split을 사용하여 데이터 셋을 나눈 후 Sklearn의 4가지 알고리즘 수행<br>
<img src="https://user-images.githubusercontent.com/64400738/90994612-41fb7180-e5f4-11ea-85b2-377bc4c1ad65.png" width="300" height="300">

#### (4)예측 수행
가장 정확도가 높은 linear regression을 사용하여 Predict()수행<br>
<img src="https://user-images.githubusercontent.com/64400738/90994613-42940800-e5f4-11ea-9e92-b3ed74a2db1f.png" width="300" height="300">

#### (5)예측 값 DB에 삽입
#### (6)Google-Chart
MyBatis를 사용하여 쿼리를 불러온 후 JSTL로 Google-Chart에 값을 넣어 준 후 반응형 그래프로 출력
<p align="left">
  <img src="https://user-images.githubusercontent.com/64400738/90995631-77ee2500-e5f7-11ea-955c-6246b2112fdb.png" width="400" height="200">
  <img src="https://user-images.githubusercontent.com/64400738/90995632-7886bb80-e5f7-11ea-85af-b3cdbb841b8a.png" width="400" height="200">
</p>

### 2. 뉴스 크롤링
#### (1)흐름도
<img src="https://user-images.githubusercontent.com/64400738/90969839-4b270880-e538-11ea-80d7-d1d6003e2b46.png" width="400" height="300">

#### (2)게시판으로 띄어준다.

### 3. 실시간 채팅창
### 소스코드https://github.com/ccomajeon/chatting.git
<ul>
  <li>Node.js를 서버로 웹을 클라이언트로 구현</li>
  <li>sokect.io를 사용하여 실시간으로 데이터 송/수신 구현</li>
  <li>connection 발생 시 User의 key를 불러오고 count는 1씩증가</li>
  <li>User 닉네임 변경가능</li>
  <li>disconnection 발생 시 User 종료 발생</li>
</ul>


### 4. Spring 프레임워크 전반적 구현

#### (1) MVC 패턴 구현
<ul>
  <li>MODEL : 비즈니스 로직을 처리하도록 구현</li>
  <li>VIEW : APACH TOMCAT을 서버로 사용하여 JSP 구현</li>
  <li>Controller : 위의 업무의 데이터를 송/수신 하기위해 Controller, Service, Dao, Dto구현</li>
</ul>

#### (2) MAVEN
필요한 라이브러리 사용

#### (3) MyBatis
필요한 쿼리문을 MyBatis로 사용할 수 있도록 구현

## 결과물
<img src="https://user-images.githubusercontent.com/64400738/90996336-7160ad00-e5f9-11ea-9aa1-f3998392fbd9.png" width="500" height="300">

# 기대 효과
![슬라이드25](https://user-images.githubusercontent.com/64400666/91744830-057fd500-ebf5-11ea-9b89-055d263c2c28.PNG)
