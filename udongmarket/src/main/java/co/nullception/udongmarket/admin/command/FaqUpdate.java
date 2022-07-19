package co.nullception.udongmarket.admin.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class FaqUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		FaqService faqDao = new FaqServiceImpl();
		FaqVO vo = new FaqVO();
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String nickname = request.getParameter("nickname");
		String faqDate = request.getParameter("faqDate");
		
		vo.setBoardId(boardId); 
		vo.setNickname(nickname);
		vo.setFaqDate(faqDate);
		System.out.println("update servlet 실행은 됨,,,");
		System.out.println(vo.getBoardId());
		System.out.println(vo.getNickname());
		System.out.println(vo.getFaqContent());

		String savePath = "C:\\Temp\\";
		int uploadSize = 1024 * 1024 * 1024;
		int cnt = 0;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadSize, "utf-8",
					new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("attach");
			String saveFileName = multi.getFilesystemName("attach");
			vo.setNickname(multi.getParameter("nickname"));
			vo.setFaqTitle(multi.getParameter("faqTitle"));
			vo.setFaqContent(multi.getParameter("faqContent"));
			vo.setAttach(multi.getParameter("attach"));
			
			if(originalFileName != null) {
				vo.setAttach(originalFileName);
				saveFileName = savePath + saveFileName;
				vo.setAttachDir(saveFileName);
			}
			cnt = faqDao.faqInsert(vo);
			
		} catch (IOException e) {
			e.printStackTrace();

		}
		String returnPage = null;
		if(cnt != 0 ) {
			returnPage = "faq.do";
		}else {
			request.setAttribute("message", "게시글 수정이 실패했습니다.");
			returnPage = "admin/faqError";
		}
		return returnPage;
	}

}
