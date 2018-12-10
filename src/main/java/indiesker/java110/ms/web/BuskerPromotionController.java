package indiesker.java110.ms.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.BuskerPromotion;
import indiesker.java110.ms.domain.BuskerPromotionComment;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.service.BuskerPromotionService;
import indiesker.java110.ms.service.BuskerService;
@Controller
@RequestMapping("/promotion")
public class BuskerPromotionController {

  BuskerPromotionService buskerPromotionService;
  BuskerService buskerService;
  ServletContext sc;

  public BuskerPromotionController(BuskerPromotionService buskerPromotionService,
      BuskerService buskerService, ServletContext sc) {
    super();
    this.buskerPromotionService = buskerPromotionService;
    this.buskerService = buskerService;
    this.sc = sc;
  }
  
/*  
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
	  List<BuskerPromotion> list = buskerPromotionService.SearchByTeamname(teamname);
	  model.addAttribute("teamname",list);
  }
*/
  
  //프로모션 리스트 (위 세개를 한개로 합침)
  @GetMapping("list")
  public void list(Model model,
          @RequestParam(value="searchType", required=false) String searchType,
          @RequestParam(value="keyword", required=false)String keyword) {
	  
	    if(searchType == null)//페이지가 갱신되도 서치타입이 유지되도록 처리 
	        searchType = "teamname";//디폴트 값을 팀네임으로 설정
	        model.addAttribute("searchType", searchType);
        
        //searchType에 따라 값을 반납
	    if (searchType != null && !"".equals(searchType)) { // searchType이 null이 아니고 빈 문자열이 아닐 때는 search
			  Map<String, Object> params = new HashMap<>();
			  
			if (keyword == null) {//keyword가 null일때 처리
				keyword = "";
			}
			
			params.put("keyword", "%" + keyword + "%");
			
			if ("city".equals(searchType)) {
				List<BuskerPromotion> list = buskerPromotionService.SearchByCity(params);
				model.addAttribute("city",list);	
			} else if ("teamname".equals(searchType)) {
				List<BuskerPromotion> list = buskerPromotionService.SearchByTeamname(params);
				model.addAttribute("teamname", list);
			} else {
				List<BuskerPromotion> list = buskerPromotionService.list();
				model.addAttribute("list",list);
			}
		} else {
			List<BuskerPromotion> list = buskerPromotionService.list();
			model.addAttribute("list",list);
		}
  }
  
  @RequestMapping("form")
  public void form() {
  }

  
  @PostMapping("add")
  public String add(
      BuskerPromotion buskerBoard,
          MultipartFile file1, HttpSession session) throws Exception {
      
      Member member = (Member)session.getAttribute("loginUser");
      buskerBoard.setBno(member.getNo());
      
      if (file1.getSize() > 0) {
        String filename = UUID.randomUUID().toString();
        file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
        buskerBoard.setPhot(filename);
      }
      
      buskerPromotionService.add(buskerBoard);
      
      return "redirect:form";
  }
  
  @GetMapping("detail")
  public void detail(
      int bbno, Paging paging, Model model) {
    
    paging.setPageSize(13);
    paging.setTotalCount(buskerPromotionService.totCommetList(bbno));
    
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    BuskerPromotion bd= buskerPromotionService.get(bbno);
    bd.setNsdt(dformat.format(bd.getSdt()));
    bd.setNedt(dformat.format(bd.getEdt()));
    bd.setNcdt(format.format(bd.getCdt()));
    
    List<BuskerPromotionComment> commentList = buskerPromotionService.comtList(bbno,paging);
    for (BuskerPromotionComment bpc : commentList) {
      bpc.setNcdt(format.format(bpc.getCdt()));
      if(bpc.getFlag() == 1) {
        bpc.setType("일반회원");
      }else if(bpc.getFlag() == 2) {
        bpc.setType("버스커");
      }else if(bpc.getFlag() == 3) {
        bpc.setType("제공자");
      }else if(bpc.getFlag() == 5) {
        bpc.setType("관리자");
      }
    }
    System.out.println(commentList);
    model.addAttribute("list", bd);
    model.addAttribute("comment", commentList);
    model.addAttribute("paging",paging);
  }
  
  
  // 댓글 입력
  @ResponseBody
  @RequestMapping("comments")
  public Map<String,Object> commentsinput(int bbno, String comment, HttpSession session) {
    
    Paging paging = new Paging();
    paging.setPageSize(13);
    paging.setTotalCount(buskerPromotionService.totCommetList(bbno));
    
    int mno = 0;
    if(session.getAttribute("loginUser") != null) {
      Member m = (Member)session.getAttribute("loginUser");
       mno = m.getNo();
    }

    if(comment != null) {
      int re = buskerPromotionService.insertComments(mno, bbno, comment);
    }

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    List<BuskerPromotionComment> list = buskerPromotionService.comtList(bbno,paging);
    
    for (BuskerPromotionComment bpc : list) {
      bpc.setNcdt(format.format(bpc.getCdt()));
      if(bpc.getFlag() == 1) {
        bpc.setType("일반회원");
      }else if(bpc.getFlag() == 2) {
        bpc.setType("버스커");
      }else if(bpc.getFlag() == 3) {
        bpc.setType("제공자");
      }else if(bpc.getFlag() == 5) {
        bpc.setType("관리자");
      }
    }
    
    Map<String,Object> map = new HashMap<>();
    map.put("list", list);
    map.put("paging", paging);
    map.put("mno", mno);
    return map;
  }
  
  
  // 댓글 삭제
  @ResponseBody
  @RequestMapping("removeComment")
  public Map<String,Object> removeComment(int bcno, HttpSession session) {
    
    int mno = 0;
    if(session.getAttribute("loginUser") != null) {
      Member m = (Member)session.getAttribute("loginUser");
       mno = m.getNo();
    }
    
    int no =buskerPromotionService.deleteComment(bcno);
    if(no <= 0) return null;
    
    int bbno = buskerPromotionService.findBbno(bcno);
    Paging paging = new Paging();
    paging.setPageSize(13);
    paging.setTotalCount(buskerPromotionService.totCommetList(bbno));
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    List<BuskerPromotionComment> list = buskerPromotionService.comtList(bbno,paging);
    
    for (BuskerPromotionComment bpc : list) {
      bpc.setNcdt(format.format(bpc.getCdt()));
      if(bpc.getFlag() == 1) {
        bpc.setType("일반회원");
      }else if(bpc.getFlag() == 2) {
        bpc.setType("버스커");
      }else if(bpc.getFlag() == 3) {
        bpc.setType("제공자");
      }else if(bpc.getFlag() == 5) {
        bpc.setType("관리자");
      }
    }
    Map<String,Object> map = new HashMap<>();
    map.put("list", list);
    map.put("paging", paging);
    map.put("mno", mno);
    return map;
  }
  
  
  // 페이징
  @ResponseBody
  @RequestMapping("pagination")
  public Map<String,Object> paging(int pageNo, int bbno, HttpSession session) {
    
    int mno = 0;
    if(session.getAttribute("loginUser") != null) {
      Member m = (Member)session.getAttribute("loginUser");
       mno = m.getNo();
    }
    
    Paging paging = new Paging();
    paging.setPageSize(13);
    paging.setPageNo(pageNo);
    paging.setTotalCount(buskerPromotionService.totCommetList(bbno));
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    List<BuskerPromotionComment> list = buskerPromotionService.comtList(bbno,paging);
    
    for (BuskerPromotionComment bpc : list) {
      bpc.setNcdt(format.format(bpc.getCdt()));
      if(bpc.getFlag() == 1) {
        bpc.setType("일반회원");
      }else if(bpc.getFlag() == 2) {
        bpc.setType("버스커");
      }else if(bpc.getFlag() == 3) {
        bpc.setType("제공자");
      }else if(bpc.getFlag() == 5) {
        bpc.setType("관리자");
      }
    }
    
    Map<String,Object> map = new HashMap<>();
    map.put("list", list);
    map.put("paging", paging);
    map.put("mno", mno);
    return map;
  }

}

