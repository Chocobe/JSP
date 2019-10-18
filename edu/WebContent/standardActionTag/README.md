# 표준액션태그 / JSP 자바빈즈

## 표준액션태그 란?

>	* JSP에서 사용할 수 있는 XML기반의 태그이다.
>
>	* 표준액션태그의 기능은 다음 두가지 이다.
>
>		1. JSP에서 자주 사용하는 기능을 사용할 수 있도록 구현되어있다.
>
>		1. 커스텀 테그 (JSP페이지에서 매핑한 JSP태그 이름으로 연결된 자바 클래스의 메소드를 실행시킨다)

---

>	### <jsp:forward>
>
>	* RequestDispatcher 객체의 **forward()** 메소드 기능을 수행한다.
>
>	* 사용법
>
>		``<jsp:forward page="경로" />``
>
>		``<jsp:forward page="<%= 변수 %>" />``
>
>		``<jsp:forward page="${ }" />``

---

>	### <jsp:include>
>
>	* RequestDispatcher 객체의 **include()** 메소드 기능을 수행한다.
>
>	* include지시자(``<%@ include page="경로" %>``)와 include표준액션태그(``<jsp:include page="경로" %>``)는 동작방식이 다르다.
>
>	>	### include 지시자 (``<%@ include file="경로" %>``)
>	>
>	>	* ``.jsp``파일에서 ``.java``파일로 변환할 때, ``file="경로"``의 소스가 포함된 후 컴파일 된다.
>
>	>	### include 표준액션태그 (``<jsp:include page="경로" />``)
>	>
>	>	* ``.class``파일을 실행할 때 ``page="경로"``파일이 포함된다.
>	>
>	>	* 다른 페이지를 동적으로 포함시키고자 할 때는. **inclue 표준액션태그**를 사용해야 한다.

---

## JSP 자바진즈 란?

>	* 