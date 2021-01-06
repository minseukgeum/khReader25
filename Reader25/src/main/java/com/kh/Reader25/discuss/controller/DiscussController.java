package com.kh.Reader25.discuss.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.common.Pagination;
import com.kh.Reader25.discuss.model.exception.DiscussException;
import com.kh.Reader25.discuss.model.service.DiscussService;
import com.kh.Reader25.discuss.model.vo.Discuss;
import com.kh.Reader25.member.model.vo.Member;

@Controller
public class DiscussController {
	
	@Autowired
	private DiscussService dService;
	
	// 토론방 전체 페이지
	@RequestMapping("discuss.di")
	public ModelAndView discussList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 0;
		int listCount = dService.getListCount();
		PageInfo pi = Pagination.getPageInfo1(currentPage, listCount);
		ArrayList<Discuss> dList = dService.selectList(pi);
		if(dList != null) {
			mv.addObject("dList", dList)
				.addObject("pi", pi)
				.setViewName("discussList");
		}else {
			throw new DiscussException("공지사항 게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 토론방 글쓰기 페이지로 이동
	@RequestMapping("discussWrite.di")
	public String discussWriteForm() {
		return "discussWriteForm";
	}
	
	// 토론방 작성
	@RequestMapping("discussInsert.di")
	public String discussInsert(@ModelAttribute Discuss d, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, @RequestParam("dchose") String dchose) {
		d.setdWriter(((Member)(request.getSession().getAttribute("loginUser"))).getId());

		Attachment at = null;
		if(uploadFile != null && !uploadFile.isEmpty()) {
			at = saveFile(uploadFile, request);
		}
		if(dchose.equals("찬성")) {
			d.setdPros(1);
		} else {
			d.setdCons(1);
		}
		int result = dService.insertDiscuss(d, at);
		if(result >0) {
			return "redirect:discuss.di";
		} else {
			throw new DiscussException("토론방 작성에 실패하였습니다.");
		}
	}
	
	// 토론방 상세페이지 이동
	@RequestMapping("dDetail.di")
	public ModelAndView discussDetailForm(@RequestParam("dNo") int dNo, @RequestParam("page") int page, ModelAndView mv) {
		Discuss discuss = dService.selectDiscuss(dNo);
		
		if(discuss != null) {
			mv.addObject("d", discuss).addObject("page", page).setViewName("discussDetail");
		} else {
			throw new DiscussException("토론방 상세보기 실패하였습니다.");
		}
		return mv;
	}
	
	public Attachment saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) 
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		Attachment at = new Attachment();
		at.setAtcOrigin(file.getOriginalFilename());
		at.setAtcName(renameFileName);
		at.setAtcPath(savePath);
		at.setAtcLevel(0);
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return at;
	}
}
