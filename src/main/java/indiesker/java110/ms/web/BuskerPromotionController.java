package indiesker.java110.ms.web;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import indiesker.java110.ms.domain.BuskerBoard;
import indiesker.java110.ms.domain.BuskerBoardDetail;
import indiesker.java110.ms.domain.BuskerPromotion;
import indiesker.java110.ms.domain.Comment;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.service.BuskerBoardDetailService;
import indiesker.java110.ms.service.BuskerBoardService;
import indiesker.java110.ms.service.BuskerPromotionService;
import indiesker.java110.ms.service.BuskerService;
@Controller
@RequestMapping("/promotion")
public class BuskerPromotionController {

  BuskerPromotionService buskerPromotionService;
  BuskerBoardDetailService buskerBoardDetailService;
  BuskerBoardService buskerBoardService;
  BuskerService buskerService;
  ServletContext sc;

  public BuskerPromotionController(BuskerPromotionService buskerPromotionService,
      BuskerBoardDetailService buskerBoardDetailService, BuskerBoardService buskerBoardService,
      BuskerService buskerService, ServletContext sc) {
    super();
    this.buskerPromotionService = buskerPromotionService;
    this.buskerBoardDetailService = buskerBoardDetailService;
    this.buskerBoardService = buskerBoardService;
    this.buskerService = buskerService;
    this.sc = sc;
  }

  
  @GetMapping("list")
  public void list(Model model, HttpSession session) {
    List<BuskerPromotion> list = buskerPromotionService.list();
    model.addAttribute("list",list);
  }

  @GetMapping(value="list", params="city", produces="text/plain;charset=UTF-8")
  public void city(String city, Model model) {
    List<BuskerPromotion> list = buskerPromotionService.SearchByCity(city);
    model.addAttribute("city",list);
  }
  
  @GetMapping(value="list", params="teamname", produces="text/plain;charset=UTF-8")
  public void teamName(String teamname, Model model) {
	  System.out.println("..."+teamname);
	  List<BuskerPromotion> list = buskerPromotionService.SearchByTeamname(teamname);
	  model.addAttribute("teamname",list);
  }

/*  @PostMapping(value="list", params="city")
  public String city(String city) throws Exception {
    String cities[] = city.split(",");
    if(cities.length > 1)
      city = URLEncoder.encode(cities[1], "UTF-8");
    else
      city = URLEncoder.encode(cities[0], "UTF-8");
    return "redirect:list?city="+city;
  }*/
  
  @RequestMapping("form")
  public void form() {
  }

  
  @PostMapping("add")
  public String add(
          BuskerBoard buskerBoard,
          MultipartFile file1, HttpSession session) throws Exception {
      System.out.println(buskerBoard);
      
      Member member = (Member)session.getAttribute("loginUser");
      buskerBoard.setBno(member.getNo());
      
      if (file1.getSize() > 0) {
        String filename = UUID.randomUUID().toString();
        file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
        buskerBoard.setPhot(filename);
      }
      
      buskerBoardService.add(buskerBoard);
      
      return "redirect:form";
  }
  
  @GetMapping("detail")
  public void detail(
      int bbno,
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="3") int pageSize,
      Model model) {
    BuskerBoardDetail bd= buskerBoardDetailService.get(bbno);
    List<Comment> commentList = buskerBoardDetailService.comtList(bbno,pageNo, pageSize);
    model.addAttribute("buskerBoardDetail", bd);
    System.out.println(bd.getBno());
    model.addAttribute("comment", commentList);
  }
  
  @ResponseBody
  @RequestMapping("comments")
  public void commentsinput(int bbno, String comment, HttpSession session) {
    int no = (int)session.getAttribute("loginUser");
    System.out.println(bbno);
    System.out.println(comment);
  }

}
