package indiesker.java110.ms.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.service.AuthService;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.MemberService;
import indiesker.java110.ms.service.SupporterService;

@Controller
@RequestMapping("/auth")
public class AuthController {
    
    AuthService authService;
    MemberService memberService;
    BuskerService buskerService;  
    SupporterService supporterService;
    ServletContext sc;
    
    public AuthController (
        AuthService authService,MemberService memberService, BuskerService buskerService,
        SupporterService supporterService, ServletContext sc) {
      this.memberService=memberService;
      this.buskerService=buskerService;
      this.supporterService=supporterService;
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
    		
    		// 임시 비밀번호 생성
    		String changedPw = "";
    		for (int i = 0; i < 12; i++) {
    			changedPw += (char) ((Math.random() * 26) + 97);
    		}
    		//System.out.println("************************"+email);
    		//System.out.println("************************"+password);
    		
    		Map<String,String> update_pw_map = new HashMap<String, String>();
    		update_pw_map.put("email", email);
    		update_pw_map.put("password", changedPw);
    		
    		//System.out.println("------------------------"+update_pw_map.get("email"));
    		//System.out.println("------------------------"+update_pw_map.get("password"));
    		
    		authService.update_pw(update_pw_map);
    		model.addAttribute("update", "변경된 비밀번호는  "+changedPw+"  입니다 (나중에 성공적으로 메일이 발송되었습니다로 변경예정)");
    		naverMailSend(changedPw,email);//이메일 발송
    		

    	}else {
    		model.addAttribute("check","입력하신 정보가 일치하지 않습니다.");
    		model.addAttribute("update","비밀번호 변경에 실패하였습니다.");
    	}
    }
  
//비밀번호 찾기
/* 	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
 	public void find_pw(Member id, Model model) throws Exception{
 		Member m = authService.update_pw(id);
 		model.addAttribute("update_pw", m);
 	}*/
    
    
    //메일보내기
    /** 자바 메일 발송 
     * * @throws MessagingException 
     * * @throws AddressException **/
    
    public static void naverMailSend(String changedPw,String email) {
    	String host = "smtp.naver.com"; 
    	String user = "jakey745@naver.com";  // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
    	String password = "jsatree1290"; // 패스워드

         // SMTP 서버 정보를 설정한다. 
    	Properties props = new Properties(); 
    	props.put("mail.smtp.host", host); 
    	props.put("mail.smtp.port", 587); //네이버 : 587, 구글 : 465
    	props.put("mail.smtp.auth", "true"); 
    	//prop.put("mail.smtp.ssl.trust", "smtp.gmail.com"); //구글예제는 포함

    	Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
    		 protected PasswordAuthentication getPasswordAuthentication() {
    			 return new PasswordAuthentication(user, password);
    		 }
    	}); 

    	try {
    		MimeMessage message = new MimeMessage(session); 
    		message.setFrom(new InternetAddress(user)); 

    		//수신자 메일주소
    		message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

    		 // 메일 제목 
    		message.setSubject("인디스커 메일 테스트"); 

    		// 메일 내용 
    		message.setText("변경된 비밀번호는  "+changedPw+"  입니다"); 

    		// send the message 
    		Transport.send(message); 
    		System.out.println("Success Message Send"); 
    	} catch (MessagingException e) { e.printStackTrace(); } 
    }
/*    //구글메일로 발송하려면 이거 사용
    public static void gmailSend() {
        String user = "ktko@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "password";   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("ktko@naver.com")); 

            // Subject
            message.setSubject("제목을 입력하세요"); //메일 제목을 입력

            // Text
            message.setText("내용을 입력하세요");    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
*/

    @GetMapping("form")
    public void form() {}

    @PostMapping("login")
    public String login(
        String id,
        String password,
        String save,
        HttpServletResponse response,
        HttpSession session) { 

      ArrayList<Cookie> cookies = new ArrayList<>();

      if (save != null) {// 이메일 저장하기를 체크했다면,
        Cookie cookie = new Cookie("id", id);
        cookie.setMaxAge(60 * 60 * 24 * 15);
        response.addCookie(cookie);
      } else {// 이메일을 저장하고 싶지 않다면,
        Cookie cookie = new Cookie("id", "");
        cookie.setMaxAge(0);
        cookies.add(cookie);
      }
      Member loginUser = memberService.getMember(id, password);

      if(loginUser != null) {
        session.setAttribute("loginUser", loginUser);
        List<Integer> bno = buskerService.checkBusker(loginUser.getNo());
        List<Integer> sno = supporterService.checkSupporter(loginUser.getNo());

        
        if(bno.size() != 0) {
          System.out.println("버스커"+bno.get(0));
          return "redirect:../editprofile/busker/form";
        } 
        if(sno.size() != 0) {
          return "redirect:../editprofile/supporter/form";
        } 

        // 추후에 수정해야함 일단은 기본 html로 돌리기
        return "redirect:../editprofile/member/form";


      } else {
        session.invalidate();
        System.out.println("비밀번호틀림쓰");
        return "redirect:form";
      }
    }

    @ResponseBody
    @PostMapping(value="form", produces="application/json;charset=UTF-8")
    public void apiProfile(@RequestBody Map params, HttpSession session) {
      Member loginUser = memberService.getApiMember(params);

      if(loginUser != null) {
        session.setAttribute("loginUser", loginUser);
        System.out.println("Gd");
      } else {
        session.invalidate();
        System.out.println("비밀번호틀림쓰");
      }
    }

    @ResponseBody
    @PostMapping(value="callback", produces="application/json;charset=UTF-8")
    public void apiProfile2(@RequestBody Map params, HttpSession session) {
      Member loginUser = memberService.getApiMember(params);

      if(loginUser != null) {
        session.setAttribute("loginUser", loginUser);
      } else {
        session.invalidate();
        System.out.println("비밀번호틀림쓰");
      }
    }

    @GetMapping("callback")
    public void callback() {}
    

}
