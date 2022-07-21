package co.nullception.udongmarket.deal.command;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 거래 게시글 등록
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();

		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		String savePath = rootPath + "fileSave/";
		
		File targetDir = new File(savePath);
		if (!targetDir.exists()) {
			targetDir.mkdirs();
		}
		
		int uploadSize = 1024 * 1024 * 1024;
		int cnt = 0;
		HttpSession session = request.getSession();

		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadSize, "utf-8",
					new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("file");
			String saveFileName = multi.getFilesystemName("file");
			
			String nickname = (String)session.getAttribute("nick");
			String location = (String)session.getAttribute("location");
			
			vo.setNickname(nickname);
			vo.setLocation(location);
			vo.setDealCategory(multi.getParameter("dealCategory"));
			vo.setDealTitle(multi.getParameter("dealTitle"));
			vo.setDealContent(multi.getParameter("dealContent"));
			int price = 0;
			if (multi.getParameter("price") != null) {
				price = Integer.parseInt(multi.getParameter("price"));
			}
			vo.setPrice(price);
			vo.setDealState(multi.getParameter("dealState"));

			String path = "../udongmarket/fileSave/";
			
			if (originalFileName != null) {
				vo.setAttach(originalFileName);
				saveFileName = path + saveFileName;
				vo.setAttachDir(saveFileName);
			}
			cnt = dealDao.dealInsert(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}

		String returnPage = null;
		if (cnt != 0) {
			returnPage = "dealList.do";
		} else {
			request.setAttribute("message", "게시글 등록이 실패했습니다.");
			returnPage = "deal/dealError";
		}
		return returnPage;
	}
}
