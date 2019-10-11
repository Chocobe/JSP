# Servlet

* Servlet 페이지 설정하기 (web.xml 설정)

	* ``web.xml``을 사용하여 서블릿 설정하기
	```xml
	<servlet>
		<servlet-name>서블릿 이름</servlet-name>
		<servlet-class>서블릿 경로</servlet-class>
	</servlet>
	
	<servlet-mapping>
		<servlet-name>서블릿 이름</servlet-name>
		<url-pattern>URI 경로 지정</url-pattern>
	</servlet-mapping>
	```
	
---
	
* Servlet 페이지 설정하기 (@WebServlet 어노테이션)
	
	* 해당 서블릿 파일의 클래스명에 어노테이션 추가
	```java
	@WebServlet("URI 경로 지정")
	public class ... {}
	```
	
---

* ServletConfig 에 동적으로 변수 생성하기

	* 서블릿의 초기화 때 생성되는 객체 (``<servlet>``태그 내에서 사용)
	
	```xml
	<servlet>
		<servlet-name>서블릿 이름</servlet-name>
		<servlet-class>서블릿 경로</servlet-class>
		
		<init-param>
			<param-name>변수명</param-name>
			<param-value>변수값</param-value>
		</init-param>
	</servlet>
	```
	
---
	
* ServletContext 에 동적으로 변수 생성하기

	* 서블릿 컨테이너가 시작될 때 생성되는 객체 (각 웹 애플리케이션 단위로 생성)
	
	```xml
	<context-param>
		<param-name>변수명</param-name>
		<param-value>변수값</param-value>
	</context-param>
	```
	
---

* ServletContext를 사용하여, 서블릿간 데이터 공유하기 (웹 애플리케이션 단위로 정보 공유)

	* ServletContext 에 데이터 저장하기
	
		```java
		ServletContext sc = getServletContext();
		sc.setAttribute("키 이름", Object);
		```
		
	* ServletContext 에 있는 데이터 읽어오기 (반환값은 Object형 이기때문에 사용전에 형변환 필요)
	
		```java
		ServletContext sc = getServletContext();
		Object data = sc.getAttribute("키 이름");
		
---

* Cookie (클라이언트 단위로 정보 공유 - 웹 브라우저에 저장 방식)

	* Cookie 생성
		
		``Cookie 변수명 = new Cookie("이름", "데이터");``
		
	* Cookie 설정
	
		* 쿠키 유효시간 설정 : ``쿠키객체.setMaxAge(초);``
		
		* 쿠키 경로 설정 : ``쿠키객체.setPath(경로);`` (경로값을 "/" 로 사용할 경우, 웹 애플리케이션 전체로 설정된다)
		
		* 쿠키 도메인 설정 : ``쿠키객체.setDomain(경로)``