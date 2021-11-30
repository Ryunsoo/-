package com.kh.hehyeop.community.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.community.model.dto.Reply;
import com.kh.hehyeop.community.model.service.CommunityService;

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
			community.setContent(community.getContent().replaceAll("<(/)?(img|label|table|thead|tbody|tfoot|tr|td|p|br|div|span|font|strong|b)(.|\\s|\\t|\\n|\\r\\n)*?>", ""));
			community.setParseDate(format.format(community.getRegDate()));
		}
		
		System.out.println(paging);
		model.addAttribute("commuList", commuList);
		model.addAttribute("paging", paging);
	}
	
	@GetMapping("view")
	public void boardViewTest(@RequestParam(value="boardIdx") String boardIdx, Model model) {
		
		communityService.updateViewCnt(boardIdx);
		Community board = communityService.selectBoardByIdx(boardIdx);
		List<Reply> replyList = communityService.selectReplyList(boardIdx);
		int replyCnt = replyList.size();
		
		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm");
		board.setParseDate(format.format(board.getRegDate()));
		
		for (Reply reply : replyList) {
			reply.setParseDate(format.format(reply.getRegDate()));
		}
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		model.addAttribute("replyCnt", replyCnt);
	}
	
	@GetMapping("search")
	public void boardSearchTest() {}
	
	@GetMapping("write")
	public void boardWriteTest(Model model) {
		model.addAttribute(new Community());
	}
	
	@GetMapping("modify")
	public void boardModifyTest() {}
	
	@PostMapping("write-board")
	public String write(Community community, Model model) {
		
		community.setNickname(communityService.selectNickname(community.getId()));
		communityService.insertBoard(community);
		
		return "redirect:/community/list";
	}
	
	@PostMapping("write-reply")
	public String writeReply(Reply reply) {
		
		reply.setNickname(communityService.selectNickname(reply.getId()));
		communityService.insertReply(reply);

		return "redirect:/community/view?boardIdx="+reply.getBoardIdx();
	}

	
}
