package co.nullception.udongmarket.community.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunityServiceImpl implements CommunityService {

	private DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	@Override
	public List<CommunityVO> communityList(int startRow, int endRow) {
		List<CommunityVO> list = new ArrayList<>();
		CommunityVO vo;
		String sql = "SELECT * \r\n" + "FROM (SELECT ROWNUM AS RNUM, A.*\r\n"
				+ "FROM (SELECT * FROM COMMUNITY ORDER BY COM_DATE DESC, COM_CATEGORY) A)\r\n"
				+ "WHERE RNUM BETWEEN ? AND ?";

		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new CommunityVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getString("COM_DATE"));
				vo.setLocation(rs.getString("LOCATION"));
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
	public CommunityVO communitySelect(CommunityVO vo) {
		String sql = "SELECT * FROM COMMUNITY WHERE BOARD_ID =?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo = new CommunityVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getString("COM_DATE"));
				vo.setLocation(rs.getString("LOCATION"));
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
	public int communityInsert(CommunityVO vo) {
		int cnt = 0;
		String sql = "INSERT INTO COMMUNITY (BOARD_ID, NICKNAME, COM_CATEGORY, COM_TITLE, COM_CONTENT, LOCATION, ATTACH, ATTACH_DIR) VALUES (ID_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";

		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getNickname());
			psmt.setString(2, vo.getComCategory());
			psmt.setString(3, vo.getComTitle());
			psmt.setString(4, vo.getComContent());
			psmt.setString(5, vo.getLocation());
			psmt.setString(6, vo.getAttach());
			psmt.setString(7, vo.getAttachDir());

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int communityUpdate(CommunityVO vo) {
		int cnt = 0;
		String sql = "UPDATE COMMUNITY SET COM_CATEGORY =?, COM_TITLE =?, COM_CONTENT =?, LOCATION =?, ATTACH =?, ATTACH_DIR =?, NICKNAME =?, COM_DATE = SYSDATE WHERE BOARD_ID=?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getComCategory());
			psmt.setString(2, vo.getComTitle());
			psmt.setString(3, vo.getComContent());
			psmt.setString(4, vo.getLocation());
			psmt.setString(5, vo.getAttach());
			psmt.setString(6, vo.getAttachDir());
			psmt.setString(7, vo.getNickname());
			psmt.setInt(8, vo.getBoardId());
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int communityDelete(CommunityVO vo) {
		int cnt = 0;
		String sql = "DELETE FROM COMMUNITY WHERE BOARD_ID = ?";
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
	public List<CommunityVO> communitySearchList(int startRow, int endRow, String key, String val) {
		List<CommunityVO> list = new ArrayList<>();
		CommunityVO vo;
		String sql = " SELECT * FROM (SELECT ROWNUM AS RNUM, "
				+ "A. * FROM (SELECT * FROM COMMUNITY ORDER BY COM_DATE DESC, COM_CATEGORY) A) "
				+ " WHERE " + key + " like '%" + val + "%' and RNUM BETWEEN ? AND ?";

		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new CommunityVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getString("COM_DATE"));
				vo.setLocation(rs.getString("LOCATION"));
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
	public int getBoardCount() {
		String sql = "SELECT COUNT(*) AS CNT FROM COMMUNITY";
		int cnt = 0;
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("CNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int getSearchCount(String key, String val) {
		String sql = "SELECT COUNT(*) AS CNT FROM COMMUNITY WHERE " + key + " LIKE '%" + val + "%'";
		int cnt = 0;
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("CNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}



}
