# Servlet - 고급 - Listener

### Listener(리스너) 란?

>	* event(어떤 일) 이 발생했을 때, 수행되는 메소드를 가진 객체를 말한다.
>
>	* 이벤트 소스 : event가 발생되는 요소 (ex - 윈도우에서 종료 아이콘인 "X" 버튼)
>
>	* 서블릿에서의 이벤트 소스 : ``HttpServletRequest``, ``HttpSession``, ``ServletContext``
>
>	* 가장 많이 사용되는 이벤트 헨들러 : ``ServletContextListener`` - 웹 애플리케이션을 서비스 하기 위한 초기환경 구축을 목적

---

### Listener 구현하기

### HttpServletRequest 객체

>	#### ServletRequestListener 객체
>
>	* ``ServletRequest``객체의 새성, 소멸에 대한 리스너는 ``ServletRequestListener`` 인터페이스를 구현하면 된다.
>
>	* ``ServletRequestListener``객체는 웹서버가 시작할 때 생성된다.
>
>	* ``ServletRequestListener``객체는 웹서버가 종료될 때 소멸한다.
>
>	* ``ServletRequestListener`` 구현
>
>	```java
>		public class 클래스명 implements ServletRequestListener {
>
>			@Override
>			public void requestInitialized(ServletRequestEvent e) {
>				// ServletRequest 객체가 생성될 때마다 호출되는 메소드
>			}
>
>			@Override
>			public void requestDestroyed(ServletRequestEvent e) {
>				// ServletRequest 객체가 소멸될 때마다 호출되는 메소드
>			}
>		}
>		'''


>	#### ServletRequestAttributeListener 객체
>
>	* ``ServletRequest``객체 속성의 생성, 삭제, 변경에 대한 리스너는 ``ServletRequestAttributeListener`` 인터페이스를 구현하면 된다.
>
>	* ``ServletRequestAttributeListener`` 객체는 웹서버가 시작될 때 생생된다.
>
>	* ``ServletRequestAttributeListener`` 객체는 웹서버가 종료될 때 소멸한다.
>
>	* ``ServletRequestAttributeListener`` 구현
>
>	```java
>		public class 클래스명 implements ServletRequestAttributeListener {
>		
>			@Override
>			public void attributeAdded(ServletRequestAttributeEvent e) {
>				// ServletRequest 객체에 속성을 생성할 때 호출되는 메소드
>			}
>
>			@Override
>			public void attributeRemoved(ServletRequestAttributeListener e) {
>				// ServletRequest 객체에 속성을 삭제할 때 호출되는 메소드
>			}
>
>			@Override
>			public void attributeReplaced(ServletRequestAttributeEvent e) {
>				// ServletRequest 객체에 속성값이 변경될 때 호출되는 메소드
>			}
>		}```


#### HttpSession 객체
>
>	* ``HttpSession``객체의 생성, 소멸에 대한 리스너는 ``HttpSessionListener`` 인터페이스를 구현하면 된다.
>
