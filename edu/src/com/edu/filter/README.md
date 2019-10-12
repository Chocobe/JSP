# Servlet - 고급 - Filter

### Filter(필터) 란?

>	Servlet이 수행되기 **전** 또는 **후** 에 추가 기능을 수행할 수 있도록 한다.
	
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
>	*	```java
>			<filter>
>				<filter-name>논리적 필터 이름</filter-name>
>				<filter-class>페키지 경로가 포함된 실제 Filter 클래스 이름</filter-class>
>			</filter>
>			```