package co.nullception.udongmarket.comments.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.comments.service.CommentsService;
import co.nullception.udongmarket.comments.vo.CommentsVO;

public class CommentsServiceImpl implements CommentsService {
	private DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	@Override
	public List<CommentsVO> commentList(int boardId) {
		
		List<CommentsVO> list = new ArrayList<>();
		CommentsVO vo;
		String sql = "select * from comments where board_id = ? order by comments_date";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new CommentsVO();
				vo.setBoardId(rs.getInt("BOARD_ID"));
				vo.setCommentsId(rs.getInt("COMMENTS_ID"));
				vo.setCommentsNick(rs.getString("COMMENTS_NICK"));
				vo.setCommentsContent(rs.getString("COMMENTS_CONTENT"));
				vo.setCommentsDate(rs.getString("COMMENTS_DATE"));
				vo.setBoardNick(rs.getString("BOARD_NICK"));
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
	public int commentInsert(CommentsVO vo) {
		// 댓글 입력
		int cnt = 0;
		String sql = "insert into comments (board_id, comments_id, comments_content, comments_nick, board_nick) values( ?, comments_seq.nextval, ?, ?, ?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardId());
			psmt.setString(2, vo.getCommentsContent());
			psmt.setString(3, vo.getCommentsNick());
			psmt.setString(4, vo.getBoardNick());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int commentDelte(int commentsId) {
		// 댓글 삭제
		int cnt = 0;
		String sql = "delete from comments where comments_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commentsId);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public int CommentUpdate(CommentsVO vo) {
		//코멘트 수정
		int cnt = 0;
		String sql = "update comments set COMMENTS_CONTENT = ? where comments_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getCommentsContent());
			psmt.setInt(2, vo.getCommentsId());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

}
