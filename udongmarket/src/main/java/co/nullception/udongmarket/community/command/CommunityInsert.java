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

public class CommunityInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시글 등록(파일 업로드 포함)
		CommunityService communityDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
				
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		String savePath = rootPath + "fileSave/" ;

		System.out.println(rootPath);
		System.out.println(savePath);
		
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
			String originalFileName = multi.getOriginalFileName("file");
			String saveFileName = multi.getFilesystemName("file");

			String nickname = (String) session.getAttribute("nick");
			String location = (String) session.getAttribute("location");

			vo.setNickname(nickname);
			vo.setLocation(location);
			vo.setComTitle(multi.getParameter("comTitle"));
			vo.setComContent(multi.getParameter("comContent"));
			vo.setComCategory(multi.getParameter("comCategory"));

			String path = "../udongmarket/fileSave/";
			
			if (originalFileName != null) {
				vo.setAttach(originalFileName);
				saveFileName = path + saveFileName; // 파일경로를 추가한다
				vo.setAttachDir(saveFileName);
			}

			n = communityDao.communityInsert(vo);

		} catch (IOException e) {
			e.printStackTrace();
		}

		String returnPage = null;
		if (n != 0) { // n==0 이면 실패, 0이 아니면 성공
			returnPage = "communityList.do";
		} else {
			request.setAttribute("message", "게시글 등록 실패");
			returnPage = "community/communityError";
		}

		return returnPage;
	}

}