package co.nullception.udongmarket.myPageImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.nullception.udongmarket.comm.DataSource;
import co.nullception.udongmarket.community.vo.CommunityVO;
import co.nullception.udongmarket.deal.vo.DealVO;
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
		String sql = "update member set phone = ?, location = ?, email = ? where member_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getPhone());
			psmt.setString(2, vo.getLocation());
			psmt.setString(3, vo.getEmail());
			psmt.setString(4, vo.getMemberId());
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

	@Override
	public List<DealVO> dealSelectList(String nickname, String category) {
		// 닉네임이 ? 인 사람이 카테고리별로 deal 게시판에 쓴 글 조회
		List<DealVO> list = new ArrayList<DealVO>();
		
		String sql = "select board_id, nickname, deal_category, deal_title, deal_content, deal_date, deal_state, location from deal "
				+ "where nickname = ? and deal_category = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickname);
			psmt.setString(2, category);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				DealVO vo = new DealVO();
				vo.setNickname(rs.getString("nickname"));
				vo.setBoardId(Integer.parseInt(rs.getString("board_id")));
				vo.setDealCategory(rs.getString("deal_category"));
				vo.setDealTitle(rs.getString("deal_title"));
				vo.setDealContent(rs.getString("deal_content"));
				vo.setDealDate(rs.getString("deal_date"));
				vo.setDealState(rs.getString("deal_state"));
				vo.setLocation(rs.getString("location"));
				
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
	public List<CommunityVO> commSelectList(String nickname, String category) {
		// 커뮤니티 게시판에 쓴 글 조회
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		String sql = "select board_id, nickname, com_category, com_title, com_content, com_date, location "
				+ "from community where nickname = ? and com_category = ?";
		
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickname);
			psmt.setString(2, category);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CommunityVO vo = new CommunityVO();
				vo.setBoardId(Integer.parseInt(rs.getString("board_id")));
				vo.setNickname(rs.getString("nickname"));
				vo.setComCategory(rs.getString("com_category"));
				vo.setComTitle(rs.getString("com_title"));
				vo.setComContent(rs.getString("com_content"));
				vo.setComDate(rs.getString("com_date"));
				vo.setLocation(rs.getString("location"));
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
	public List<DealVO> likesSelectList(String nickname) {
		// 거래게시판에 누른 좋아요 게시글 리스트 확인
		List<DealVO> list = new ArrayList<DealVO>();
		String sql = "select board_id, nickname, deal_category, deal_title, deal_content, deal_date, "
				+ "deal_state, location from deal "
				+ "where board_id in (select board_id from likes where nickname = ?)";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickname);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				DealVO vo = new DealVO();
				vo.setBoardId(Integer.parseInt(rs.getString("board_id")));
				vo.setNickname(rs.getString("nickname"));
				vo.setDealCategory(rs.getString("deal_category"));
				vo.setDealTitle(rs.getString("deal_title"));
				vo.setDealContent(rs.getString("deal_content"));
				vo.setDealDate(rs.getString("deal_date"));
				vo.setDealState(rs.getString("deal_state"));
				vo.setLocation(rs.getString("location"));
				
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
	public int updateDealState(String dealState, int boardId) {
		// boardId를 받아와서 해당 게시글의 거래상태 변경
		int r = 0;
		String sql = "update deal set deal_state = ? where board_id = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dealState);
			psmt.setInt(2, boardId);
			r = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		return r;
	}

	@Override
	public int checkCommentState(String nickname) {
		// count 값을 int 변수에 담아주고 출력해보기
		int r = 0;
		int count = 0;
		String sql = "select count(*) as cnt from comments where comments_state = '읽지않음' and board_nick = ?";
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickname);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				//rs.next의 값을 count에 저장
				count = rs.getInt("cnt");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		System.out.println("count : " + count);
		return count;
	}

	@Override
	public List<DealVO> dealCommentsList(String boardNick) {
		// 거래 게시판 = 댓글달린 게시물 리스트
		List<DealVO> list = new ArrayList<DealVO>();
		String sql = "select * from deal where board_id in (select board_id from comments where board_nick = ? and comments_state='읽지않음')";
		
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boardNick);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				DealVO vo = new DealVO();
				vo.setBoardId(Integer.parseInt(rs.getString("board_id")));
				vo.setNickname(rs.getString("nickname"));
				vo.setDealCategory(rs.getString("deal_category"));
				vo.setDealTitle(rs.getString("deal_title"));
				vo.setDealContent(rs.getString("deal_content"));
				vo.setDealDate(rs.getString("deal_date"));
				vo.setPrice(Integer.parseInt(rs.getString("price")));
				vo.setDealState(rs.getString("deal_state"));
				vo.setLocation(rs.getString("location"));
				vo.setAttach(rs.getString("attach"));
				vo.setAttachDir(rs.getString("attach_dir"));
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
	public List<CommunityVO> commCommentsList(String boardNick) {
		// 커뮤니티 게시판 = 댓글달린 게시물 리스트
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		String sql = "select * from community where board_id in (select board_id from comments where board_nick = ? and comments_state='읽지않음')";
		
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boardNick);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CommunityVO vo = new CommunityVO();
				vo.setBoardId(Integer.parseInt(rs.getString("board_id")));
				vo.setNickname(rs.getString("nickname"));
				vo.setComCategory(rs.getString("com_category"));
				vo.setComTitle(rs.getString("com_title"));
				vo.setComContent(rs.getString("com_content"));
				vo.setComDate(rs.getString("com_date"));
				vo.setLocation(rs.getString("location"));
				vo.setAttach(rs.getString("attach"));
				vo.setAttachDir(rs.getString("attach_dir"));
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
	public int updateComments(String boardNick) {
		// 댓글 업데이트(닉네임 기준)
		int r = 0;
		String sql = "update comments set comments_state = '읽음' where board_nick = ?";
		
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boardNick);
			r = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		
		return r;
	}

	@Override
	public int updateOneComments(int boardId) {
		// 댓글 1개 업데이트(boardId 기준)
		int r = 0;
		String sql = "update comments set comments_state = '읽음' where board_id = ?";
		
		try {
			conn = dao.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardId);
			r = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dao.disconnect();
		}
		
		return r;
	}






}
