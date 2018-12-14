package indiesker.java110.ms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import indiesker.java110.ms.domain.StageList;
import indiesker.java110.ms.service.StageListService;

@Controller
@RequestMapping("/stage")
public class StageListController {

  StageListService stageListService;   
  ServletContext sc;


  public StageListController(StageListService stageListService, ServletContext sc) {
    this.stageListService = stageListService;
    this.sc = sc;
  }

  // 리스트 출력
  @GetMapping("list")
  public void list(
	  @RequestParam(value="searchType", required=false) String searchType,
	  @RequestParam(value="keyword", required=false)String keyword,
	  @RequestParam(value="startDate", required=false)String startDate,
	  @RequestParam(value="endDate", required=false)String endDate,
      Model model) {
	  
	  //System.out.println(keyword);
	  
	  Map<String, Object> params = new HashMap<>();
	  if(searchType == null)
		  searchType = "local";
		  
	  model.addAttribute("searchType", searchType);//페이지가 갱신되도 서치타입이 유지되도록 처리 
	  
	  if(startDate == null && endDate == null) {
		  params.put("startDate", "2000-01-01");
		  params.put("endDate", "3000-01-01");
		  //System.out.println(params.get(startDate));
		  //System.out.println(params.get(endDate));
	  }else {
		  params.put("startDate", startDate);
		  params.put("endDate", endDate);
	  }
	  
	  params.put("keyword", "%" + keyword + "%");//정확히 검색값을 입력했을 때 뿐 아니라 검색값이 포함되면 검색되도록 처리
	
	if(searchType != null && !"".equals(searchType)) { // searchType이 null이 아니고 빈 문자열이 아닐 때 search
		//Date today = new Date();
	    //System.out.println(today);
		
		if (keyword == null) {//공란으로 검색 처리
			keyword = "";
		}
		
		
		if ("name".equals(searchType)) {
			List<StageList> list = stageListService.findByName(params);
			cutAddr(list);
			model.addAttribute("name",list);
		}else if ("local".equals(searchType)) {
			List<StageList> list = stageListService.findByLocal(params);
			cutAddr(list);
			model.addAttribute("local",list);
		}else {
			List<StageList> list = stageListService.list(params);
			cutAddr(list);
			model.addAttribute("list", list);
		}
		
	}else {
		List<StageList> list = stageListService.list(params);
		cutAddr(list);
		model.addAttribute("list", list);
	}

  }
  
  //주소 자르기
  public List<StageList> cutAddr(List<StageList> list){
	  
	  
	  for (int i=0;i<list.size();i++) {
			String addr = list.get(i).getLocal();
			String changed1 = addr.split(" ")[0];
			String changed2 = addr.split(" ")[1];
			addr = changed1.substring(0, 2) + " " +changed2.substring(0, 2);
			//System.out.println(addr);
			list.get(i).setLocal(addr);
		}
	  
	return list;
  }
}
