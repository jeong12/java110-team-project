package indiesker.java110.ms.web;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {
    
    AuthService authService;
    ServletContext sc;
    
    public AuthController (
        AuthService authService, ServletContext sc) {
      this.authService = authService;
      this.sc = sc;
    }
    
    @GetMapping("findid")
    public void findid() {
    }
    
    @PostMapping("idis")
    public void idis(String email, Model model) {
      authService.getId(email);
    }

}
