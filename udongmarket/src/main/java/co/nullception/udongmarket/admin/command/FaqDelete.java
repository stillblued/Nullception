package co.nullception.udongmarket.admin.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class FaqDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// faq 삭제
		FaqService faqDao = new FaqServiceImpl();
		FaqVO vo = new FaqVO();
		String boardId = request.getParameter("boardId");
		System.out.println(boardId);
		faqDao.faqDelete(vo);

		int cnt = 0;
		PrintWriter writer;

		try {
			if (cnt != 0) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('삭제되었습니다.');");
				writer.println("</script>;");
				writer.close();
			} else {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('오류가 발생했습니다.');");
				writer.println("</script>;");
				writer.close();

			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "admin.faq";

	}

}
