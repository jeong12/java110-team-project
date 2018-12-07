package indiesker.java110.ms.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.http.codec.multipart.SynchronossPartHttpMessageReader;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor{
  @Override
  public boolean preHandle(
      HttpServletRequest request,
      HttpServletResponse response,
      Object handler) throws Exception {

    System.out.println("AuthInterceptor.preHandler()..");
    HttpSession session = request.getSession();
    
/*    if(!(session.getAttribute("from").equals("busk")) || !(session.getAttribute("from").equals("sup"))) {
      System.out.println("해당사항 없음");
      response.sendRedirect("/app/signup/busker/form");
      return false;
    }
    
    if(session.getAttribute("from").equals("sup")) {
      System.out.println("sup로");
      response.sendRedirect("/app/signup/supporter/form");
      return true;
    }*/
    
    if(session.getAttribute("loginUser") == null) { // 로그인하지 않았으면
      if(session.getAttribute("from").equals("busk")) {
        return true;
      }else if(session.getAttribute("from").equals("sup")) {
        return true;
      }
      response.sendRedirect("/app/auth/form");
      return false; 
    }

    if(session.getAttribute("loginBusker") != null
        || session.getAttribute("loginSupporter") != null) {
      response.sendRedirect("/app/main");
      return false;
    }
    

    return true;
  }
}
