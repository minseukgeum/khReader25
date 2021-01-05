package com.kh.Reader25.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.Reader25.board.model.exception.BoardException;
import com.kh.Reader25.board.model.service.BoardService;
import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.Comments;
import com.kh.Reader25.board.model.vo.Liketo;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.common.Pagination;
import com.kh.Reader25.member.model.vo.Member;

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
							@RequestParam("uploadFile") MultipartFile[] uploadFile,
							HttpServletRequest request) {
		ArrayList<Attachment> atList =  new ArrayList<Attachment>();
		if(uploadFile.length != 0) {
			b.setCode(0); //공지사항 코드
			for(int i = 0; i < uploadFile.length; i++ ){
				Attachment at = saveFile(uploadFile[i], request, 0);
				if(i == uploadFile.length) {
					at.setAtcLevel(0);
				}else {
					at.setAtcLevel(1);
				}
				atList.add(at);
			}
		}
		int result = bService.insertBoardAndFiles(b, atList);

		if(result > 0) {
			return "redirect:notice.no";
		}else {
			throw new BoardException("공지사항 게시글 작성에 실패하였습니다.");
		}
	}
	//(4) 상세보기
	@RequestMapping("ndetail.no")
	public ModelAndView boardReviewDetailView(@RequestParam("boardNo") int boardNo,
										@RequestParam("page") int page, ModelAndView mv) {
		Board board = bService.selectBoard(boardNo);
		ArrayList<Attachment> atList = bService.selectAttachmentList(boardNo);
		if(board != null) {
			mv.addObject("board", board)
			   .addObject("page", page)
			   .setViewName("noticeDetail");
			if(atList != null) {
				mv.addObject("atList", atList);
			}
		}else {
			throw new BoardException("공지사항 상세보기가 실패하였습니다.");
		}
		return mv;
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
		ArrayList<Attachment> atList = bService.selectAttachmentTList(code);
		if(bList != null) {
			mv.addObject("bList", bList)
				.addObject("pi", pi)
				.addObject("atList", atList)
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
	@RequestMapping("redetail.re")
	public ModelAndView bookreviewDetailView(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page,
										ModelAndView mv) {
		Board board = bService.selectBoard(boardNo);
		ArrayList<Attachment> at = bService.selectAttachmentList(boardNo);
		if(board != null) {
			mv.addObject("board", board);
			mv.addObject("atList", at);
			mv.addObject("page", page);
			mv.setViewName("bookReviewDetail");
		}
		return mv;
	}
	@RequestMapping("insert.re")
	public String bookReviewInsert(@ModelAttribute Board b, @RequestParam("uploadFile") MultipartFile uploadFile,
									HttpServletRequest request,
									@RequestParam("booktitle") String booktitle,
									@RequestParam("author") String author) {
		String contentAddTag = "#책제목"+ booktitle + "#작가" + author + b.getbContent();
		b.setbContent(contentAddTag);
		
		Member member = (Member)(request.getSession().getAttribute("loginUser"));
		String userId = member.getId();
		b.setUserId(userId);
		
		Attachment at = null;
		if(uploadFile != null && !uploadFile.isEmpty()) {
			at = saveFile(uploadFile, request, 2);
		}
		b.setCode(2);
		int result = bService.insertBoardAndFile(b, at);
		
		if(result > 0) {
			return "redirect:book.re";
		}else {
			throw new BoardException("책리뷰 게시물 작성에 실패하였습니다.");
		}
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
	public ModelAndView boardDetail(@RequestParam("User") String loginUser, @RequestParam("boardNo") int boardNo,
									@RequestParam("page") int page, ModelAndView mv) {
		
		//System.out.println("loginUser"+loginUser);
		Board board = bService.selectTIWBoard(boardNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("loginUser", loginUser);
		map.put("boardNo", boardNo);
				
		int heart = bService.findLike(map);
		//System.out.println("heart"+heart);
		
		if(board != null) {
			mv.addObject("board", board)
				.addObject("page", page)
				.setViewName("TIWDetailView");
			
			if(heart > 0) {
				mv.addObject(heart);
			} else {
				mv.addObject(heart);
			}
		} else {
			throw new BoardException("오늘은 나도 작가 게시글 상세보기를 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 오늘은 나도 작가 = 5 좋아요 클릭 컨트롤러
	@ResponseBody
    @RequestMapping("heart.to")
    public int heart(HttpServletRequest httpRequest) throws Exception {

        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int boardId = Integer.parseInt(httpRequest.getParameter("boardId"));
        String userid = ((Member) httpRequest.getSession().getAttribute("loginUser")).getId();
        Liketo Like = new Liketo();

        Like.setB_no(boardId);
        Like.setM_no(userid);

        System.out.println(heart);

        if(heart >= 1) {
            bService.deleteLike(Like);
            heart=0;
        } else {
        	bService.insertLike(Like);
            heart=1;
        }

        return heart;

    }
	
	@RequestMapping("addComments.to")
	@ResponseBody
	public String addComments(@ModelAttribute Comments c, HttpSession session) {
		System.out.println("ok");
		System.out.println(c);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String cWriter = loginUser.getId();
		
		c.setUserId(cWriter);
		
		System.out.println(c);
		
		int result = bService.insertComments(c);
		int upCount = bService.updateCount(c);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("cList.to")
	public void getCommentsList(@RequestParam("bId") int bId, HttpServletResponse response) {
		
		ArrayList<Comments> cList = bService.selectCommentsList(bId);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(cList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	public Attachment saveFile(MultipartFile file, HttpServletRequest request, int code) {
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
		at.setAtcCode(code);
		at.setAtcOrigin(file.getOriginalFilename());
		at.setAtcName(renameFileName);
		at.setAtcPath(savePath);
		at.setAtcLevel(1);
		
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
