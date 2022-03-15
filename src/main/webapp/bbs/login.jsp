<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="config.Config" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String sql = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	con = Config.getConnection();
	sql = "select id, pw, admin from member where id = ? and pw = ?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	
	rs = pstmt.executeQuery();	

	if(rs.next()){
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("isAdm", rs.getString("admin"));
		
		response.sendRedirect("../index.jsp");	
	} else {
		response.sendRedirect("loginForm.jsp");
	}
%>