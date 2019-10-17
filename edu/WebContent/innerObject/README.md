# 내장객체

## 내장객체 란?

>	* JSP파일을 Java 파일로 변환할 때 생성되는 ``_jspService()`` 메소드에 자동으로 생성되는 변수들을 말한다.
>
>	* request
>
>		* ``javax.servlet.http.HttpServletRequest 객체``
>
>	* response
>
>		* ``javax.servlet.http.HttpServletResponse 객체``
>
>	* session
>
>		* ``javax.servlet.http.HttpSession 객체``
>
>	* application
>
>		* ``javax.servlet.ServletContext 객체``
>
>	* config
>
>		* ``javax.servlet.ServletConfig 객체``
>
>	* out
>
>		* ``javax.servlet.jsp.JspWriter 객체``
>
>	* pageContext
>
>		* ``javax.servlet.jsp.PageContext 객체``

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

## 내장객체 - out

>	### **출력**과 **버퍼**에 대한 메소드를 사용할 수 있다.
>
>	* ``out.print()`` 메소드와 ``out.println()``메소드는 동일한 동작을 한다. (줄바꿈이 적용되지 않음)

---

## 내장객체 - pageContext

>	### ``pageContext``객체의 기능
>
>	1. 페이지 이동
>
>	1. 내장객체 반환

---

>	### ``pageContext``객체의 페이지 이동 기능
>
>	1. ``pageContext.forward("relative URL pattern")``
>
>		* 인자값으로 지정된 페이지로 이동한다.
>
>	1. ``pageContext.include("relavie URL pattern")``
>
>		* 현재 페이지에 인자값으로 지정된 페이지를 포함시킨다.

---

>	### ``pageContext``객체의 내장객체 반환 기능
>
>	* 내장객체의 생성은 ``_jspService()``메소드에서 수행된다.
>
>	* 자동으로 생성된 내장객체를 그대로 사용하는 방법은 ``_jspService()``메소드 내에서만 가능하다. 
>
>	* ``_jspService()``메소드 내에서 수행되는 JSP태그 :
>
>		1. 스크립트릿 : ``<% ... %>``
>
>		1. 표현식 : ``<%= ... %>``
>
>	* 선언문과 같이 ``_jspService()``메소드 밖에서 내장객체를 사용하려면, ``pageContext``객체에서 내장객체를 가져와야 한다.
>
>	* ``pageContext``객체의 내장객체 반환 메소드
>
>		1. ``getException()``
>
>		1. ``getPage()``
>
>		1. ``getRequest()``
>
>		1. ``getResponse()``
>
>		1. ``getServletConfig()``
>
>		1. ``getServletContext()``
>
>		1. ``getSession()``
>
>		1. ``getOut()``