package com.kh.hehyeop.community.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.community.model.dto.Reply;
import com.kh.hehyeop.community.model.dto.Rereply;
import com.kh.hehyeop.community.model.service.CommunityService;
import com.kh.hehyeop.member.model.dto.Admin;
import com.kh.hehyeop.member.model.dto.User;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("community")
@RequiredArgsConstructor
public class CommunityController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final CommunityService communityService;

	@GetMapping("list")
	public void boardListTest(Model model, Paging paging, 
			  @RequestParam(value="nowPage", required = false) String nowPage,
			  @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		
		int total = communityService.countBoard();
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<Community> commuList = communityService.selectBoardList(paging);
		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
		
		
		for (Community community : commuList) {
			community.setParseDate(format.format(community.getRegDate()));
		}
		
		System.out.println(paging);
		model.addAttribute("commuList", commuList);
		model.addAttribute("paging", paging);
	}
	
	@GetMapping("view")
	public void boardViewTest(@RequestParam(value="boardIdx") String boardIdx, Model model, HttpSession session) {
		
		Community board = communityService.selectBoardByIdx(boardIdx);
		
		if (board.getIsPrivate() == 1) {
			
			User user = (User) session.getAttribute("authentication");
			
			if(!(user instanceof Admin) && !user.getId().equals(board.getId())) {
				throw new HandlableException(ErrorCode.PRIVATE_ACCESS_ERROR);
			}
			
		}
		
		List<Reply> replyList = communityService.selectReplyList(boardIdx);
		List<Rereply> reReplyList = communityService.selectReReplyList();
		int replyCnt = replyList.size();
		
		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm");
		board.setParseDate(format.format(board.getRegDate()));
		
		for (Reply reply : replyList) {
			reply.setParseDate(format.format(reply.getRegDate()));
		}
		
		for (Rereply rereply : reReplyList) {
			rereply.setParseDate(format.format(rereply.getRegDate()));
		}
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		model.addAttribute("replyCnt", replyCnt);
		model.addAttribute("reReplyList", reReplyList);
		
		communityService.updateViewCnt(boardIdx);
	}
	
	@GetMapping("search")
	public void boardSearch (Model model, Paging paging, Community community, HttpSession session,
			  @RequestParam(value="searchKeyword", required = false) String searchKeyword,
			  @RequestParam(value="nowPage", required = false) String nowPage,
			  @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		
		if(community.getBoardCategory() == null) {
			community.setBoardCategory("");
		}
		
		System.out.println(community.toString() + searchKeyword);
		
		Integer total = communityService.countBoardSearchList(community.getBoardCategory(), searchKeyword.replaceAll(" ", ""));
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<Community> commuList = communityService.selectSearchList(community.getBoardCategory(), searchKeyword.replaceAll(" ", ""), paging);
		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
		
		
		for (Community cm : commuList) {
			cm.setParseDate(format.format(cm.getRegDate()));
		}
		
		
		model.addAttribute("commuList", commuList);
		model.addAttribute("paging", paging);
		model.addAttribute("searchCount", total);
		session.setAttribute("boardCategory", community.getBoardCategory());
		session.setAttribute("searchKeyword", searchKeyword);
	}
	
	@GetMapping("write")
	public void boardWriteTest(Model model) {
		model.addAttribute(new Community());
	}
	
	@GetMapping("modify")
	public void boardModifyTest(@RequestParam(value="boardIdx") String boardIdx, Model model) {
		Community board = communityService.selectBoardByIdx(boardIdx);
		model.addAttribute("board", board);
	}
	
	@PostMapping("modify-board")
	public String modifyBoard(Community community, Model model) {
		communityService.modifyBoard(community);
		return "redirect:/community/list";
	}
	
	@GetMapping("delete-board")
	public String deleteBoard(String boardIdx, RedirectAttributes redirectAttr) {
		
		communityService.deleteBoard(boardIdx);
		redirectAttr.addFlashAttribute("message", "게시판이 삭제되었습니다.");
		
		return "redirect:/community/list";
	}
	
	@PostMapping("write-board")
	public String write(Community community, Model model) {
		
		community.setNickname(communityService.selectNickname(community.getId()));
		communityService.insertBoard(community);
		
		return "redirect:/community/list";
	}
	
	@PostMapping("write-reply")
	public String writeReply(Reply reply, RedirectAttributes redirectAttr) {
		
		if (reply.getContent().isEmpty()) {
			redirectAttr.addFlashAttribute("message", "빈 칸을 입력할 수 없습니다.");
			return "redirect:/community/view?boardIdx="+reply.getBoardIdx(); 
		}
		
		if (reply.getId().equals("admin")) {
			reply.setNickname("관리자");
		} else {
			reply.setNickname(communityService.selectNickname(reply.getId()));
		}
		
		communityService.insertReply(reply);

		return "redirect:/community/view?boardIdx="+reply.getBoardIdx();
	}
	
	@PostMapping("modify-reply")
	public String modifyReply(Reply reply, RedirectAttributes redirctAttr) {
		
		if (reply.getContent().isEmpty()) {
			redirctAttr.addFlashAttribute("message", "빈 칸을 입력할 수 없습니다.");
			return "redirect:/community/view?boardIdx="+reply.getBoardIdx(); 
		}
		
		communityService.modifyReply(reply);
		return "redirect:/community/view?boardIdx="+reply.getBoardIdx();
		
	}
	
	
	@GetMapping("delete-reply")
	public String deleteReply(@RequestParam(value = "replyIdx") String replyIdx,
							@RequestParam(value = "boardIdx") String boardIdx) {
		
		communityService.deleteReply(replyIdx);
		return "redirect:/community/view?boardIdx="+boardIdx;
		
	}
	
	@PostMapping("re-reply")
	public String writeReReply(Rereply reReply, @RequestParam(value="boardIdx") String boardIdx, RedirectAttributes redirctAttr) {
		
		if (reReply.getContent().isEmpty()) {
			redirctAttr.addFlashAttribute("message", "빈 칸을 입력할 수 없습니다.");
			return "redirect:/community/view?boardIdx="+boardIdx; 
		}
		
		if (reReply.getId().equals("admin")) {
			reReply.setNickname(communityService.selectNickname("관리자"));
		} else {
			reReply.setNickname(communityService.selectNickname(reReply.getId()));
		}
		
		communityService.insertReReply(reReply);
		return "redirect:/community/view?boardIdx="+boardIdx;
	}
	
	@GetMapping("delete-reReply")
	public String deleteReReply(@RequestParam(value = "reReplyIdx") String reReplyIdx,
								@RequestParam(value = "boardIdx") String boardIdx) {
		
		communityService.deleteReReply(reReplyIdx);
		return "redirect:/community/view?boardIdx="+boardIdx;
		
	}
	
	@PostMapping("modify-reReply")
	public String modifyReReply(Rereply reReply, RedirectAttributes redirctAttr) {
		System.out.println("잘넘어오는지 봅시당 : " + reReply);
		communityService.modifyReReply(reReply);
		return "redirect:/community/view?boardIdx="+reReply.getReplyIdx();
	}

	
}
