package co.nullception.udongmarket.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class AjaxFaqSearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//게시글 검색
		FaqService faqDao = new FaqServiceImpl();
		List<FaqVO> list = new ArrayList<FaqVO>();
		ObjectMapper mapper = new ObjectMapper();
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		list = faqDao.faqSearch(key, val);
		String jsonList = null;
		try {
			jsonList = mapper.writeValueAsString(list);
			
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:"+jsonList;
	}

}
