# Servlet - 고급 - Filter

> Filter(필터) 란?

	* Servlet이 수행되기 *전* 또는 *후* 에 추가 기능을 수행할 수 있도록 한다.
	
---

### Filter 클래스 만들기

>	#### Filter 클래스 작성하기
>
>	* javax.servlet.Filter 인터페이스를 구현한다.
>	
>	* javax.servlet.Filter 인터페이스의 추상 메소드 3개를 구현한다.
>		
>		* ```java
>			public void init(FilterConfig config) {}
>			```
>				
>		* ```java
>			public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) {}
>			```