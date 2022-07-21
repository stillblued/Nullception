package co.nullception.udongmarket.admin.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class FaqInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// FAQ FORM 등록버튼 눌렀을때...
		FaqService faqDao = new FaqServiceImpl();
		FaqVO vo = new FaqVO();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		String savePath = rootPath + "fileSave/" ;
		
		File targetDir = new File(savePath);
		if (!targetDir.exists()) {
			targetDir.mkdirs();
		}

		int uploadSize = 1024 * 1024 * 1024; // 최대 파일 사이즈 : 100MB
		int n = 0;
		
		HttpSession session = request.getSession();


		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadSize, "utf-8",
					new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("attach");
			String saveFileName = multi.getFilesystemName("attach");
			
			String NickName = (String) session.getAttribute("nick"); //세션 닉네임 get
			vo.setNickname(NickName); //세션 닉네임 nickname에 담음
			vo.setFaqTitle(multi.getParameter("faqTitle"));
			vo.setFaqContent(multi.getParameter("faqContent"));
			vo.setReportedId(multi.getParameter("reportedId"));
			
			String path = "../udongmarket/fileSave/";
			
			if (originalFileName != null) {
				vo.setAttach(originalFileName);
				saveFileName = path + saveFileName; // 파일경로를 추가한다
				vo.setAttachDir(saveFileName);
			}

			n = faqDao.faqInsert(vo);

		} catch (IOException e) {
			e.printStackTrace();

		}

		String returnPage = null;
		if (n != 0) {
			returnPage = "faq.do";
		} else {
			request.setAttribute("message", "게시글 등록이 실패했습니다.");
			returnPage = "admin/faqError";
		}
		return returnPage;
	}

}
