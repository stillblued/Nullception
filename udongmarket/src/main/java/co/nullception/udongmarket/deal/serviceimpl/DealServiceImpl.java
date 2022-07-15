package co.nullception.udongmarket.deal.serviceimpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealServiceImpl implements DealService {
	private DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	@Override
	public List<DealVO> dealSelectList() {
		// 전체 목록
		List<DealVO> list = new ArrayList<>();
		DealVO vo;
		String sql = "SELECT * FROM DEAL ORDER BY BOARD_ID DESC";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new DealVO();
				vo.setBoardId(rs.getInt("board_id"));
				vo.setDealCategory(rs.getString("deal_category"));
				vo.setDealTitle(rs.getString("deal_title"));
				vo.setDealContent(rs.getString("deal_content"));
				vo.setDealDate(rs.getString("deal_date"));
				vo.setDealPrice(rs.getInt("deal_price"));
				vo.setDealState(rs.getString("deal_state"));
				vo.setDealAttach(rs.getString("deal_attach"));
				vo.setDealAttachDir(rs.getString("deal_attach_dir"));
				vo.setMemberLocation(rs.getString("member_location"));
				vo.setMemberNickname(rs.getString("member_nickname"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return list;
	}

	@Override
	public DealVO dealSelect(DealVO vo) {
		// 단건 조회
		String sql = "SELECT * FROM DEAL WHERE BOARD_ID = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setBoardId(rs.getInt("board_id"));
				vo.setDealCategory(rs.getString("deal_category"));
				vo.setDealTitle(rs.getString("deal_title"));
				vo.setDealContent(rs.getString("deal_content"));
				vo.setDealDate(rs.getString("deal_date"));
				vo.setDealPrice(rs.getInt("deal_price"));
				vo.setDealState(rs.getString("deal_state"));
				vo.setDealAttach(rs.getString("deal_attach"));
				vo.setDealAttachDir(rs.getString("deal_attach_dir"));
				vo.setMemberLocation(rs.getString("member_location"));
				vo.setMemberNickname(rs.getString("member_nickname"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return vo;
	}

	@Override
	public int dealInsert(DealVO vo) {
		// 글 등록
		int cnt = 0;
		String sql = "INSERT INTO DEAL VALUES(ID_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,0,?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getDealCategory());
			psmt.setString(2, vo.getDealTitle());
			psmt.setString(3, vo.getDealContent());
			psmt.setString(4, vo.getDealDate());
			psmt.setInt(5, vo.getDealPrice());
			psmt.setString(6, vo.getDealState());
			psmt.setString(7, vo.getDealAttach());
			psmt.setString(8, vo.getDealAttachDir());
			psmt.setString(9, vo.getMemberLocation());
			psmt.setString(10, vo.getMemberNickname());
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int dealDelete(DealVO vo) {
		// 글 삭제
		int cnt = 0;
		String sql = "DELETE * FROM DEAL WHERE BOARD_ID = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			cnt = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int dealUpdate(DealVO vo) {
		// 글 수정
		int cnt = 0;
		String sql = "UPDATE DEAL SET DEAL_CATEGORY = ?, DEAL_TITLE = ?, DEAL_CONTENT = ?"
				+ "DEAL_PRICE = ?, DEAL_STATE = ?, DEAL_ATTACH = ?, MEMBER_LOCATION = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getDealCategory());
			psmt.setString(2, vo.getDealTitle());
			psmt.setString(3, vo.getDealContent());
			psmt.setInt(4, vo.getDealPrice());
			psmt.setString(5, vo.getDealState());
			psmt.setString(6, vo.getDealAttach());
			psmt.setString(7, vo.getMemberLocation());
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public List<DealVO> dealSearchList(String key, String val) {
		// 목록 검색
		List<DealVO> list = new ArrayList<>();
		DealVO vo;
		String sql = "SELECT * FROM DEAL WHERE " + key + " LIKE '%" + val + "%'";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new DealVO();
				vo.setBoardId(rs.getInt("board_id"));
				vo.setDealCategory(rs.getString("deal_category"));
				vo.setDealTitle(rs.getString("deal_title"));
				vo.setDealContent(rs.getString("deal_content"));
				vo.setMemberLocation(rs.getString("member_location"));
				vo.setMemberNickname(rs.getString("member_nickname"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return list;
	}
	
}
