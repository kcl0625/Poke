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
			sql = "select no from review order by no";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setNo(rs.getInt("no"));
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
	
	public ArrayList<ReviewDTO> showReview(int no) {
		ArrayList<ReviewDTO> review = new ArrayList<ReviewDTO>();
		try {
			con = Config.getConnection();
			sql = "select star, content from review where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setStar(rs.getInt("star"));
				dto.setContent(rs.getString("content"));
				review.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return review;
	}
}
