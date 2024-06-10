package com.himedia.twoving.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.himedia.twoving.util.DBman;
import com.himedia.twoving.vo.steamedVO;

public class steamedDao {

	private steamedDao() {}
	private static steamedDao itc = new steamedDao();
	public static steamedDao getInstance() {return itc;}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void insertsteamed(steamedVO svo) {
		String sql = "insert into steamed(userid, pseq, result) values (?, ?, ?)";
		con = DBman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,svo.getUserid());
			pstmt.setInt(2,svo.getPseq());
            pstmt.setString(3,svo.getResult());
			pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally { DBman.close(con, pstmt, rs);}
	}
	
	public void deletsteamed(int pseq) {
		con = DBman.getConnection();
		String sql = "delete from steamed where pseq=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pseq);
			pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		}finally { DBman.close(con, pstmt, rs);}

	}
	
	public steamedVO getsteamed(int sseq) {
		steamedVO svo = new steamedVO();
		con = DBman.getConnection();
		String sql = "select * from steamed_view where sseq = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				svo.setSseq(rs.getInt("sseq"));				
				svo.setPseq(rs.getInt("pseq"));
				svo.setKind(rs.getInt("kind"));
				svo.setUserid(rs.getString("userid"));
				svo.setMname(rs.getString("mname"));
				svo.setPtitle(rs.getString("ptitle"));
				svo.setSavefilename(rs.getString("savefilename"));
				svo.setIndate(rs.getTimestamp("indate"));
				svo.setResult(rs.getString("result"));	
			}
		} catch (SQLException e) {e.printStackTrace();
		}finally { DBman.close(con, pstmt, rs);}		
		return svo;
	}
	
	public ArrayList<steamedVO> steamedview(String userid , int pseq) {
		ArrayList<steamedVO> list = new ArrayList<steamedVO>();
		con = DBman.getConnection();
		String sql = "select * from steamed_view where userid=? and pseq=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setInt(2,pseq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				steamedVO svo = new steamedVO();
				svo.setSseq(rs.getInt("sseq"));				
				svo.setPseq(rs.getInt("pseq"));
				svo.setKind(rs.getInt("kind"));
				svo.setUserid(rs.getString("userid"));
				svo.setMname(rs.getString("mname"));
				svo.setPtitle(rs.getString("ptitle"));
				svo.setSavefilename(rs.getString("savefilename"));
				svo.setIndate(rs.getTimestamp("indate"));
				svo.setResult(rs.getString("result"));				
				list.add(svo);
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally { DBman.close(con, pstmt, rs);}
		System.out.println(list.size());
		return list;
	}
}
