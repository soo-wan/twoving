package com.himedia.twoving.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.himedia.twoving.util.DBman;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PassTicketVO;

public class PassTicketDAO {
	private PassTicketDAO() {
		
	}
	
	private static PassTicketDAO itc = new PassTicketDAO();
	
	public static PassTicketDAO getInstance() {
		return itc;
	}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void updateMemberPassTicket(String userid, int ptseq) {
		
		con = DBman.getConnection();
		
		String sql = "update member set ptseq=? where userid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, ptseq);
			pstmt.setString(2, userid);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBman.close(con, pstmt, rs);
		}
	}

	public MemberVO selectMemberPassTicket(String userid) {
		MemberVO memberVO = null;
		
		con = DBman.getConnection();
		
		String sql = "select* from member where userid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setUserid(rs.getString("userid"));
				memberVO.setPtseq(rs.getInt("ptseq"));
				memberVO.setPwd(rs.getString("pwd"));
				memberVO.setName(rs.getString("name"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setIndate(rs.getTimestamp("indate"));
				memberVO.setUseyn(rs.getString("useyn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBman.close(con, pstmt, rs);
		}
		
		return memberVO;
		
	}

	public PassTicketVO selectOnePassTicket(String userid) {
		PassTicketVO passTicketVO = null;
		
		con = DBman.getConnection();
		
		String sql = "select* from member where userid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				passTicketVO = new PassTicketVO();
				
				passTicketVO.setPtseq(rs.getInt("ptseq"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBman.close(con, pstmt, rs);
		}
		
		return passTicketVO;
	}
}
