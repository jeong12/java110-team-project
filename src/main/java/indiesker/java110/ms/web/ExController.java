package indiesker.java110.ms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ExController {

  public ExController(){}

  @GetMapping("index")
  public void index() {}
}
