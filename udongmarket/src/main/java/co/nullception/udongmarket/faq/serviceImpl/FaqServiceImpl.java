package co.nullception.udongmarket.faq.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class FaqServiceImpl implements FaqService {
	
	private DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	@Override
	public List<FaqVO> faqSelectList() {
		// 전체목록 조회
		List<FaqVO> list = new ArrayList<>();
		FaqVO vo;
		String sql = "select * from faq order by board_id desc";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareCall(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new FaqVO();
				vo.setFaqTitle(rs.getString("FAQ_TITLE"));
				vo.setFaqDate(rs.getString("FAQ_DATE"));
				vo.setNickname(rs.getString("NICKNAME"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return list;
	}

	@Override
	public FaqVO faqSelect(FaqVO vo) {
		// 글 상세 보기
		String sql = "select * from faq where member_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareCall(sql);
			psmt.setInt(1, vo.getBoardId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setFaqTitle(rs.getString("FAQ_TITLE"));
				vo.setFaqDate(rs.getString("FAQ_DATE"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setFaqContent(rs.getString("FAQ_CONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return vo;
	}

	@Override
	public int faqInsert(FaqVO vo) {
		int n = 0;
		String sql = "insert into faq (BOARD_ID, NICKNAME, FAQ_TITLE, FAQ_CONTENT, FAQ_DATE)"
				+ " values(ID_SEQ.nextval, ?, ?, ?, ?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareCall(sql);
			psmt.setString(1, vo.getNickname());
			psmt.setString(2, vo.getFaqTitle());
			psmt.setString(3, vo.getFaqContent());
			psmt.setString(4, vo.getFaqDate());
			n = psmt.executeUpdate();
			if (rs.next()) {
				vo.setFaqTitle(rs.getString("FAQ_TITLE"));
				vo.setFaqDate(rs.getString("FAQ_DATE"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setFaqContent(rs.getString("FAQ_CONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return n;
	}

	@Override
	public int faqUpdate(FaqVO vo) {
		// 글 삭제
		int n = 0;
		String sql = "update faq set notice_title = ?, notice_subject = ?  where notice_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return n;
	}

	@Override
	public int faqDelte(FaqVO vo) {
		// 글 삭제
		int n = 0;
		String sql = "delete from faq where board_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return n;
	}

	@Override
	public List<FaqVO> faqSearch(String val) {
	
		return null;
	}

}
