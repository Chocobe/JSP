# Servlet

* ServletConfig 에 변수 생성하기

	* 서블릿의 초기화 때 생성되는 객체
	
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