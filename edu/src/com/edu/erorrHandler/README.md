# Error page

## ``try ~ catch``
>
>	* 에러 발생 가능한 코드를 직접 처리하는 방법
>
>	* 에러가 발생할 경우 직접 처리하지만, 처리방법은 해당 코드(하나의 방식)로 해결하게 된다.

---

## ``throws``
>
>	* 에러 발생 가능한 메소드에 발생가능한 에러를 명시하고, 에러 처리를 호출하는 곳에 위임하는 방법
>
>	* ``throws``를 사용한 메소드를 사용할 경우 호출한 곳에서 처리해야 하지만, 상황별 유동적인 처리가 가능하다.

---

## ``web.xml`` 에서의 Error 처리
>
>	* 해당 웹 애플리케이션 전체에 대해 Error 처리를 한다.
>
>	* 만약, ``try ~ catch``까지 중복으로 사용했다면, ``try ~ catch``로 에러처리가 된다.
>
>	* 에러가 발생한 페이지를 요청한 방식이 ``GET`` 이라면, Error처리 서블릿의 ``doGet()``메소드가 수행된다.
>
>	* 에러가 발생한 페이지를 요청한 방식이 ``POST`` 라면, Error처리 서블릿의 ``doPost()`` 메소드가 수행된다.
>
>	* ``web.xml`` 설정하기 - 방법1
>
>		```xml
>			<error-page>
>				<error-code>500(상태코드)</error-code> <!-- 500 : 서버내부 프로그램 에러 -->
>				<location>/에러처리페이지</location> <!-- 에러를 처리할 페이지의 URI값 -->
>			</error-page>
>		```
>
>	* ``web.xml`` 설정하기 - 방법2
>
>		```xml
>			<error-page>
>				<exception-type>java.lang.NullPointerException</exception-type> <!-- 에러 클래스 -->
>				<location>URI값</location> <!-- 에러를 처리할 페이지의 URI값 -->
>			</error-page>
>		```

---

## ``web.xml`` 에서 처리한 Error정보
>
>	* ``web.xml``에 설정한 에러 처리 페이지가 에러를 처리할 경우, ServletRequest 객체를 사용하여 에러 상세정보를 사용할 수 있다.
>
>	* 에러 상세정보는 ``ServletRequest객체.getAttribute("속성명");``으로 사용할 수 있다.
>
>	* 속성명
>
>		* ErrorCode(상태코드값) : ``getAttribute("javax.servlet.error.status_code");`` (반환값 : Integer)
>
>		* ErrorClass : ``getAttribute("javax.servlet.error.exception");`` (반환값 : Object 또는 Throwable)
>
>		* Error발생 URI : ``getAttribute("javax.servlet.error.request_uri");`` (반환값 : String)
>
>		* Error메시지 : ``getAttribute("javax.servlet.error.message");`` (반환값 : String)
>
>		* Error타입(``web.xml``에서 ``<exception-type>``설정을 했을 때만 값을 가짐) : ``getAttribute("javax.servlet.error.exception_type");`` (반환값 : Object 또는 Throwable)