package indiesker.java110.ms.web;

import java.net.URLEncoder;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.domain.BuskerPromotion;
import indiesker.java110.ms.service.BuskerPromotionService;
@Controller
@RequestMapping("/promotion")
public class BuskerPromotionController {

  BuskerPromotionService buskerPromotionService;
  ServletContext sc;

  public BuskerPromotionController(
      BuskerPromotionService buskerPromotionService,
      ServletContext sc) {
    this.buskerPromotionService=buskerPromotionService;
    this.sc=sc;
  }

  @GetMapping("list")
  public void list(Model model) {
    List<BuskerPromotion> list = buskerPromotionService.list();
    model.addAttribute("list",list);
  }

  @GetMapping(value="list", params="city", produces="text/plain;charset=UTF-8")
  public void city(String city, Model model) {
    List<BuskerPromotion> list = buskerPromotionService.SearchByCity(city);
    model.addAttribute("city",list);
  }

  @PostMapping(value="list", params="city")
  public String city(String city) throws Exception {
    String cities[] = city.split(",");
    if(cities.length > 1)
      city = URLEncoder.encode(cities[1], "UTF-8");
    else
      city = URLEncoder.encode(cities[0], "UTF-8");
    return "redirect:list?city="+city;
  }

}
