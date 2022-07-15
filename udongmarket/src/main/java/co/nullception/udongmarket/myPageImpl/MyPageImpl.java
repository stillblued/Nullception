package co.nullception.udongmarket.myPageImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.member.vo.MemberVO;
import co.nullception.udongmarket.myPage.MyPage;

public class MyPageImpl implements MyPage {

	private  DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	@Override
	public MemberVO memberSelectOne(MemberVO vo) {
		// 내 정보(단건조회)
		String sql = "select * from member where member_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPassword(rs.getString("member_password"));
				vo.setNickname(rs.getString("nickname"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("email"));
				vo.setLocation(rs.getString("location"));
				vo.setMannerTemp(rs.getInt("manner_temp"));
				vo.setAuthor(rs.getString("author"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return vo;
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// 회원수정(닉네임, 연락처, 지역만 변경가능)
		int r = 0;
		String sql = "update member set phone = ?, location = ? where member_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getPhone());
			psmt.setString(2, vo.getLocation());
			psmt.setString(3, vo.getMemberId());
			r = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return r;
	}

	@Override
	public int memberDelete(String id) {
		// 회원탈퇴
		int r = 0;
		String sql = "delete from member where member_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			r = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return r;
	}



}
