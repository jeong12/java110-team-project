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
	
	@GetMapping("follow")
	public void follow(Model model) {
		
	int no = 6;//일단 6번 회원입력
	
	//먼저 1페이지만 출력
	Map<String,Integer> page = new HashMap<String, Integer>();
	page.put("no",no);//일단 6번 회원입력
	//page.put("pageSize",9);//페이지 사이즈 등록 어차피 고정이라 그냥 xml에 직접입력
	page.put("startPageNo",0);//시작 게시물 번호 (pageNo-1) * pageSize = startPageNo
	List<Follower> followerList = followerService.followerPage(page); //첫페이지만 불러옴
	model.addAttribute("followerList", followerList);//첫페이지 자료 넘겨줌
	
	
	//paging(totalCount);
	Map<String,Integer> paging = new HashMap<String, Integer>();
	paging.put("startPageNo", 1);//시작 페이지 번호를 1로설정
	paging.put("pageNo", 1);//현재페이지 디폴트값을 1로 설정
	int totalCount = followerService.totalCount(no); //전체 게시글 수 계산
	int endPageNo = (totalCount/9)+1; //마지막 페이지 계산
	paging.put("endPageNo", endPageNo);
	model.addAttribute("paging", paging);
	
		
	}
	
	@ResponseBody
	@PostMapping(value="followerPagination")
	public List<Follower> followerPagination(int pageNo) {
		int no = 6;//일단 6번 회원입력
		Map<String,Integer> page = new HashMap<String, Integer>();
		page.put("no",no);//일단 6번 회원입력
		int startPageNo = (pageNo-1)*9;
		page.put("startPageNo",startPageNo);
		List<Follower> followerList = followerService.followerPage(page);
		return followerList;
	}
	
	@ResponseBody
	@PostMapping(value="clickDetail")
	public Follower clickDetail(int bno) {
		//System.out.println(bno);
		Follower findDetail = followerService.findDetail(bno);
		//System.out.println(findDetail.getTeamname());
		return findDetail;
	}
	
/*	
    @RequestMapping(value="/board/boardList.do")
    public String boardList(@ModelAttribute("boardVO") BoardVO boardVO,
            @RequestParam(defaultValue="1") int curPage,
            HttpServletRequest request,
            Model model) throws Exception{
        
        HttpSession session = request.getSession();
 
        // 전체리스트 개수
        int listCnt = boardServiceImpl.selectBoardListCnt(boardVO);
        
        Follwer pagination = new Follwer(listCnt, curPage);
        
        boardVO.setStartIndex(pagination.getStartIndex());
        boardVO.setCntPerPage(pagination.getPageSize());
        // 전체리스트 출력
        List<BoardVO> list = boardServiceImpl.selectBoardList(boardVO);
                
        model.addAttribute("list", list);
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination", pagination);
        
        return "board/boardList";
    }*/
}
