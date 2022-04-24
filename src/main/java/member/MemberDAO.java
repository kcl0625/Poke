package member;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.Config;

public class MemberDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	
	public void join(MemberDTO dto) {
		try {
			con = Config.getConnection();
			sql = "insert into member(id, pw, name, nick, zip, add1, add2, tel, email, admin) values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNick());
			pstmt.setString(5, dto.getZip());
			pstmt.setString(6, dto.getAdd1());
			pstmt.setString(7, dto.getAdd2());
			pstmt.setString(8, dto.getTel());
			pstmt.setString(9, dto.getEmail());
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateMember(MemberDTO dto) {
		try {
			con = Config.getConnection();
			sql = "update member(pw, name, nick, zip, add1, add2, tel, email) values(?,?,?,?,?,?,?,?) where id = ?";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getNick());
			pstmt.setString(4, dto.getZip());
			pstmt.setString(5, dto.getAdd1());
			pstmt.setString(6, dto.getAdd2());
			pstmt.setString(7, dto.getTel());
			pstmt.setString(8, dto.getEmail());
			pstmt.setString(9, dto.getId());
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember(MemberDTO dto) {
		try {
			con = Config.getConnection();
			sql = "delete member where id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO member = new MemberDTO();
		try {
			con = Config.getConnection();
			sql = "select name, nick, zip, add1, add2, tel, email from member where id = ?";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setName(rs.getString("name"));
				dto.setNick(rs.getString("nick"));
				dto.setZip(rs.getString("zip"));
				dto.setAdd1(rs.getString("add1"));
				dto.setAdd2(rs.getString("add2"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public String idChk(String id) {
		String res = "";
		try {
			con = Config.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			if(rs.next()) res = "no"; //������ ��
			else res = "yes";
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}