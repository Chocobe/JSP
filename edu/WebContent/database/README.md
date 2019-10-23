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
>	>		```
>	>
>	>	* 첨자는 사용하지 않는다.

---

# Connection Pool

>	* Tomcat 설정 참조 페이지 : http://tomcat.apache.org/tomcat-6.0-doc/jndi-resources-howto.html
>
>	* JNDI 참조 페이지 : https://nine01223.blog.me/220339886074
>
>	* 서버에 미리 Connection객체들을 생성해 놓고, 클라이언트의 요청에 따라 제공, 반환받는 방식의 연결방식이다.
>
>	* Connection 객체들은 서버가 시작될 때, 설정한 개수만큼 생성하여 서버에서 보관하게 된다.
>
>	* DBCP : DataBase Connection Pool
>
>	* Connection Pool을 사용하기 위해서는 다음 세가지 설정이 필요하다.
>
>		1. 서버(WAS-Tomcat)의 ``server.xml``설정
>
>		1. JSP, Servlet에서 서버(WAS-Tomcat)에 생성해 놓은 Connection Pool을 가져가기 위한 설정
>
>		1. ``WEB-INF/web.xml``에서 해당 웹 애플리케이션이 Connection Pool을 이용하기 위한 설정

---

>	>	### 서버(WAS-Tomcat) 설정 : ``servler.xml``
>	>
>	>		```xml
>	>			<Resource driverClassName="oracle.jdbc.driver.OracleDriver"
>	>					  url="jdbc:oracle:thin:@127.0.0.1:1521:orcl"
>	>					  username="DB의 계정명"
>	>					  password="해당 계정의 비밀번호"
>	>					  name="jdbc/myoracle"
>	>					  type="javax.sql.DataSource"
>	>					  maxActive="4"
>	>					  maxIdle="2"
>	>					  maxWait="5000"/>
>	>		```
>	>
>	>	* ``driverClassName`` : JDBC 드라이버 클래스를 페키지명과 클래스명을 입력한다.
>	>
>	>	* ``url`` : 접속하려는 DB의 주소를 입력한다. (``127.0.0.1`` 은 ``localhost``와 동일하다)
>	>
>	>	* ``username`` : DB에 접속하려는 계정명을 입력한다.
>	>
>	>	* ``password`` : 해당 계정의 비밀번호 입력한다.
>	>
>	>	* ``name`` : 이 리소스의 이름을 부여한다.
>	>
>	>	* ``type`` : 이 리소스의 타입을 설정한다.
>	>
>	>	* ``maxActive`` : 생성할 Connection객체 수를 지정한다.
>	>
>	>	* ``maxIdle`` : 일반적으로 활용할 Connection객체 수를 지정한다.
>	>
>	>	* ``maxWait`` : Connection객체를 가져가기 위한 최대 대기시간을 설정한다. (단위 : ms)
>	>
>	>		* (설정된 대기시간을 초과하게 되면, Exception이 발생된다.)

--

>	>	### 서버(WAS-Tomcat) 설정 - ``context.xml``
>	>
>	>	* ``servler.xml``에 설정한 리소스를 이용하기 위한 참조명을 설정한다.
>	>
>	>		```xml
>	>			<ResourceLink global="Servlet이나 JSP에서 이 리소스를 참조하기 위한 참조명"
>	>						  name="이 리소스의 설정된 이름"
>	>						  type="이 리소스의 설정된 타입"/>
>	>		```
>	>
>	>	* ``global`` : Servlet이나 JSP에서 이 리소스를 참조하기 위해 사용할 참조명이다.
>	>
>	>	* ``name`` : 이 리소스의 이름을 입력한다. (``server.xml``에 설정한 ``name``값과 동일)
>	>
>	>	* ``type`` : 이 리소스의 타입을 입력한다. (``server.xml``에 설정한 ``type``값과 동일)

--

>	>	### 웹 애플리케이션(WEB-INF/web.xml) 설정 - ``web.xml``
>	>
>	>	* 서버에 생성되어 있는 리로스를 참조하기 위한 설정이다.
>	>
>	>	* 참조할 때의 참조명은, ``context.xml``에 설정한 ``global``값을 사용한다.
>	>
>	>		```xml
>	>			<resource-ref>
>	>				<description>이 리소스에 대한 설명</description>
>	>				<res-ref-name>참조명</res-ref-name>
>	>				<res-type>리소스타입</res-type>
>	>				<res-auth>이 리로스에 대한 권한이 누구인지 지정</res-auth>
>	>			</resource-ref>
>	>		```
>	>
>	>	* ``<description>`` : 이 리로스에 대한 설명
>	>
>	>	* ``<res-ref-name>`` : 참조할 리소스의 참조명을 입력한다. (``context.xml``에 설정한 ``global``값)
>	>
>	>	* ``<res-type>`` : 참조할 리소스의 타입을 입력한다. (``server.xml``, ``context.xml``, ``web.xml``에 적힌 ``type``값이 동일해야 한다.
>	>
>	>	* ``<res-auth>`` : 이 리소스의 권한자를 입력한다.