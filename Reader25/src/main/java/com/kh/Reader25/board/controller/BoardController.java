package com.kh.Reader25.board.controller;

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

import com.kh.Reader25.board.model.exception.BoardException;
import com.kh.Reader25.board.model.service.BoardService;
import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.common.Pagination;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	// 1. 공지사항 code = 0  ----------------------------------------------------
	// (1) 리스트 페이지
	@RequestMapping("notice.no")
	public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 0;
		int listCount = bService.getListCount(code);
		PageInfo pi = Pagination.getPageInfo1(currentPage, listCount);
		ArrayList<Board> bList = bService.selectList(pi, code);
		if(bList != null) {
			mv.addObject("bList", bList)
				.addObject("pi", pi)
				.setViewName("noticeList");
		}else {
			throw new BoardException("공지사항 게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	// (2) 글쓰기 페이지
	@RequestMapping("write.no")
	public String noticeWirteForm() {
		return "noticeWriteForm";
	}
	// (3) 글작성
	@RequestMapping("ninsert.no")
	public String insertNotice(@ModelAttribute Board b,
							@RequestParam("uploadFile") MultipartFile uploadFile,
							HttpServletRequest request) {
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName= saveFile(uploadFile, request);
		}
		
		return "redirect:notice.no";
	}
	
	// 문의사항 = 1----------------------------------------------------
	@RequestMapping("inquiry.in")
	public ModelAndView inquiryList(@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 1;
		int listCount = bService.getListCount(code);
		PageInfo pi = Pagination.getPageInfo1(currentPage, listCount);
		ArrayList<Board> iList = bService.selectList(pi, code);
		if(iList != null) {
			mv.addObject("iList", iList)
				.addObject("pi", pi)
				.setViewName("inquiryList");
		}else {
			throw new BoardException("문의사항 게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	@RequestMapping("write.in")
	public String inquiryWriteForm() {
		return "inquiryWriteForm";
	}
	
	// 책 리뷰 = 2 ----------------------------------------------------
	@RequestMapping("book.re")
	public ModelAndView bookreviewList(@RequestParam(value="page", required=false) Integer page,
								ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 2;
		int listCount = bService.getListCount(code);
		PageInfo pi = Pagination.getPageInfo2(currentPage, listCount);
		ArrayList<Board> bList = bService.selectList(pi, code);
		if(bList != null) {
			mv.addObject("bList", bList)
				.addObject("pi", pi)
				.setViewName("BookReview");
		}else {
			throw new BoardException("책리뷰 게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	@RequestMapping("write.re")
	public String bookreviewWriteForm() {
		return "bookreviewWriteForm";
	}
	

	////////////////오늘은 나도 작가(TIW) 컨트롤러////////////////////////
	
	// 오늘은 나도 작가 = 5 리스트 폼 이동 컨트롤러
	@RequestMapping("goTIWList.to")
	public ModelAndView goTIWList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getTIWListCount();
		
		PageInfo pi = Pagination.getPageInfo5(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectTIWList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("TIWListForm");
		} else {
			throw new BoardException("오늘은 나도 작가 게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 오늘은 나도 작가 = 5 글 작성 폼 이동 컨트롤러
	@RequestMapping("writeTIW.to")
	public String writeTIW() {
		return "TIWWriteForm";
	}
	
	// 오늘은 나도 작가 = 5 글 작성 컨트롤러
	@RequestMapping("TIWinsert.to")
	public String TIWinsert(@ModelAttribute Board b,
				@RequestParam("code1") String code1,
				@RequestParam("code2") String code2) {
		//System.out.println(b);
		//System.out.println(code1);
		//System.out.println(code2);
		
		b.setCate(code1+"/"+code2);
		//System.out.println(b);
		
		int result = bService.insertTIW(b);
		
		if(result > 0) {
			return "redirect:goTIWList.to";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
	
	// 오늘은 나도 작가 = 5 디테일 뷰 컨트롤러
	@RequestMapping("TIWdetail.to")
	public ModelAndView boardDetail(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page, ModelAndView mv) {
		
		//System.out.println("boardNo"+boardNo);
		Board board = bService.selectTIWBoard(boardNo);
		
		if(board != null) {
			mv.addObject("board", board)
				.addObject("page", page)
				.setViewName("TIWDetailView");
		} else {
			throw new BoardException("오늘은 나도 작가 게시글 상세보기를 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 오늘은 나도 작가 = 5 글 수정 폼 이동 컨트롤러
	@RequestMapping("TIWUpdateView.to")
	public ModelAndView TIWUpdateView(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page, ModelAndView mv) {
		
		Board board = bService.selectupTIWBoard(boardNo);
		
		mv.addObject("board", board)
		  .addObject("page", page)
		  .setViewName("TIWUpdateForm");
		
		return mv;
	}
	
	// 오늘은 나도 작가 = 5 글 작성 컨트롤러
	@RequestMapping("TIWupdate.to")
	public ModelAndView TIWupdate(@ModelAttribute Board b, @RequestParam("code1") String code1,
							@RequestParam("code2") String code2,@RequestParam("boardNo") int boardNo,
							@RequestParam("page") int page, HttpServletRequest request,
							ModelAndView mv) {
		
		b.setCate(code1+"/"+code2);
		b.setBoardNo(boardNo);
		
		int result = bService.updateTIWBoard(b);
		System.out.println(b);
		System.out.println(result);
		System.out.println(b.getBoardNo());
		
		if(result > 0) {
			mv.addObject("page", page)
			  .setViewName("redirect:TIWdetail.to?boardNo=" + b.getBoardNo());
		} else {
			throw new BoardException("게시글 등록을 실패하였습니다.");
		}
		
		return mv;
	}
	
	//오늘은 나도 작가 = 5 게시글 삭제 
		@RequestMapping("TIWDelete.to")
		public String boardDelete(@RequestParam("boardNo") int boardNo) {
			
			int result = bService.deleteTIWBoard(boardNo);
			
			if(result > 0) {
				return "redirect:goTIWList.to";
			} else {
				throw new BoardException("게시글 삭제에 실패했습니다.");
			}
		}
	
	////////////////오늘은 나도 작가(TIW) 컨트롤러////////////////////////

	// 관리자 창 : 공지사항 ----------------------------------------------------
	@RequestMapping("notice.ad")
	public ModelAndView noticetAdminView(@RequestParam(value="page", required=false) Integer page,
										ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 0;
		int listCount = bService.getListCount(code);
		PageInfo pi = Pagination.getPageInfo1(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi, code);
		if(list != null) {
			mv.addObject("list", list)
				.addObject("pi", pi)
				.setViewName("notice");
		}else {
			throw new BoardException("공지사항 게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	// 관리자 창 : 문의사항 ----------------------------------------------------
	@RequestMapping("inquiry.ad")
	public ModelAndView inquiryAdminView(@RequestParam(value="page", required=false) Integer page,
									ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 1;
		int listCount = bService.getListCount(code);
		PageInfo pi = Pagination.getPageInfo1(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi, code);
		if(list != null) {
			mv.addObject("list", list)
				.addObject("pi", pi)
				.setViewName("inquiry");
		}else {
			throw new BoardException("문의사항 게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 파일 이름 변경 메소드 ----------------------------------------------------
	public String saveFile(MultipartFile file, HttpServletRequest request) {
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
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

}
