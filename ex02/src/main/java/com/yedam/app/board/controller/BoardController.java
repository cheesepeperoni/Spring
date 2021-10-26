package com.yedam.app.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
//@SessionAttributes("cri")
//210p
public class BoardController {
	@Autowired
	BoardService boardService;

	// 전체 조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri======" + cri);
		int total = boardService.getTotalCount(cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}

	// 단건조회
	@GetMapping("/get")
	public void get(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) { // bno 파라미터 -> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}

	// 수정페이지
	@GetMapping("/modify")
	public void modify(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) { // bno 파라미터 -> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}

	// 수정 처리
	@PostMapping("/modify")
	public String modify(BoardVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = boardService.update(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		// rttr.addAttribute("pageNum", cri.getPageNum());
		// rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}

	// 등록 페이지
	@GetMapping("/register")
	public void registerForm() {

	}

	// 등록 처리
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr, MultipartFile[] uploadFile)
			throws IllegalStateException, IOException {
	
		//vo.setAttachList(list);

		// insert
		boardService.insert(vo);

		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list"; // 파라미터 전달 X
	}

	// 삭제
	@PostMapping("/delete")
	public String delete(BoardVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = boardService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		// rttr.addFlashAttribute("pageNum", cri.getPageNum());
		// rttr.addFlashAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}

	// 삭제 get(나은)
	@GetMapping("/delete")
	public String delete2(BoardVO vo, RedirectAttributes rttr) {
		int result = boardService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}

	/**
	 * 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다. *
	 * 
	 * @param commandMap
	 * @param response
	 * @throws Exception
	 */
	// 받을 것이 여러개라면  @Request Map , 하나라면 String으로 받아도 됨
	@RequestMapping(value = "/download")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String uuid = (String) commandMap.get("uuid");
		//uuid로 첨부파일 검색
		BoardAttachVO attachVO = boardService.attachRead(uuid);
		String fileName = "";
		if(attachVO != null) {
			fileName = attachVO.getFileName();
		}
		
		File uFile = new File("c:/upload", uuid+fileName);	// 파일이름을 넣어줌
		long fSize = uFile.length();
		if (fSize > 0) {		// 파일이 있다면 밑에꺼 다운
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\""); // utf-8로 인코딩
			//setDisposition(atchFileId, request, response);
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(uFile));		// 서버에 있는 파일
				out = new BufferedOutputStream(response.getOutputStream());		// 파일 
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
			} finally {
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		} else {					// 파일이 없다면
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<h2>Could not get file name:<br>" + fileName + "</h2>");
			printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}

}
