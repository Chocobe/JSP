# Servlet - 고급 - Filter

### Filter(필터) 란?

>	* Servlet이 수행되기 **전** 또는 **후** 에 추가 기능을 수행할 수 있도록 한다.
>
>	* 대표적으로 사용하는 기능은 한글처리를 위한 Encoding 설정을 구현한다.
	
---

### Filter 클래스 만들기

>	#### Filter 클래스 작성하기
>
>	* javax.servlet.Filter 인터페이스를 구현한다.
>	
>	* javax.servlet.Filter 인터페이스의 추상 메소드 3개를 구현한다.
>		
>		* ```java
>			// 웹서버가 시작될 때, 한번 수행된다. (Filter 객체는 이때 생성)
>			public void init(FilterConfig config) {}
>			```
>				
>		* ```java
>			// 실제 Filter 클래스의 동작이 수행되는 메소드
>			public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) {}
>			```
>
>		* ```java
>			// 웹서버가 종료될 때, 수행된다. (주로 자원 반납용으로 구현)
>			public void destroy() {}
>			```



>	#### web.xml 파일에 Filter 클래스 설정하기
>
>	```java
>		<filter>
>			<filter-name>논리적 필터 이름</filter-name>
>			<filter-class>페키지 경로가 포함된 실제 Filter 클래스 이름</filter-class>
>		</filter>
>		```



>	#### web.xml 파일에 Filter 대상 클래스 등록하기
>
>	```java
>		<filter-mapping>
>			<filter-name>논리적 필터 이름</filter-name>
>			<url-pattern>Filter의 대상 클래스의 URL 패턴값</url-pattern>
>		</filter-mapping>
>		```

---

#### Filter 클래스의 실행 순서

>	1. 클라이언트가 요청한 페이지가 ``<filter-mapping>``의 ``<url-pattern>``에 설정 됬는지 파악한다.
>
>	1. Filter의 대상이라면, 해당 Filter의 ``<filter-name>`` Filter 클래스의 ``doFilter()`` 메소드를 호출한다.
>
>	1. 다음 순서에 따라 ``doFilter()``메소드가 수행된다.
>
>		```java
>			public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) 
>							throws ServletException, IOException {
>				// 대상 서블릿 수행 전에 수행할 코드
>
>				// chain.doFilter() 메소드를 통해서 다음 Filter조건이 있다면,
>				// 		해당 Filter 클래스의 doFilter() 메소드 호출
>				// 더이상 Filter 조건이 없다면, 클라이언트가 호출한 대상 서블릿의 service() 메소드 수행
>				chain.doFilter(req, resp);
>
>				// 클라이언트가 호출한 서블릿의 수행 후, 수행할 코드
>			}
>			```
>
>	* Filter 클래스들의 순서는, **web.xml**에서 작성한 ``<filter-mapping>``태그의 작성 순서에 따라 수행된다.

---

#### FilterChain 클래스

>	* ``doFilter()`` 메소드의 세번짜 인자 ``FilterChain``은 서블릿이 실행될 때 처리흐름을 제어하는 역할을 한다.
>
>	* 만약, ``doFilter()`` 메소드 내부에서 ``FilterChain객체.doFilter()``메소드가 생략 된다면, 처리흐름은 여기서 중단된다.

---