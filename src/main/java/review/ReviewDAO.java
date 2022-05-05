package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Config;
import review.ReviewDTO;

public class ReviewDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	int res = 0;
	
	public ArrayList<ReviewDTO> getReviewList() {
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		try{
			con = Config.getConnection();
			sql = "select no, filename from review order by no";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setNo(rs.getInt("no"));
				dto.setFileName(rs.getString("filename"));
				reviewList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return reviewList;
	}
	
	public ReviewDTO showReview(int no) {
		ReviewDTO review = new ReviewDTO();
		try {
			con = Config.getConnection();
			sql = "select * from review where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				review.setNick(rs.getString("nick"));
				review.setPoke(rs.getString("pokename"));
				review.setIngre(rs.getString("ingre"));
				review.setStar(rs.getInt("star"));
				review.setContent(rs.getString("content"));
				review.setFileName(rs.getString("filename"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return review;
	}
	
	public void insertReview(String id, String nick, String date, ReviewDTO dto) {
		try {
			con = Config.getConnection();
			sql = "insert into review(id, nick, pokename, ingre, star, content, date, filename) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, nick);
			pstmt.setString(3, dto.getPoke());
			pstmt.setString(4, dto.getIngre());
			pstmt.setInt(5, dto.getStar());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, date);
			pstmt.setString(8, dto.getFileName());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
