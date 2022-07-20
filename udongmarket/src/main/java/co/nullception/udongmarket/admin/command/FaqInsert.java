package co.nullception.udongmarket.admin.command;

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
		//vo.setNickname(request.getParameter("nickname"));
		//vo.setFaqDate(request.getParameter("faqDate"));
		
		HttpSession session = request.getSession(); // 서버가 만들어 놓은 세션 가져옴. 서버정보는 request통해서 가져옴.
		//System.out.println("sessionNickName : " +sessionNickName);
		//System.out.println("vo.getNickname : " + vo.getNickname());
		
//		
		// sessionNickname과 vo.getNickname이 같으면 vo에 sessionNickname 담음
		/*
		 * if (!sessionNickname.equals(vo.getNickname())) {
		 * vo.setNickname(sessionNickname); } else {
		 * System.out.println("정보가 일치하지 않습니다."); }
		 */
		
		
		String savePath = "C:\\Temp\\";
		int uploadSize = 1024 * 1024 * 1024;
		int cnt = 0;

		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadSize, "utf-8",
					new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("attach");
			String saveFileName = multi.getFilesystemName("attach");
			String sessionNickName = (String) session.getAttribute("nick"); //세션 닉네임 get
			//String sessionNickName = (String) session.getAttribute("nick"); //세션 닉네임
			vo.setNickname(sessionNickName); //세션 닉네임 nickname에 담음
			//vo.setNickname(multi.getParameter("nickname"));
			//System.out.println("vo.getNickname(sessionNick) : " + vo.getNickname());
			vo.setFaqTitle(multi.getParameter("faqTitle"));
			vo.setFaqContent(multi.getParameter("faqContent"));
			vo.setAttach(multi.getParameter("attach"));

			if (originalFileName != null) {
				vo.setAttach(originalFileName);
				saveFileName = savePath + saveFileName;
				vo.setAttachDir(saveFileName);
			}
			cnt = faqDao.faqInsert(vo);

		} catch (IOException e) {
			e.printStackTrace();

		}

		String returnPage = null;
		if (cnt != 0) {
			returnPage = "faq.do";
		} else {
			request.setAttribute("message", "게시글 등록이 실패했습니다.");
			returnPage = "admin/faqError";
		}
		return returnPage;
	}

}
