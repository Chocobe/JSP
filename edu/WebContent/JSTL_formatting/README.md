# JSTL - Formatting

[:camel: 상위 페이지](https://github.com/Chocobe/JSP_practice/tree/master/edu)

---

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
>	* ``특정 사용자의 로케일`` 또는 ``전체 웹 애플리케이션의 로케일``을 지정할 수 있다.
>
>	* 속성
>
>		* ``value`` : 로케일 지정 (``언어코드_국가코드`` - ``국가코드``는 생략가능)
>
>			* 파일명은 ``<fmt:bundle>`` 또는 ``<fmt:setBundle>``으로 설정해야 한다.
>
>		* ``scope`` : 지정한 로케일의 적용 범위 지정
>
>		```java
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>
>			// ``.properties``파일명 : ``msg_en.properties``
>			<fmt:setLocale value="en"/>
>		```

---

>	### ``<fmt:setBundle>``
>
>	* 리소스 번들(Resource Bundle) 파일을 불러와 변수에 저장하는 태그
>
>	* 불러온 리소스 번들은 ``<fmt:message>``에서 사용한다.
>
>	* 속성
>
>		* ``basename`` : 불러올 리소스 번들 파일을 설정 (``국가코드``와 ``확장자``는 생략한다 - 파일명만 기입)
>
>		* ``var`` : 불러온 리소스 번들을 참조할 참조변수명
>
>		* ``scope`` : ``var``를 저장할 ``scope`` 설정
>
>		```java
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>			
>			<fmt:setBundle var="myBundle" basename="com.edu.bundle.msg"/>
>		```

---

>	## ``<fmt:bundle>``
>
>	* ``<fmt:bundle>`` ~ ``</fmt:bundle>`` 사이(태그몸체)의 값들의 리소스 번들을 지정하는 태그
>
>	* ``<fmt:setBundle>``은 리소스 번들을 참조변수에 저장하지만, ``<fmt:bundle>``은 **태그몸체**에 리소스 번들을 지정하는 것이다.
>
>	* 속성
>
>		* ``basename`` : 불러올 리소스 번들 파일을 설정 (``국가코드``와 ``확장자``는 생략 - 파일명만 기입)
>
>		* ``prefix`` : 리소스 번들의 키값 앞에 사용할 ``prefix(접두사)``를 지정
>
>		```java
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>			
>			<fmt:setLocale value="en"/>
>
>			<fmt:bundle basename="com.edu.bundle.msg"/>
>				<fmt:message key="id"/>
>				<fmt:message key="greeting"/>
>			</fmt:bundle>
>		```

---

>	## ``<fmt:message>``
>
>	* 리소스 번들의 값(속성)에 **접근**하기 위한 태그
>
>	* 속성
>
>		* ``key`` : 리소스 번들의 파일명
>
>		* ``bundle`` : ``<fmt:setBundle var="변수명"/>``에서 지정한 ``변수명``을 지정
>
>		* ``var`` : 리소스 번들의 ``key``에 매핑되는 값을 저장할 변수명 (참조한 값)
>
>		* ``scope`` : ``var``를 저장할 영역 지정
>
>		```java
>			// 위의 '예'와 동일
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>
>			<fmt:setLocale value="en"/>
>
>			<fmt:bundle basename="com.edu.bundle.msg">
>				<fmt:message key="id"/>
>				<fmt:message key="greeting"/>
>			</fmt:bundle>
>		```
>
>		```java
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>
>			<fmt:setBundle basename="com.edu.bundle.msg" var="myBundle"/>
>			<fmt:message var="val_1" key="id" bundle="${myBundle}"/>
>			${val_1}
>		```

---

>	## ``<fmt:param>``
>
>	* ``<fmt:message>``태그에 동적으로 ``파라미터``를 지정할 떄 사용하는 태그 (``<fmt:message>``하위 태그)
>
>	* ``<fmt:message>``태그에 동적으로 ``파라미터``를 지정하기 위해서는 리소스 번들에 ``{0}``, ``{1}``과 같이 기호를 사용하여 동적할당 위치를 지정한다.
>
>	* 리소스 번들에 동적으로 할당할 복수의 기호(변수)가 있다면, ``<fmt:param>``은 순서대로 대입 된다.
>
>	* ``<fmt:param>``태그로 전달한 ``파라미터``는 위의 기호에 위치하게 된다.
>
>	* 속성
>
>		* ``value`` : 동적으로 전달할 ``파라미터``값
>
>		```java
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>			
>			<fmt:setBundle var="myBundle" basename="com.edu.bundle.my"/>
>
>			<fmt:message var="val_1" bundle="${myBundle}" key="id">
>				<fmt:param value="Chocobe"/>
>				<fmt:param value="My Computer"/>
>			</fmt:message>
>		```

---

>	## ``<fmt:requestEncoding>``
>
>	* 데이터를 전송하는 폼에서 사용하는 인코딩 타입을 지정하는 태그
>
>	* ``value`` : 인코딩에 사용할 문자코드 지정 (UTF-8)
>
>		```java
>			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>
>			<fmt:requestEncoding="UTF-8"/>
>
>			Parameter : ${param.id}
>
>			<form action="이 jsp파일" method="POST">
>				이름 : <input type="text" name="id">
>				<input type="submit" value="전송">
>			</form>
>		```