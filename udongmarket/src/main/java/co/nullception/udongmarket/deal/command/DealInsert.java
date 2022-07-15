package co.nullception.udongmarket.deal.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		String savePath = "C:\\Temp\\";
		int uploadSize = 1024 * 1024 * 1024;
		int cnt = 0;

		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadSize, "utf-8",
					new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("file");
			String saveFileName = multi.getFilesystemName("file");
			vo.setDealAttach(multi.getParameter("dealAttach"));
			vo.setDealCategory(multi.getParameter("dealCategory"));
			vo.setDealTitle(multi.getParameter("dealTitle"));
			vo.setDealContent(multi.getParameter("dealContent"));
			int price = 0;
			if (multi.getParameter("dealPrice") != null) {
				price = Integer.parseInt(multi.getParameter("dealPrice"));
			}
			vo.setDealPrice(price);
			vo.setDealState(multi.getParameter("dealState"));

			if (originalFileName != null) {
				vo.setDealAttach(originalFileName);
				saveFileName = savePath + saveFileName;
				vo.setDealAttachDir(saveFileName);
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
