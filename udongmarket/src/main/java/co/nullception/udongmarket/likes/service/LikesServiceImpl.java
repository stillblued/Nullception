package co.nullception.udongmarket.likes.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.likes.LikesService;
import co.nullception.udongmarket.likes.vo.LikesVO;

public class LikesServiceImpl implements LikesService {

	private DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	@Override
	public List<LikesVO> likesList() {
		List<LikesVO> list = new ArrayList<>();
		LikesVO vo;
		String sql = "select * from likes order by board_id desc";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new LikesVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setNickname(rs.getString("nickname"));

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
	public int likesInsert(LikesVO vo) {
		int cnt = 0;
		String sql = "insert into likes (BOARD_ID, NICKNAME)" + " values (?, ?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			psmt.setString(2, vo.getNickname());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int likesDelete(int boardId) {

		int cnt = 0;
		String sql = "delete from likes where board_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardId);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

}
