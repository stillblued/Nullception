package co.nullception.udonmarket.community.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import co.nullception.udonmarket.comm.DataSource;
import co.nullception.udonmarket.community.service.CommunityService;
import co.nullception.udonmarket.community.vo.CommunityVO;

public class CommunityServiceImpl implements CommunityService {

	private DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	@Override
	public List<CommunityVO> communityList() {
		List<CommunityVO> list = new ArrayList<>();
		CommunityVO vo;
		String sql = "SELECT * FROM COMMUNITY ORDER BY COMMUNITY_ID DESC";

		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new CommunityVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getDate("COM_DATE"));
				vo.setComHit(rs.getInt("COM_HIT"));
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
		String sql = "SELECT * FROM COMMUNITY WHERE COMMUNITY_ID =?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo = new CommunityVO ();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setComCategory(rs.getString("COM_CATEGORY"));
				vo.setComTitle(rs.getString("COM_TITLE"));
				vo.setComContent(rs.getString("COM_CONTENT"));
				vo.setComDate(rs.getDate("COM_DATE"));
				vo.setComHit(rs.getInt("COM_HIT"));
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
	public int CommunityInsert(CommunityVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CommunityUpdate(CommunityVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CommunityDelete(CommunityVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommunityVO> communitySearchList(String key, String val) {
		// TODO Auto-generated method stub
		return null;
	}

}
