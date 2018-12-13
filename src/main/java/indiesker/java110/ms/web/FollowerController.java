package indiesker.java110.ms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import indiesker.java110.ms.domain.Follower;
import indiesker.java110.ms.service.FollowerService;

@Controller
@RequestMapping("/follower")
public class FollowerController {
	
	FollowerService followerService;
	ServletContext sc;
	
	public FollowerController(
			FollowerService followerService, ServletContext sc) {
		this.followerService = followerService;
		this.sc = sc;
	}
	
	@GetMapping("followList")
	public void followList(
			@RequestParam int no,
			@RequestParam(defaultValue="1") int pageNo,
            @RequestParam(defaultValue="9") int pageSize,
			Model model) {
	
        if (pageNo < 1)
            pageNo = 1;
        
        if (pageSize < 1 || pageSize > 9)
            pageSize = 9;
		
	//int no = 6;//일단 6번 회원입력
	
	List<Follower> followerList = followerService.findList(no,pageNo, pageSize);
	model.addAttribute("followerList", followerList);
	
	int totalCount = followerService.totalCount(no);
	int startPageNo = 1;
	int endPageNo = (totalCount/pageSize)+1;
	
		if (endPageNo%pageSize == 0)
			endPageNo = (totalCount/pageSize);
	
	//보이는 시작 페이지
	int visibleStartPageNo = pageNo - 4;
	if(visibleStartPageNo < 1)
		visibleStartPageNo = startPageNo;
	
	// 보이는 끝 페이지
	int visibleEndPageNo = pageNo + 4;;
	if(visibleEndPageNo >= endPageNo)
		visibleEndPageNo = endPageNo;
	

	
	Map<String, Integer> pageMove = new HashMap<>();
	pageMove.put("startPageNo",startPageNo);
	pageMove.put("endPageNo",endPageNo);
	pageMove.put("visibleStartPageNo",visibleStartPageNo);
	pageMove.put("visibleEndPageNo",visibleEndPageNo);
	pageMove.put("pageNo", pageNo);
	pageMove.put("no", no);
	
	//이전 페이지
	int prePageNo = pageNo-1;
		if(pageNo<=startPageNo)
			prePageNo = startPageNo;
	//다음 페이지
	int nexPageNo = pageNo+1;
		if(pageNo>=endPageNo)
			nexPageNo = endPageNo;
	
	pageMove.put("prePageNo", prePageNo);
	pageMove.put("nexPageNo", nexPageNo);
	
	model.addAttribute("pageMove", pageMove);
	
	//등록된 팔로워가 없을 경우 처리
	if(totalCount == 0) {
		model.addAttribute("nodata", "팔로잉 한 버스커가 없습니다.");
	}else {
		model.addAttribute("nodata", "");
	}
	
	}
	
	
	@ResponseBody
	@PostMapping(value="followerdetail")
	public Follower clickDetail(int bno) {
		System.out.println(bno);
		Follower findDetail = followerService.findDetail(bno);
		//System.out.println(findDetail.getTeamgenre());
		String genre = findDetail.getTeamgenre();
		if (genre.equals("ballad")) {
			genre = "발라드";
		}else if (genre.equals("dance")) {
			genre = "댄스";
		}else if (genre.equals("trot")) {
			genre = "트로트";
		}else if (genre.equals("folk")) {
			genre = "포크";
		}else if (genre.equals("rock")) {
			genre = "락";
		}else if (genre.equals("jazz")) {
			genre = "재즈";
		}else if (genre.equals("country")) {
			genre = "컨츄리";
		}else if (genre.equals("rnb")) {
			genre = "알앤비";
		}else if (genre.equals("rap")) {
			genre = "랩";
		}else {
			genre = "장르 미등록";
		}
		findDetail.setTeamgenre(genre);
		
		return findDetail;
	}
}
