# DataBase

>	### JDBC (Java DataBase Connectivity) 란?
>
>	* 자바언어로 데이터베이스에 접속하고, SQL문을 수행하고 처리하고자 할 때 사용되는 SQL 인터페이스 API이다.
>
>	### JDBC 드라이버 파일 연결하기
>
>	>	#### JDBC 다운로드
>	>
>	>	* JDBC를 이용하기 위해서는 **JDBC 드라이버**를 다운받아 인식할 수 있는 곳에 넣어야 한다.
>	>
>	>	* JDBC 드라이버는 ``database``가 설치된 폴더에서 가져올 수 있다.
>	>
>	>		* c:\app\user\product\11.2.0\dbhome_1\jdbc\lib\ojdbc6.jar
>	>
>	>	* Oracle 홈페이지에서 다운받을 수도 있다.
>	>
>	>		* https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html
>
>	>	#### JDBC 파일 연결하기
>	>
>	>	* 다운받은 ``ojdbc6.jar``파일을 인식할 수 있는 곳은 다음과 같이 2곳이 있다.
>	>
>	>		1. ``WAS``가 설치된 폴더의 **lib**폴더에 넣기
>	>
>	>			* 현재 ``WAS``로 실행되는 모든 웹 애플리케이션에서 사용할 수 있다.
>	>
>	>		1. 각 웹 애플리케이션의 ``/WEB-INF/lib`` 폴더에 넣기 
>	>
>	>			* 해당 웹 애플리케이션만 사용할 수 있다.

---

>	### 구현하기
>
>	>	#### DataBase와 연결하기 위해 준비해야 하는 환경
>	>
>	>	* DB API : ``java.sql`` 패키지(Java SE에서 제공한다)
>	>
>	>	* JDBC 드라이버 : ``ojdbc6.jar``파일(실제 DB작업을 처리하는 파일)
>	>
>	>	* DBMS : 설치한 DataBase (오라클 11g EE)
>
>	>	#### 구현 순서
>	>
>	>	1. JDBC 드라이버 로딩하기
>	>
>	>	1. DBMS서버와 접속하기
>	>
>	>	1. DataBase SQL 작업
>	>
>	>	1. 자원 해제

---

>	>	#### JDBC 드라이버 로딩하기
>	>
>	>	* ``Class.forName("위치값")`` 으로 JDBC 드라이버를 로드한다.(JDBC 드라이버를 메모리에 상주시키는 작업)
>	>
>	>		* 인자값으로 들어가는 ``"위치값"``은 패키지명과 함께 클래스명을 입력해야 한다.
>	>
>	>		* ``Class.forName("oracle.jdbc.driver.OracleDriver");``

---

>	>	#### Connection 객체 생성
>	>
>	>	* JDBC 드라이버를 로딩한 후, ``DriverManager.getConnection("url", "id", "password");``로 Connection 객체를 생성한다.
>	>
>	>	* 자바 프로그램과 DataBase를 실제로 연결해 주는 객체
>	>
>	>	* Connection 객체가 ``null``이라면 접속이 않된 상태이고, 아니라면 현재 접속상태 이다.

---

>	>	#### Statement 객체 생성
>	>
>	>	* 자바 프로그램과 DataBase 양쪽에 데이터를 전달해 주는 객체
>	>
>	>	* ``Connection객체.getStatement();``로 객체를 생성한다.
>	>
>	>	* ``SELECT``문
>	>
>	>		* ``Statement객체.executeQuery("SQL");``로 ``INSERT`` 쿼리를 DataBase에 전달한다.
>	>
>	>		* 결과는 ``ResultSet``객체
>	>
>	>	* ``INSERT, UPDATE, DELETE``문
>	>
>	>		* ``Statement객체.executeUpdate("SQL");``로 쿼리를 DataBase에 전달한다.
>	>
>	>		* 결과는 SQL문 실행 후 변경된 레코드의 개수이다.(int형)

---

>	>	#### ResultSet
>	>
>	>	* ``Statement.executeQuery("SELECT ...");``의 반환값
>	>
>	>	* 커서 개념을 이용하여, 결과값의 레코드를 이동할 수 있다.
>	>
>	>		* 결과값은 시작점과 끝지점에 데이터가 없는 빈 공간이 존재한다.
>	>
>	>		* ``ResultSet객체.next()`` : 커서의 다음 위치로 이동하며, 해당 위치에 데이터가 있을 경우 ``true``, 아니면 ``false`` 반환
>	>
>	>		* ``ResultSet객체.beforeFirst()`` : 커서를 시작점으로 이동시킨다. (데이터가 없는 부분)
>	>
>	>		* ``ResultSet객체.afterLast()`` : 커서를 마지막점으로 이동시킨다. (데이터가 없는 부분)
>	>
>	>		* ``ResultSet객체.getString("속성명")`` : 커서의 현재 위치에서 해당 ``속성명``의 ``문자열``을 추출한다.
>	>
>	>		* ``ResultSet객체.getInt("속성명")`` : 커서의 현재 위치에서 해당 ``속성명``의 ``정수형``을 추출한다.

---

>	>	#### PreparedStatement
>	>
>	>	* ``Statement``를 사용할 경우, ``SQL``작성에 첨자문을 정확히 작성해야 하기때문에 작업이 번거롭지만, ``PreparedStatement``를 사용하게 될 경우, 이러한 불편한 점을 해소할 수 있다.
>	>
>	>	* ``SQL쿼리문``의 값을 ``?(와일드카드)``로 작성하여, 동적으로 값을 넣을 수 있다.
>	>
>	>		* ```java
>	>			String sql = "INSERT INTO 테이블명 VALUES(?, ?, ?)";
>	>			PreparedStatement preStatement = Connection객체.getPrepareStatement(sql);
>	>			preStatement.setString(1, "문자열값");
>	>			preStatement.setInt(2, 정수형값);
>	>			preStatement.setString(3, "문자열값");
>	>			```
>	>
>	>	* 첨자는 사용하지 않는다.
