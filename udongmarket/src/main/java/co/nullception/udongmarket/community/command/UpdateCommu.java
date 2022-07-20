package co.nullception.udongmarket.community.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;
import co.nullception.udongmarket.member.vo.MemberVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class UpdateCommu implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CommunityService communityDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
		
		HttpSession session = request.getSession();
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		String savePath = rootPath + "fileSave/" ;

		
		File targetDir = new File(savePath);
		if (!targetDir.exists()) {
			targetDir.mkdirs();
		}

		int uploadSize = 1024 * 1024 * 1024; // 최대 파일 사이즈 : 100MB
		int cnt = 0;
		

		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadSize, "utf-8",
					new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("file");
			String saveFileName = multi.getFilesystemName("file");

			String nickname = (String) session.getAttribute("nick");
			String location = (String) session.getAttribute("location");

			vo.setNickname(nickname);
			vo.setLocation(location);
			vo.setComTitle(multi.getParameter("comTitle"));
			vo.setComContent(multi.getParameter("comContent"));
			vo.setComCategory(multi.getParameter("comCategory"));
			vo.setComDate("");

			String path = "../udongmarket/fileSave/";
			
			if (originalFileName != null) {
				vo.setAttach(originalFileName);
				saveFileName = path + saveFileName; // 파일경로를 추가한다
				vo.setAttachDir(saveFileName);
			}

		cnt = communityDao.communityUpdate(vo);

		} catch (IOException e) {
			e.printStackTrace();
		}

		String returnPage = null;
		if (cnt != 0) { 
			returnPage = "communityList.do";
		} else {
			request.setAttribute("message", "게시글 수정 실패");
			returnPage = "community/communityError";
		}

		return returnPage;
	}

}
