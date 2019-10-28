# 태그 기반 커스텀 태그

>	## 태그 기반 커스텀 태그 란?
>
>	* ``.jsp`` 파일에 작성하는 커스텀 태그이다.
>
>	* 확장자는 ``.jsp``에서 ``.tag``로 변경해야 한다.
>
>	* 커스텀 태그 작성시에는 JSP 작성과 동일하게 하지만, 지시어의 키워드가 ``page``가 아닌 ``tag``로 사용한다.
>
>	* 설정은 해당 태그 페이지와 이 태그를 사용하는 JSP페이지에서만 한다. (web.xml과 .tld가 필요없다)

---

>	## 속성 만들기
>
>	* ``<%@ attribute %>`` 지시자를 사용하여 태그의 속성(필드변수)를 선언한다.
>
>	* ``<%@ attribute name="속성명" required="true" rtexprvalue="true" %>

---

>	## 작성 예
>
>	* 커스텀 태그 헨들러 : myTag.tag
>
>	```jsp
>		<%@ tag
>				language="java"
>				pageEncoding="UTF-8"
>				body-content="empty"
>		%>
>
>		<%@ attribute name="num_1" required="true" rtexprvalue="true" %>
>		<%@ attribute name="num_2" required="true" rtexprvalue="true" %>
>
>		${num_1} + ${num_2} = ${num_1 + num_2}
>	```
>
>	* 커스텀 태그를 사용하는 JSP 페이지
>
>	```jsp
>		<%@ page ... %>
>
>		<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
>		
>		<my:myTag num_1="10" num_2="20"/>
>	```

---

>	## EL용 변수 선언하기
>
>	* ``<%@ variable %>`` 지시자를 사용하여, EL에서 사용하는 변수를 선언한다.
>
>	* ``<%@ variable %>`` 지시자의 속성
>
>		* ``name-given`` : 변수명 설정
>
>		* ``variable-class`` : 자료형을 페키지 명과 클래스명으로 설정
>
>		* ``scope`` : 변수의 사용 범위를 설정
>
>			* "AT-BEGIN" : 시작 태그부터 사용
>
>			* "AT-END" : 끝 태그부터 사용
>
>			* "NESTED" : 시작태그와 끝태그 사이에서 사용
>
>	```java
>		<%@ variable name-given="result" variable-class="java.lang.Long" scope="AT_END" %>
>	```

---

>	## 커스텀 태그의 몸체 처리
>
>	* ``<jsp:doBody>`` 태그를 이용하여 몸체의 데이터를 추출한다.
>
>	* 속성
>
>	```java
>		<jsp:doBody var="저장할 변수명" scope="사용할 범위 지정"/>
>	```

---

>	## 커스텀 태그의 동적 속성 사용하기
>
>	* 커스텀 태그의 속성을 동적으로 생성하는 방법이다.
>
>	* 동적으로 생성한 속성은 **키/값**의 형태로 ``Map``객체로 생성된다.
>
>	* 키값 : ``동적속성객체.key``
>
>	* 데이터값 : ``동적속성객체.value``
>
>	* 동적속성 선언
>
>		```java
>			<%@ tag dynamic-attributes="동적속성명" %>
>		```
>
>	* 사용 예
>
>		```java
>			<%@ taglib prefix="c" tagdir="http://java.sun.com/jsp/jstl/core" %>
>
>			<%@ attribute name="location" required="true" %>
>			<%@ tag dynamic-attributes="options" %>
>			
>			<select name="${location}"/>
>				<c:forEach var="item" items="${options}"/>
>					<option value="item.key">${item.value}</option>
>				</c:forEach>
>			</select>
>		```