package co.nullception.udongmarket.member.seviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	private DataSource dao = DataSource.getInstance();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	@Override
	public List<MemberVO> memberSelectList() {
		// 전체조회
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO vo;
		String sql = "SELECT * FROM MEMBER";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPassword(rs.getString("member_password"));
				vo.setNickname(rs.getString("nickname"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("email"));
				vo.setLocation(rs.getNString("location"));
				vo.setMannerTemp(rs.getInt("manner_temp"));
				vo.setAuthor(rs.getNString("author"));
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
	public MemberVO memberSelectOne(MemberVO vo) {
		// 단일조회
		String sql = "SELECT * FROM WHERE MEMBER_ID = ?";
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
				vo.setEmail(rs.getString("emaile"));
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
	public MemberVO memberLogin(MemberVO vo) {
		// 로그인
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PASSWORD = ?";
		try { 
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPassword());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPassword(rs.getString("member_password"));
				vo.setNickname(rs.getString("nickname"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("emaile"));
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
	public int memberInsert(MemberVO vo) {
		// 회원가입
		int cnt = 0;
		String sql = "INSERT INTO MEMBER (MEMBER_ID, MEMBER_PASSWORD, NICKNAME, PHNONE" +
		             " EMAIL, LOCATION) VALUES(?, ?, ?, ?, ?, ?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPassword());
			psmt.setString(3, vo.getNickname());
			psmt.setString(4, vo.getPhone());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getLocation());
			
			cnt = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return cnt;
	}

	@Override
	public boolean isMemberIdCheck(String id) {
		// 아이디 중복체크
		return false;
	}

	@Override
	public boolean isMemberNickname(String nickname) {
		// 닉네임 중복체크
		return false;
	}

}
