package bbs.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Config;
import order.ItemDTO;

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
	
	//my review
	public ArrayList<BoardDTO> getMyReviewList(int page, int pageItem, String id) {
		ArrayList<BoardDTO> reviewList = new ArrayList<BoardDTO>();
		try{
			con = Config.getConnection();
			sql = "select no, filename from review where id = ? order by no limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, page);
			pstmt.setInt(3, pageItem);
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
	
	public int getMyReviewPageMax(int pageItemMax, String id) {
		int pageMax = 0;
		try {
			con = Config.getConnection();
			sql = "select ceil(count(*)/?) as pagemax from review where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageItemMax);
			pstmt.setString(2, id);
			
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
	
	public int getMyReviewLength(String id) {
		int myReviewLength = 0;
		try{
			con = Config.getConnection();
			sql = "select count(*) as cnt from review where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) myReviewLength = rs.getInt("cnt");
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return myReviewLength;
	}
	
	//리뷰 보기
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
				review.setId(rs.getString("id"));
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
	
	public void insertReview(String id, String date, BoardDTO dto) {
		try {
			con = Config.getConnection();
			sql = "insert into review(id, pokename, ingre, star, content, date, filename) values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, dto.getPoke());
			pstmt.setString(3, dto.getIngre());
			pstmt.setInt(4, dto.getStar());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, date);
			pstmt.setString(7, dto.getFileName());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> getBoardList(String cate, int pageNum, int pageItemMax, String board) {
		ArrayList<BoardDTO> noticeList = new ArrayList<BoardDTO>();
		try{
			con = Config.getConnection();
			sql = "select id, no, title, content, filename, date, cate from `";
			sql += board;
			sql += "` where cate = ? order by no limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			pstmt.setInt(2, pageItemMax * pageNum);
			pstmt.setInt(3, pageItemMax);
			
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
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
	
	public ArrayList<BoardDTO> getBoardList(int pageNum, int pageItemMax, String board) {
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try{
			con = Config.getConnection();
			sql = "select id, no, title, date, cate from `";
			sql += board;
			sql += "` order by no limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageItemMax * pageNum);
			pstmt.setInt(2, pageItemMax);
			
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getString("date"));
				dto.setCate(rs.getString("cate"));
				boardList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return boardList;
	}
	
	public BoardDTO getBoard(int no, String board) {
		BoardDTO article = new BoardDTO();
		try{
			con = Config.getConnection();
			sql = "select id, no, title, content, filename, date, cate from `";
			sql += board;
			sql += "` where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				article.setId(rs.getString("id"));
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
	
	public int getBoardListPageMax(int pageItemMax, String board) {
		int pageMax = 0;
		
		try {
			con = Config.getConnection();
			sql = "select ceil(count(*)/?) as pagemax from `";
			sql += board;
			sql += "`";
			
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
	
	public int getBoardListPageMax(String cate, int pageItemMax, String board) {
		int pageMax = 0;
		
		try {
			con = Config.getConnection();
			sql = "select ceil(count(*)/?) as pagemax from `";
			sql += board;
			sql += "` where cate = ?";
			
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
	
	public ArrayList<BoardDTO> searchBoard(int pageNum, int pageItemMax, String keyword, String board) { //카테고리 선택
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			con = Config.getConnection();
			sql = "select no, title, date, cate from `";
			sql += board;
			sql += "` where title like '%";
			sql += keyword;
			sql += "%' order by no limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageItemMax * pageNum);
			pstmt.setInt(2, pageItemMax);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getString("date"));
				dto.setCate(rs.getString("cate"));
				boardList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return boardList;
	}
	
	public int getSearchBoardListPageMax(String keyword, int pageItemMax, String board) {
		int pageMax = 0;
		
		try {
			con = Config.getConnection();
			sql = "select ceil(count(*)/?) as pagemax from `";
			sql += board;
			sql += "` where title like '%";
			sql += keyword;
			sql += "%'";
			
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
	
	public void insertBoard(String id, String board, BoardDTO dto, String date) {
		try {
			con = Config.getConnection();
			sql = "insert into `";
			sql += board;
			sql += "` (id, title, content, filename, date, cate) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFileName());
			pstmt.setString(5, date);
			pstmt.setString(6, dto.getCate());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> getMyQnaList(String id, int pageNum, int pageItemMax, String board) {
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try{
			con = Config.getConnection();
			sql = "select no, title, date, cate from `";
			sql += board;
			sql += "` where id = ? order by no limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pageItemMax * pageNum);
			pstmt.setInt(3, pageItemMax);
			
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getString("date"));
				dto.setCate(rs.getString("cate"));
				boardList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return boardList;
	}
}
