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

import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.service.TotalFeedService;

@Controller
@RequestMapping("/totalfeed")
public class TotalFeedController {

	TotalFeedService totalFeedService;
	ServletContext sc;

	public TotalFeedController(TotalFeedService totalFeedService, ServletContext sc) {
		this.totalFeedService = totalFeedService;
		this.sc = sc;
	}

	// 전체피드
	@GetMapping("nonmembers")
	public void nonmembers(Model model,
			@RequestParam(value="searchType", required=false) String searchType,
			@RequestParam(value="keyword", required=false)String keyword,
			@RequestParam(value="sortType", required=false, defaultValue="lcnt") String sortType){
		
		if(searchType == null)
			searchType = "teamname";
		
		model.addAttribute("searchType", searchType);//페이지가 갱신되도 서치타입이 유지되도록 처리 
		
		if (searchType != null && !"".equals(searchType)) { // searchType이 null이 아니고 빈 문자열이 아닐 때는 search
			  Map<String, Object> params = new HashMap<>();
			  
			if (keyword == null) {
				keyword = "";
			}
			
			params.put("keyword", "%" + keyword + "%");
			params.put("sortType", sortType);
			
			if ("city".equals(searchType)) {
				List<Busker> list = totalFeedService.SearchByCity(params);
				model.addAttribute("city",list);	
			} else if ("teamname".equals(searchType)) {
				List<Busker> list = totalFeedService.SearchByTeamname(params);
				model.addAttribute("teamname", list);
			} else if ("genre".equals(searchType)) {
				List<Busker> list = totalFeedService.SearchByGenre(params);
				model.addAttribute("teamgenre", list);
			} else {
				List<Busker> totalFeed = totalFeedService.findTotalFeed(sortType);
				model.addAttribute("totalFeed", totalFeed);
			}
		} else {
			List<Busker> totalFeed = totalFeedService.findTotalFeed(sortType);
			model.addAttribute("totalFeed", totalFeed);
		}
	}

	// 전체피드 회원
}
