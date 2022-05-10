package bbs.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Config;

public class BoardDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	int res = 0;
	
	public ArrayList<BoardDTO> getReviewList(int page, int pageItem) {
		ArrayList<BoardDTO> reviewList = new ArrayList<BoardDTO>();
		try{
			con = Config.getConnection();
			sql = "select no, filename from review order by no limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, page);
			pstmt.setInt(2, pageItem);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
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
	
	public BoardDTO showReview(int no) {
		BoardDTO review = new BoardDTO();
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
	
	public ArrayList<BoardDTO> getNoticeList(String cate, int pageNum, int pageItemMax) {
		ArrayList<BoardDTO> noticeList = new ArrayList<BoardDTO>();
		try{
			con = Config.getConnection();
			sql = "select no, title, content, filename, date, cate from notice where cate = ? order by no limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			pstmt.setInt(2, pageNum);
			pstmt.setInt(3, pageItemMax);
			
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFileName(rs.getString("filename"));
				dto.setDate(rs.getString("date"));
				dto.setCate(rs.getString("cate"));
				noticeList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return noticeList;
	}
	
	public ArrayList<BoardDTO> getNoticeList(int pageNum, int pageItemMax) {
		ArrayList<BoardDTO> noticeList = new ArrayList<BoardDTO>();
		try{
			con = Config.getConnection();
			sql = "select no, title, content, filename, date, cate from notice order by no limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageNum);
			pstmt.setInt(2, pageItemMax);
			
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFileName(rs.getString("filename"));
				dto.setDate(rs.getString("date"));
				dto.setCate(rs.getString("cate"));
				noticeList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return noticeList;
	}
	
	public BoardDTO getNotice(int no) {
		BoardDTO article = new BoardDTO();
		try{
			con = Config.getConnection();
			sql = "select no, title, content, filename, date, cate from notice where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				article.setNo(rs.getInt("no"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setFileName(rs.getString("filename"));
				article.setDate(rs.getString("date"));
				article.setCate(rs.getString("cate"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return article;
	}
	
	public int getNoticeListPageMax(int pageItemMax) {
		int pageMax = 0;
		
		try {
			con = Config.getConnection();
			sql = "select ceil(count(*)/?) as pagemax from notice";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageItemMax);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) pageMax = rs.getInt("pagemax");
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageMax;
	}
	
	public int getNoticeListPageMax(String cate, int pageItemMax) {
		int pageMax = 0;
		
		try {
			con = Config.getConnection();
			sql = "select ceil(count(*)/?) as pagemax from notice where cate = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageItemMax);
			pstmt.setString(2, cate);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) pageMax = rs.getInt("pagemax");
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageMax;
	}
	
	public void insertReview(String id, String nick, String date, BoardDTO dto) {
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
	
	public int getReviewPageMax(int pageItemMax) {
		int pageMax = 0;
		try {
			con = Config.getConnection();
			sql = "select ceil(count(*)/?) as pagemax from review";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageItemMax);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) pageMax = rs.getInt("pagemax");
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageMax;
	}
}
