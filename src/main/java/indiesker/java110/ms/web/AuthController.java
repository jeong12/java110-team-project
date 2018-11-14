package indiesker.java110.ms.web;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import indiesker.java110.ms.domain.Member;
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
    
    @GetMapping("idis")
    public void idis(String email, Model model) {
        Member m=authService.getId(email);
        model.addAttribute("member",m);
    }
    
    @PostMapping("checkemail")
    public void checkEmail(String id, String email, Model model) {
    	String check = authService.checkEmail(id);
    	//System.out.println(check+"<<<<<<<<<<"+id+"***********"+email);
    	
    	if (check.equals(email)) {
    		model.addAttribute("check","입력하신 정보가 일치합니다.");
    		authService.update_pw(email);
    		model.addAttribute("update", "정상적으로 비밀번호가 변경되었습니다.");
    	}else {
    		model.addAttribute("check","입력하신 정보가 일치하지 않습니다.");
    	}
    }
  
//비밀번호 찾기
/* 	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
 	public void find_pw(Member id, Model model) throws Exception{
 		Member m = authService.update_pw(id);
 		model.addAttribute("update_pw", m);
 	}*/

}
