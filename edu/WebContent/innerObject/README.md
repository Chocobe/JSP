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
>	* ID 또는 비밀번호를 입력하지 않았을 경우, 경고 메시지를 ``request``객체에 속성으로 저장하여, 메시지 출력하기

---

## 내장객체 - session 예제

>	### 로그인 시, 이미 로그인 상태였는지 검사하기
>
>	* 로그인 시, 입력받은 ID 와 비밀번호를 ``session`` 내장객체의 속성으로 저장한다. **(로그인 처리 작업)**
>
>	* 로그인 시, 현재 로그인 상태인지를 검사하기 위해 ``session`` 내장객체의 유무 또는 ``id``속성값이 있는지 검사한다.
>
>	* 로그인 상태에서 중복 로그인 시, 경고 메시지를 출력한다.
>
>	* 로그인이 성공하면, 로그아웃 링크만 출력되도록 한다.