package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.service.FeedPhotoService;

@Controller
@RequestMapping("/feedphoto")
public class FeedPhotoController {

  FeedPhotoService feedphotoService;   
  ServletContext sc;


  public FeedPhotoController(FeedPhotoService feedphotoService, ServletContext sc) {
    this.feedphotoService = feedphotoService;
    this.sc = sc;
  }

  @GetMapping("list")
  public void list(
      Model model) {

    List<FeedPhoto> list = feedphotoService.feedPhoto();
    model.addAttribute("list", list);

  }
}
