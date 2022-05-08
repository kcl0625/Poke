package bbs.board;
import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Config;

public class PagingDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	
	int start;
	int end;
	
	public ArrayList<BoardDTO> paging() {
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO> ();
		try {
			con = Config.getConnection();
			sql = "select * from poke limit ?, ?";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			//int page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return articleList;
	}
}
