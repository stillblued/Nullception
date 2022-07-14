package co.nullception.udongmarket.community.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		String savePath = "C:\\Temp\\"; //파일 저장위치 (=> 실제 서버로 옮길 때는 "fileSave")	
		int uploadSize = 1024*1024*1024; //최대 파일 사이즈 : 100MB
		int n = 0;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("file");
			String saveFileName = multi.getFilesystemName("file");

			vo.setMemberNickname(multi.getParameter("communityWriter"));
			vo.setComTitle(multi.getParameter("communityTitle"));
			vo.setComContent(multi.getParameter("communitySubject"));
			vo.setComDate(multi.getParameter("communityDate"));
			
			//if(originalFileName != null) {
			//	vo.setComAttach(originalFileName);
			//	saveFileName = savePath + saveFileName; //파일경로를 추가한다
			//	vo.setComAttachDir(saveFileName);}
			
			n = communityDao.communityInsert(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String returnPage = null;
		if(n != 0) { // n==0 이면 실패, 0이 아니면 성공
			returnPage = "communityList.do";
		} else {
			request.setAttribute("message", "게시글 등록 실패");
			returnPage = "community/communityError";
		}
		
		return returnPage;
	}

}