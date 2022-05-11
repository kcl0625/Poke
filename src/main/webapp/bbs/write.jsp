<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="bbs.board.*" %>
<%@page import="member.*" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");

MultipartRequest multi = null;
String dir = request.getServletContext().getRealPath("data/member/" + sessionId);
int max = 1024*1024*15;
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

File folder = new File(dir);
if (!folder.exists()) {
	try{
		folder.mkdir(); //폴더 생성
    } catch(Exception e){
	    e.printStackTrace();
	}        
}

String board = "";
String title = "";
String content = "";
String filename = "";
String originalfile = "";
String cate = "";

try {
	multi = new MultipartRequest(request, dir, max, "utf-8", policy); //서버 데이터 폴더에 파일 업로드
	board = multi.getParameter("board");
	title = multi.getParameter("title");		
	content = multi.getParameter("content");
	cate = multi.getParameter("cate");
    
    Enumeration files = multi.getFileNames(); 
   	String file = (String) files.nextElement();
   	filename = multi.getFilesystemName(file); //서버에 업로드된 파일명
   	originalfile = multi.getOriginalFileName(file); //원래 선택한 원본파일명
} catch(Exception e) {
    e.printStackTrace();
}

BoardDTO article = new BoardDTO();
BoardDAO dao = new BoardDAO();

LocalDateTime now = LocalDateTime.now();
String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

article.setTitle(title);
article.setContent(content);
article.setCate(cate);
article.setFileName(filename);

dao.insertBoard(sessionId, board, article, formatedNow);
%>
<script>history.back();</script>