package co.nullception.udongmarket.community.serviceImpl;

import java.sql.Connection;
import java.sql.Date;
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
	public List<CommunityVO> communityList() {
		List<CommunityVO> list = new ArrayList<>();
		CommunityVO vo;
		String sql = "SELECT * FROM COMMUNITY ORDER BY BOARD_ID DESC";

		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new CommunityVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getString("COM_DATE"));
				vo.setComHit(rs.getInt("COM_HIT"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setMemberLocation(rs.getString("MEMBER_LOCATION"));
				vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));

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
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getString("COM_DATE"));
				vo.setComHit(rs.getInt("COM_HIT"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setMemberLocation(rs.getString("MEMBER_LOCATION"));
				vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));

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
		// 글 등록
		int n = 0;
		String sql = "INSERT INTO COMMUNITY VALUES(NUMBERS.NEXTVAL, ?, ? ,? ,?,0,?,?)";

		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getComCategory());
			psmt.setString(2, vo.getComTitle());
			psmt.setString(3, vo.getComContent());
			psmt.setString(4, vo.getComDate());
			psmt.setString(5, vo.getMemberLocation());
			psmt.setString(6, vo.getMemberNickname());

			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return n;
	}

	@Override
	public int communityUpdate(CommunityVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int communityDelete(CommunityVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommunityVO> communitySearchList(String key, String val) {
		// 목록검색
		List<CommunityVO> list = new ArrayList<>();
		CommunityVO vo;
		String sql = "SELECT * FROM COMMUNITY WHERE " + key + " LIKE '%" + val + "%'";

		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new CommunityVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getString("COM_DATE"));
				vo.setComHit(rs.getInt("COM_HIT"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setMemberLocation(rs.getString("MEMBER_LOCATION"));
				vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}

		return list;
	}

}
