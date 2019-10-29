# Formatting

>	## Formatting 이란?
>
>	* JSTL 태그 라이브러리 중, ``형식``, ``날짜``, ``시간``에 대한 처리 기능을 제공한다.
>
>	* 살펴볼 기능
>
>		* 다국어 지원 구현하기
>
>		* 숫자, 날짜
>
>		* 타임존
>
>	* 라이브러리 추가
>
>		```java
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>		```

---

## 다국어 지원 구현 (Properties 파일 이용)

>	### ``.properties``파일 작성하기
>
>	* 국적에 따른 ``.properties``파일을 작성하여, 해당되는 언어 제공
>
>	* ``.property``파일은 유니코드로 작성해야 한다.
>
>	* eclipes의 유니코드 작성 플러그인 설치필요
>
>		1. ``google``에서 ``jp.gr.java_conf.ussiy.app.propedit`` 검색
>
>		1. ``app.propedit_5.3.3.zip`` 다운
>
>		1. 압축을 풀고 ``features``와 ``plugins``폴더를 eclipse폴더에 붙여넣기 한다.
>
>		1. eclipse에서 ``새파일 만들기``에 ``properties``항목이 추가된 것을 볼 수 있다.
>
>	* ``.properties``파일 생성시, 파일명과 확장자(``.properties``)를 같이 입력해야 한다.
>
>	* 파일명은 ``파일명_언어코드_국가코드.properties``의 형식을 맞춘다.
>
>		* ``국가코드``는 생략 가능 (``msg_ko.properties``, ``msg_en.properties``)
>
>	* 파일의 위치는 ``src``하위에서만 인식된다.
>
>	* ``.properties``파일의 작성은 ``속성명 = 데이터`` 형식으로 작성한다.
>
>		```java
>			id = 손님
>			greeting = 환영합니다
>		``` 

---

>	### ``<fmt:setLocale>``
>
>	* 로케일을 설정하는 태그
>
