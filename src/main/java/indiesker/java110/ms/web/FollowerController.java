package indiesker.java110.ms.web;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping("follow")
	public void follow(int no, Model model) {
		int bno = followerService.getFollwerNo(no);
		List<Follower> followerList = followerService.findList(bno);
		model.addAllAttributes(followerList);
	}
	
	
/*    @RequestMapping(value="/board/boardList.do")
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
