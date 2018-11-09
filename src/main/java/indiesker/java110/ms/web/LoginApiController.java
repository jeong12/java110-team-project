package indiesker.java110.ms.web;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loginapi")
public class LoginApiController {

  ServletContext sc;
  public LoginApiController(ServletContext sc) {
    this.sc=sc;
  }
  
  @GetMapping("login")
  public void kakaoLogin() {}
  
  /*@GetMapping(value="login", params="code")
  public void getCode(HttpServletRequest req) throws Exception {
    String code = req.getQueryString();
    code = code.substring(5);
    System.out.println(code);
    req.setAttribute("code", code);
  }
  
  @PostMapping(value="login", params="code")
  public void pstCode() {
  }*/
  @RequestMapping("callback")
  public void callback() {}
}
