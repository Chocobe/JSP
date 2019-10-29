# JSTL

>	## JSTL 이란?
>
>	* Java Server Pages Standard Tag Library
>
>	* 표준화 된 태그 라이브러리다.
>
>	* 패키지 (총 5개)
>
>		* CORE : 
>
>			```java
>				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>			```
>
>		* Formatting
>
>			```java
>				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
>			```
>
>		* SQL
>
>			```java
>				<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
>			```
>
>		* XML
>
>			```java
>				<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
>			```
>
>		* Functions
>
>			```java
>				<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
>			```

---

>	## JSTL 설치
>
>	* 다운로드 : ``tomcat.apache.org``에서 ``Download`` -> ``taglib``
>
>		* ``taglibs-standard-compat-1.2.5.jar``
>
>		* ``taglibs-standard-impl-1.2.5.jar``
>
>		* ``taglibs-standard-jstlel-1.2.5.jar``
>
>		* ``taglibs-standard-spec-1.2.5.jar``
>
>	* ``WEB-INF/lib``에 저장하면 Tomcat 서버가 인식할 수 있다.

---

# JSTL 기본 액션

>	## ``<c:set>``
>
>	* 변수선언 또는 변수사용
>
>	* 동일한 ``scope``에 동일한 이름의 변수가 있다면, 생성이 아닌 사용이 된다.
>
>	* ``scope``의 기본값은 ``page``이며, ``scope``에 저장되기 때문에, **EL**을 사용할 수 있다.
>
>	* 속성
>
>		* ``var`` : 변수명
>
>		* ``value`` : 대입값
>
>		* ``scope`` : scope설정 (기본값 : page)
>
>		* ``target`` : 대상객체명
>
>		* ``property`` : ``target``으로 지정한 객체의 속성명
>
>		```java
>			<c:set var="name" value="Amy"/>
>		```
>
>		```java
>			<c:set target="Book" property="title" value="재밌는책"/>
>		```

---

>	## ``<c:out>``
>
>	* JSP 페이지에 출력하는 태그
>
>	* 속성
>
>		* ``value`` : 출력값 (문자열, JSP표현식, EL)
>
>		* ``default`` : ``value``값이 지정되지 않은 경우에 출력할 기본값 설정
>
>	```java
>		<c:out value="${book.title}" default="제목없음"/>
>	```

---

>	## ``<c:remove>``
>
>	* 해당 scope에서 변수 삭제
>
>	* 속성
>
>		* ``var`` : 삭제할 변수명
>
>		* ``scope`` : 대상 scope

---

>	## ``<c:catch>``
>
>	* java에서 ``try ~ catch``구문 역할 태그 (오류 처리 태그)
>
>	* 속성
>
>		* ``var`` : 태그몸체에서 에러가 발생할 경우, 발생한 에러객체의 참조변수명
>
>	```java
>		<c:catch var="e">
>			<%
>			String str = request.getParameter("str");
>			if(str.equals("Hello") {
>				out.print(str);
>			}
>			%>
>		</c:catch>
>
>		<c:out value="${e}"/>
>	```

---

# JSTL 조건 액션

>	## ``<c:if>``
>
>	* if문 역할 태그
>
>	* 속성
>
>		* ``test`` : 조건문 (boolean을 반환하는 문장)
>
>		* ``var`` : 조건문의 결과 boolean값이 저장될 변수
>
>		* ``scope`` : ``var``의 대상 scope 설정
>
>	```java
>		<c:if test="${100 < 95}">
>			<p>100은 95보다 큽니다</p>
>		</c:if>
>	```

---

>	## ``<c:choose>``
>
>	* java의 ``if ~ else if ~ else if``문 역할 태그 (또는 switch문)
>
>	* ``<c:choose>``태그 단독으로 사용할 수 없고, 태그몸체에 ``<c:when>``, ``<c:otherwise>``를 사용해야 한다.
>
>	* ``true`` 조건문을 만나면 실행하고, ``<c:choose>``태그는 종료된다. (= 조건을 만족하는 첫번째 문장만 수행)

---

>	## ``<c:when>``
>
>	* ``<c:choose>``의 태그몸체에 사용되는 태그
>
>	* 하나의 조건문에 해당한다.
>
>	* 속성
>
>		* ``test`` : 조건문
>
>	```java
>		<c:choose>
>			<c:when test="${100 > 90}">
>				<p>100은 90보다 큽니다</p>
>			</c:when>
>		</c:when>
>	```

---

>	## ``<c:otherwise>``
>
>	* ``if ~ else``문의 마지막 ``else``역할 또는 ``switch``문의 ``default`` 역할 태그
>
>	```java
>		<c:choose>
>			<c:when test="${num > 90}">
>				<p>90보다 크다</p>
>			</c:when>
>
>			<c:when test="${num > 80)">
>				<p>80보다 크다</p>
>			</c:when>
>
>			<c:otherwise>
>				<p>맞는 조건이 없음</p>
>			</c:otherwise>
>		</c:choose>
>	```

---

# JSTL 반복 액션

>	## ``<c:forEach>``
>
>	* 반복문 태그
>
>	* 속성
>
>		* ``items`` : ``Collection``객체 또는 배열
>
>		* ``var`` : 현재 루프 대상값의 참조변수명 지정
>
>		* ``begin`` : 반복횟수의 시작값
>
>		* ``end`` : 반복횟수의 끝값
>
>		* ``step`` : 반복횟수의 증감값
>
>	```java
>		<%
>		List<String> myList = new ArrayList<String>();
>		myList.add("Hello");
>		myList.add("JSTL");
>		%>
>
>		<c:forEach var="item" items="myList">
>			<c:out value="${item}"/>
>		</c:forEach>
>	```

---

>	## ``<c:forTokens>``
>
>	* 문자열을 ``특정 문자``로 분리하여, 각각 반복 수행
>
>	* 속성
>
>		* ``items`` : 대상 문자열 (분리할 문자열)
>
>		* ``delims`` : 구분자 설정
>
>		* ``var`` : 구분된 문자열의 참조변수명
>
>	```java
>		<%
>		String str = "Hello/JSP/Servlet";
>		%>
>
>		<c:forTokens var="token" items="str" delims="/">
>			<c:out value="${token}"/>
>		</c:forTokens>
>	```

---

# URL 액션

>	## ``<c:import>``
>
>	* 특정 페이지의 처리결과를 현재 페이지에 **삽입** 하거나, **변수에 저장**하는 태그
>
>	* 속성
>
>		* ``var`` : 변수명
>
>		* ``url`` : URL값
>
>	```java
>		// 변수 myURI에 페이지 주소 저장 (<c:import>로 생성한 변수는 참조하는 것으로 페이지가 이동된다)
>		<c:import var="myURL" url="페이지 주소"/>
>		
>		// 저장된 주소의 페이지를 여기에 삽입
>		${myURL}
>	```

---

>	## ``<c:url>``
>
>	* URL정보를 생성하는 태그
>
>	* 속성
>
>		* ``var`` : 변수명
>
>		* ``url`` : URL값
>
>	```java
>		<c:url var="변수명" value="주소값"/>
>		<c:redirect url="${위의 변수명}"/>

---

>	## ``<c:param>``
>
>	* 다른 페이지와 관련된 태그의 하위 태그로 사용하며, 파라미터(질의문자열)을 전달하는 태그이다.
>
>	* 전달되는 질의 문자열은 ``GET``방식으로 전달된다.
>
>	* 속성
>
>		* ``name`` : 변수명
>
>		* ``value`` : 값
>
>	```java
>		<c:import var="myURL" url="example08.jsp">
>			<c:param name="변수명" value="값"/>
>		</c:import>
>	```

---

>	## ``<c:redirect>``
>
>	* 다른 페이지로 이동하는 태그
>
>	* 속성
>
>		* ``url`` : 이동할 경로
>
>	```java
>		<c:redirect url="주소값"/>
>	```