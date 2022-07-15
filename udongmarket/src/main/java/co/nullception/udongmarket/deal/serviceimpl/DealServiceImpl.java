package co.nullception.udongmarket.deal.serviceimpl;

import java.sql.Connection;
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
		String sql = "SELECT * FROM DEAL ORDER BY BOARD_ID";
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
				vo.setPrice(rs.getInt("price"));
				vo.setDealState(rs.getString("deal_state"));
				vo.setAttach(rs.getString("attach"));
				vo.setDealHit(rs.getInt("deal_hit"));
				vo.setAttachDir(rs.getString("attach_dir"));
				vo.setLocation(rs.getString("location"));
				vo.setNickname(rs.getString("nickname"));
				
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
				vo.setPrice(rs.getInt("price"));
				vo.setDealState(rs.getString("deal_state"));
				vo.setAttach(rs.getString("attach"));
				vo.setDealHit(rs.getInt("deal_hit"));
				vo.setAttachDir(rs.getString("attach_dir"));
				vo.setLocation(rs.getString("location"));
				vo.setNickname(rs.getString("nickname"));
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
		String sql = "INSERT INTO DEAL (board_id, nickname, deal_category, deal_title, deal_content, price, location, attach, attach_dir) VALUES(ID_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getNickname());
			psmt.setString(2, vo.getDealCategory());
			psmt.setString(3, vo.getDealTitle());
			psmt.setString(4, vo.getDealContent());
			psmt.setInt(5, vo.getPrice());
			psmt.setString(6, vo.getLocation());
			psmt.setString(7, vo.getAttach());
			psmt.setString(8, vo.getAttachDir());
			
			cnt = psmt.executeUpdate();
			
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
		String sql = "UPDATE DEAL SET DEAL_CATEGORY = ?, DEAL_TITLE = ?, DEAL_CONTENT = ? "
				+ " PRICE = ?, DEAL_STATE = ?, ATTACH = ?, LOCATION = ? WHERE BOARD_ID =?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getDealCategory());
			psmt.setString(2, vo.getDealTitle());
			psmt.setString(3, vo.getDealContent());
			psmt.setInt(4, vo.getPrice());
			psmt.setString(5, vo.getDealState());
			psmt.setString(6, vo.getAttach());
			psmt.setString(7, vo.getLocation());
			psmt.setInt(8, vo.getBoardId());
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
				vo.setDealDate(rs.getString("deal_date"));
				vo.setPrice(rs.getInt("price"));
				vo.setDealState(rs.getString("deal_state"));
				vo.setAttach(rs.getString("attach"));
				vo.setDealHit(rs.getInt("deal_hit"));
				vo.setAttachDir(rs.getString("attach_dir"));
				vo.setLocation(rs.getString("location"));
				vo.setNickname(rs.getString("nickname"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return list;
	}
	
}
