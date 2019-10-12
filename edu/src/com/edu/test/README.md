# Servlet - 기본

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

* Cookie (클라이언트 단위로 정보 공유 - 클라이언트의 *상태정보*를 웹 브라우저에 저장하는 방식)

	* Cookie 생성
		
		``Cookie 변수명 = new Cookie("이름", "데이터");``
		
	* Cookie 설정
	
		* 쿠키 유효시간 설정 : ``쿠키객체.setMaxAge(초);`` (인자값에 음수(기본값) 입력 시, 브라우저가 종료될 떄 쿠키 제거함)
		
		* 쿠키 경로 설정 : ``쿠키객체.setPath(경로);`` (경로값을 "/" 로 사용할 경우, 웹 애플리케이션 전체로 설정된다)
		
		* 쿠키 도메인 설정 : ``쿠키객체.setDomain(경로)``
		
	* Cookie 추출
	
		* 쿠키 가져오기 : ``HttpServletRequest 객체.getCookies()`` -> ``Cookie[]``로 반환
		
		* 쿠키 이름 추출하기 : ``쿠키객체.getName()``
		
		* 쿠키 값 추출하기 : ``쿠키객체.getValue()``
		
---

* Session (클라이언트 단위로 정보 공유 - 클라이언트의 *상태정보*를 서버에 저장하는 방식)

	* Session 생성
	
		* ``HttpServletRequest객체.getSession()`` : 세션이 있으면 기존 세션 반환, 없으면 새로 생성하여 반환
		
		* ``HttpServletRequest객체.getSession(true)`` : 위와 동일
		
		* ``HttpServletRequest객체.getSession(false)`` : 기존 세션이 있을때만 세션 반환, 없으면 null 반환
		
	* Session 메소드
	
		* ``HttpSession객체.getAttribute(String name)`` : 세션에서 데이터 추출
		
		* ``HttpSession객체.setAttribute(String name, Object value)`` : 세션에 데이터 저장
		
		* ``HttpSession객체.removeAttribute(String name)`` : 세션에서 해당 데이터 삭제
		
		* ``HttpSession객체.isNew()`` : 서버에서 새로운 세션을 생성한 경우라면 true, 기존 세션이었다면 false 반환
		
		* ``HttpSession객체.invalidate()`` : 현재 세션을 삭제한다.
		
---

* HttpServletRequest (페이지별로 상태정보 공유하기 - HttpServletRequest객체를 전달하는 방식)

	* HttpServletResponse 요청 재지정 (HttpServletResponse객체의 sendRedirect 메소드)
	
		* ``resp.sendRedirect("URL값")`` 형식으로, 해당 URL로 페이지를 이동하는 명령이다.
		
		```java
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
						throws ServletException {
			resp.sendRedirect("http://www.naver.com");
		}
		```
		
	* RequestDispatcher 요청 재지정
	
		* RequestDispatcher 객체 생성하기
	
			* ServletContext 객체로 RequestDispatcher 객체 생성하기
		
				* URL값에는 절대경로만 지정 가능
			
				```java
				ServletContext객체.getRequestDispatcher("URL값");
				```
			
			* ServletRequest 객체로 RequestDispatcher 객체 생성하기
			
				* URL값에는 상대경로, 절대경로 둘 다 지정가능
				
				```java
				ServletRequest객체.getRequestDispatcher("URL값");
				```
	
		* 요청 재지정하기
		
			* 클라이언트의 요청으로 생성되는 HttpServletRequest객체와 HttpServletResponse객체를 그대로 전달해 준다.
			
			* forward()
			
				* 클라이언트의 요청페이지에서 다른 페이지(포워딩 페이지)로 수행제어와 응답을 위임하는 방식
			
				```java
				RequestDispatcher객체.forward(ServletRequest req, ServletResponse resp);
				```
			
			* include()
			
				* 클라이언트의 요청페이지에서 다른 페이지(포함 페이지)에 수행제어를 전달하고, 결과는 클라이언트가 요청한 페이지로 응답하는 방식
				
				```java
				RequestDispatcher객체.include(ServletRequest req, ServletResponse resp);
				```
				
---

