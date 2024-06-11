package com.himedia.twoving.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.himedia.twoving.util.DBman;
import com.himedia.twoving.vo.MemberVO;

public class MemberDao {
    private MemberDao() {}
    private static MemberDao instance = new MemberDao();

    public static MemberDao getInstance() {
        return instance;
    }
    
    Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

    public MemberVO getMember(String userid) {
        MemberVO mvo = null;
        try (Connection con = DBman.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM member WHERE userid = ?")) {
            pstmt.setString(1, userid);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    mvo = new MemberVO();
                    mvo.setUserid(rs.getString("userid"));
                    mvo.setPwd(rs.getString("pwd"));
                    mvo.setName(rs.getString("name"));
                    mvo.setEmail(rs.getString("email"));
                    mvo.setPhone(rs.getString("phone"));
                    mvo.setUseyn(rs.getString("useyn"));
                    mvo.setIndate(rs.getTimestamp("indate"));
                }
            }
        } catch (SQLException e) { e.printStackTrace();
        } finally { DBman.close(con, pstmt, rs);
        }
        return mvo;
    }

    public int insertMember(MemberVO mvo) {
        int result = 0;
        String sql = "INSERT INTO member(userid, pwd, name, email) VALUES (?, ?, ?, ?)";
        try (Connection con = DBman.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, mvo.getUserid());
            pstmt.setString(2, mvo.getPwd());
            pstmt.setString(3, mvo.getName());
            pstmt.setString(4, mvo.getEmail());
            result = pstmt.executeUpdate();
        } catch (SQLException e) { e.printStackTrace();
        } finally { DBman.close(con, pstmt, rs);
        }
        return result;
    }

    public void updateMember(MemberVO mvo) {
        String sql = "UPDATE member SET pwd = ?, name = ?, email = ?, phone=? WHERE userid = ?";
        try (Connection con = DBman.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, mvo.getPwd());
            pstmt.setString(2, mvo.getName());
            pstmt.setString(3, mvo.getEmail());
            pstmt.setString(4, mvo.getPhone());
            pstmt.setString(5, mvo.getUserid());
            pstmt.executeUpdate();
        }catch (SQLException e) { e.printStackTrace();
        } finally { DBman.close(con, pstmt, rs);
        }
    }

    public void deleteMember(String userid) {
    	Connection con = DBman.getConnection();
        con = DBman.getConnection();
        String sql = "update member set useyn='N' where userid =?";
        try {
        	pstmt = con.prepareStatement(sql);
        	PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.executeUpdate();
        } catch (SQLException e) { e.printStackTrace();
        } finally { DBman.close(con, pstmt, rs);
        }
     }

	public String getMemberId(String email) {
		String id = null;
		con = DBman.getConnection();
		String sql = "select userid from member where email=?"; 
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("userid");
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally { DBman.close(con, pstmt, rs); }
		return id;
	}

	public String getMemberEmail(String userId) {
		String email = null;
		con = DBman.getConnection();
		String sql = "select email from member where userid=?"; 
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString("email");
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally { DBman.close(con, pstmt, rs); }
		return email;
	}

	public void updateMemberPwd(String userid, String pwd) {
		Connection con = DBman.getConnection();
        con = DBman.getConnection();
        String sql = "update member set pwd=? where userid =?";
        try {
        	pstmt = con.prepareStatement(sql);
        	PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, pwd);
            pstmt.setString(2, userid);
            pstmt.executeUpdate();
        } catch (SQLException e) { e.printStackTrace();
        } finally { DBman.close(con, pstmt, rs);
        }
	}
}