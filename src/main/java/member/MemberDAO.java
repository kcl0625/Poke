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
	int res = 0;
	
	public int join(MemberDTO dto) {
		try {
			con = Config.getConnection();
			sql = "insert into member(id, pw, name, nick, zip, add1, add2, tel, email, admin) values(?,?,?,?,?,?,?,?,?, 0)";
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
			
			res = pstmt.executeUpdate();
			pstmt.close();
			System.out.println("회원가입 성공!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateMember(MemberDTO dto) {
		try {
			con = Config.getConnection();
			sql = "update member(pw, name, nick, zip, add1, add2, tel, email) values(?,?,?,?,?,?,?,?) where id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getNick());
			pstmt.setString(4, dto.getZip());
			pstmt.setString(5, dto.getAdd1());
			pstmt.setString(6, dto.getAdd2());
			pstmt.setString(7, dto.getTel());
			pstmt.setString(8, dto.getEmail());
			pstmt.setString(9, dto.getId());
			
			res = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int deleteMember(MemberDTO dto) {
		try {
			con = Config.getConnection();
			sql = "delete member where id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			
			res = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public ArrayList<MemberDTO> getList(String id) {
		ArrayList<MemberDTO> member = new ArrayList<MemberDTO>();
		try {
			con = Config.getConnection();
			sql = "select pw, name, nick, zip, add1, add2, tel, email from member where id = ?";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setNick(rs.getString("nick"));
				dto.setZip(rs.getString("zip"));
				dto.setAdd1(rs.getString("add1"));
				dto.setAdd2(rs.getString("add2"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				
				member.add(dto);
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
			
			if(rs.next()) res = "no"; //존재할 때
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