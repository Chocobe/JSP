# 내장객체

## 내장객체 란?

>	* JSP파일을 Java 파일로 변환할 때 생성되는 ``_jspService()`` 메소드에 자동으로 생성되는 변수들을 말한다.
>
>	* request
>
>		* ``HttpServletRequest 객체``
>
>	* response
>
>		* ``HttpServletResponse 객체``
>
>	* session
>
>		* ``HttpSession 객체``
>
>	* application
>
>		* ``ServletContext 객체``
>
>	* config
>
>		* ``ServletConfig 객체``
>
>	* out
>
>		* ``JspWriter 객체``
>
>	* pageContext
>
>		* ``PageContext 객체``

---

## 내장객체 - request 예제

>	### 로그인 시, 입력값의 유무 검사하기
>
>	* ID 또는 비밀번호를 입력하지 않았을 경우, 경고 메시지를 ``request``객체에 속성으로 지정하여, 메시지 출력하기

