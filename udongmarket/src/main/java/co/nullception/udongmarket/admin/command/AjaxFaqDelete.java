package co.nullception.udongmarket.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class AjaxFaqDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//ajax게시글 삭제
		
		FaqService faqDao = new FaqServiceImpl();
		ObjectMapper mapper = new ObjectMapper();  //jackson 라이브러리 사용(json)
		FaqVO vo = new FaqVO();
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
		int cnt = faqDao.faqDelete(vo);
		String jsonList ="0";
		
		if(cnt != 0) {
			jsonList ="1";
		}
		return "ajax:"+jsonList;
	}

}
