# EL (Expression Language)

>	## EL 특징
>
>	* EL은 자바코드를 사용했던 모든 부분에서 사용할 수 있다.
>
>	* EL을 사용하면 ``null``값에 대해 좀 더 관대하다.
>
>	* 문자열로만 반환되는 ``질의 문자열``을 자동으로 형변환 시켜준다.
>
>	* 위와 같은 특징으로, ``질의 문자열``에 EL을 사용하면, ``null``값이나, 형변환을 신경쓰지 않고 사용할 수 있다.
>
>	* ``(;)세미콜론``은 사용하지 않는다.
>
>	* **EL은 서블릿 기능을 JSP보다 간단하게 표한할 수 있는 기술이다.**
>
>	* **EL은 각 scope에 저장된 데이터를 ``${표현식(키값)}``으로 추출할 수 있다.**
>
>	* **EL의 표현식에 scope에 대한 명시가 없으면, 좁은 scope 부터 넓은 scope 순으로 찾는다.
>
>		**(request -> session -> application 순서)**

---

>	## EL 형식
>
>	* ${"문자열"}
>
>	* ${'문자열'}
>
>	* ${정수}
>
>	* ${실수}
>
>	* ${true}
>
>	* ${false}

---

>	## EL 연산자
>
>	* 산술 연산자
>
>	* 논리 연산자
>
>	* 비교 연산자
>
>	* empty 연산자 (``null`` 또는 공백문자 인지를 판단한다)

---

>	## EL 내장객체
>
>	* ``pageContext`` : JSP 내장객체 ``pageContext``와 동일하다.
>
>	* ``pageScope`` : ``pageContext``에 등록된 속성의 ``키/값``의 **Map**객체
>
>	* ``requestScope`` : ``HttpServletRequest``에 등록된 속성의 ``키/값``의 **Map**객체
>
>	* ``sessionScope`` : ``HttpSession``에 등록된 속성의 ``키/값``의 **Map**객체
>
>	* ``applicationScope`` : ``ServletContext``에 등록된 속성의 ``키/값``의 **Map**객체
>
>	* ``param`` : ``Query String(질의 문자열)``의 ``키/값``의 **Map**객체
>
>	* ``paramValues`` : 같은 이름으로 전달되는 복수의 ``Query String(질의 문자열)``들의 ``키/값``의 **Map**객체
>
>	* ``cookie`` : 요청을 보낸 클라이언트의 ``쿠키명/쿠키값``의 **Map**객체
>
>	* ``initParam`` : 웹 에플리케이션의 초기화 변수(web.xml에 설정한 ``<initParam>``)의 ``키/값``의 **Map**객체

---

>	## EL과 JSP (매칭된 두 표현들은 동일한 기능을 한다)
>
>	* 속성값을 동적으로 할당하기
>
>		* JSP : ``<jsp:forward page="<%= 변수 %>"/>``
>
>		* EL  : ``<jsp:forward page="${변수}"/>``
>
>	* 내장객체 ``request``의 속성값 추출하기
>
>		* JSP : ``(타입)request.getAttribute("키값").getter메소드();``
>
>		* EL  : ``${키값.속성명}``
>
>	* 내장객체 ``session``의 속성값 추출하기
>
>		* JSP : ``(타입)session.getAttribute("키값").getter메소드();``
>
>		* EL  : ``${키값.속성명}``
>
>	* 내장객체 ``application``의 속성값 추출하기
>
>		* JSP : ``(타입)application.getAttribute("키값").getter메소드();``
>
>		* EL  : ``${키값.속성명}``