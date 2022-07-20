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
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new FaqVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setFaqTitle(rs.getString("FAQ_TITLE"));
				vo.setFaqDate(rs.getString("FAQ_DATE"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setFaqContent(rs.getString("FAQ_CONTENT"));
				vo.setReportedId(rs.getString("REPORTED_ID"));
				vo.setAttach(rs.getString("ATTACH"));
				vo.setAttachDir(rs.getString("ATTACH_DIR"));
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
	public FaqVO faqSelectOne(FaqVO vo) {
		// 글 상세 보기
		String sql = "select * from faq where board_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setFaqTitle(rs.getString("FAQ_TITLE"));
				vo.setFaqDate(rs.getString("FAQ_DATE"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setFaqContent(rs.getString("FAQ_CONTENT"));
				vo.setAnswerContent(rs.getString("ANSWER_CONTENT"));
				vo.setReportedId(rs.getString("REPORTED_ID"));
				vo.setAttach(rs.getString("ATTACH"));
				vo.setAttachDir(rs.getString("ATTACH_DIR"));
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
		int cnt = 0;
		String sql = "insert into faq (BOARD_ID, NICKNAME, FAQ_TITLE, FAQ_CONTENT, FAQ_DATE, ATTACH, ATTACH_DIR)"
				+ " values(id_SEQ.nextval, ?, ?, ?, sysdate, ? ,?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getNickname());
			psmt.setString(2, vo.getFaqTitle());
			psmt.setString(3, vo.getFaqContent());
			psmt.setString(4, vo.getAttach());
			psmt.setString(5, vo.getAttachDir());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int faqUpdate(FaqVO vo) {
		// 글 수정
		int cnt = 0;
		String sql = "update faq set faq_title = ?, faq_content = ?  where board_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int faqDelete(FaqVO vo) {
		// 글 삭제
		int cnt = 0;
		String sql = "delete from faq where board_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public List<FaqVO> faqSearch(String key, String val) {
		//내용 검색
		List<FaqVO> list = new ArrayList<>();
		FaqVO vo;
		String sql = "select * from faq where "+key+" like '%" + val +"%'";
		try{
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new FaqVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setFaqTitle(rs.getString("FAQ_TITLE"));
				vo.setFaqDate(rs.getString("FAQ_DATE"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setFaqContent(rs.getString("FAQ_CONTENT"));
				vo.setReportedId(rs.getString("REPORTED_ID"));
				vo.setAttach(rs.getString("ATTACH"));
				vo.setAttachDir(rs.getString("ATTACH_DIR"));
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dao.disconnect();
		}

		return list;
	}

	@Override
	public int sFaqInsert(FaqVO vo) {
		int cnt = 0;
		String sql = "insert into faq (BOARD_ID, NICKNAME, FAQ_TITLE, FAQ_CONTENT, FAQ_DATE, ATTACH, ATTACH_DIR)"
				+ " values(id_SEQ.nextval, ?, ?, ?, sysdate, ? ,?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getNickname());
			psmt.setString(2, vo.getFaqTitle());
			psmt.setString(3, vo.getFaqContent());
			psmt.setString(4, vo.getAttach());
			psmt.setString(5, vo.getAttachDir());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

}
