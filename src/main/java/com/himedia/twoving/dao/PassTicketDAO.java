package com.himedia.twoving.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.himedia.twoving.util.DBman;

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
}
