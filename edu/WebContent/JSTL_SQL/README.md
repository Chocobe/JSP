# JSTL - SQL

>	## ``<sql:setDataSource>``
>
>	* Connection Pool을 사용하기 위한 ``DataSource``객체를 생성하는 태그
>
>	* 속성
>
>		* ``var`` : 생성된 ``DataSource``객체의 설정값을 저장할 변수명
>
>		* ``dataSource`` : JNDI서버에 등록할 리소스의 이름 (예 : "jdbc/myoracle")
>
>		* ``driver`` : 사용할 JDBC드라이버의 ``페키지명.클래스명``
>
>		* ``url`` : 접속할 DB의 URL (예 : "jdbc:oracle:thin:@127.0.0.1:1521.orcl")
>
>		* ``user`` : DB에 접속할 ID (예 : "scott")
>
>		* ``password`` : DB에 접속할 ID의 비밀번호 (예 : "tiger")
>
>		```java
>			<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
>
>			<sql:setDataSource var="dataSource"
>				driver="oracle.jdbc.driver.OracleDriver"
>				url="jdbc:oracle:thin:@127.0.0.1:1521:orcl"
>				user="scott"
>				password="tiger"/>
>		```

---

>	## ``<sql:query>``
>
>	* ``SELECT``문을 수행하는 태그
>
>	* 속성
>
>		* ``sql`` : ``SELECT``쿼리문 (예 : SELECT * FROM TEST) - ``<sql:query>``문의 몸체에 작성해도 된다.
>
>		* ``var`` : ``SELECT``쿼리문의 결과가 저장될 변수명(ResultSet 객체)
>
>		* ``dataSource`` : JNDI서버에서 찾을 리소스 이름 (예 : "jdbc/myoracle")
>
>		* ``scope`` : ``var``를 저장할 범위 설정
>
>		* ``maxRows`` : ``SELECT`` 쿼리문의 결과값의 최대 행 개수 설정
>
>		* ``startRow`` : ``SELECT`` 쿼리문의 결과에 포함시킬 시작행 번호를 지정
>
>		```java
>			<sql:query dataSource="jdbc/myoracle">
>				SELECT * FROM TEST
>			</sql:query>
>		```
>
>	## ``<sql:query>``문의 결과값
>
>	* 반환되는 참조변수는 ``<sql:query>`` 쿼리문의 속성인 ``var``에 지정한 변수에 저장된다.
>
>	* 결과값의 열이름 추출하기
>
>		``결과참조변수.columnNames``
>
>	* 결과값의 데이터 추출하기
>
>		```java
>			<c:forEach var="row" items="${결과참조변수명}">
>				// 열이름은 대소문자를 구분하지 않는다.
>				<c:out value="${row.열이름}"/>
>			</c:forEach>
>		```

---

>	## ``<sql:update>``
>
>	* ``SELECT``문을 제외한, ``INSERT``, ``UPDATE``, ``DELETE``문을 수행할 떄 사용하는 태그
>
>	* 속성
>
>		* ``sql`` : ``INSERT``, ``UPDATE``, ``DELETE`` 쿼리문 (예 : INSERT INTO TEST VALUES(1, 'HELLO')) - ``<sql:update>``문의 몸체에 작성해도 된다.
>
>		* ``dataSource`` : JNDI서버에서 찾을 리소스 이름 (예 : "jdbc/myoracle")
>
>		* ``var`` : SQL문 수행 후, 결과값을 저장할 변수
>
>		* ``scope`` : ``var``의 사용범위 지정
>
>		```java
>			<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
>			
>			<sql:update var="result" dataSource="jdbc/myoracle">
>				INSERT INTO TEST(1, 'HELLO')
>			</sql:update>
>		```

---

>	## ``<sql:transaction>``
>
>	* 트렌젝션을 구현할 때 사용하는 태그
>
>	* ``<sql:transaction>``태그 몸체에 쿼리문들(``<sql:query>``, ``<sql:update>``)를 사용할 경우, ``<sql:transaction>``의 ``dataSource``속성을 설정함으로써 하위 쿼리문들에서는 이 ``dataSource``속성의 DataSource객체를 사용하게 된다.
>
>	* 속성
>
>		* ``dataSource`` : JNDI서버에서 찾을 리소스 이름 (예 : "jdbc/myoracle")
>
>		```java
>			<sql:transaction dataSource="jdbc/myoracle">
>				<sql:query var="result_1">
>					SELECT * FROM TEST_1
>				</sql:query>
>
>				<sql:query var="result_2">
>					SELECT * FROM TEST_2
>				</sql:query>
>
>				<sql:update var="result_3">
>					INSERT INTO TEST_3 VALUES(1, 'HELLO')
>				</sql:update>
>			</sql:transaction>
>		```

---

>	## ``<sql:param>``
>
>	* 쿼리문의 ``WHERE 절``(질의문)에 사용할 파라미터를 지정하는 태그
>
>	* 속성
>
>		* ``value`` : ``WHERE 절``(질의문)에 대입할 값

---

>	## ``<sql:dateParam>``
>
>	* 쿼리문의 ``WHERE``절(질의문)에 사용할 날짜 파라미터를 지정하는 태그
>
>	* 속성
>
>		* ``value`` : ``WHERE 절``(질의문)에 대입할 날짜 값