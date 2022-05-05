<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="review.*" %>
<%@page import="member.*" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");

MultipartRequest multi = null;
String dir = request.getServletContext().getRealPath("data/review");
int max = 1024*1024*15;
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

String filename = "";
String originalfile = "";
String poke = "";
String ingre = "";
int rating = 0;
String content = "";

try {
	multi = new MultipartRequest(request, dir, max, "utf-8", policy); //서버 데이터 폴더에 파일 업로드
	poke = multi.getParameter("poke");
	ingre = multi.getParameter("ingre");		
    rating = Integer.parseInt(multi.getParameter("rating"));
    content = multi.getParameter("contents");
     
    Enumeration files = multi.getFileNames(); 
   	String file = (String) files.nextElement();
   	filename = multi.getFilesystemName(file); //서버에 업로드된 파일명
   	originalfile = multi.getOriginalFileName(file); //원래 선택한 원본파일명
} catch(Exception e) {
    e.printStackTrace();
}

MemberDTO member = new MemberDTO();
MemberDAO mDao = new MemberDAO();
member = mDao.getMember(sessionId);

ReviewDTO review = new ReviewDTO();
ReviewDAO rDao = new ReviewDAO();

LocalDateTime now = LocalDateTime.now();
String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

review.setPoke(poke);
review.setIngre(ingre);
review.setStar(rating);
review.setContent(content);
review.setFilename(filename);

rDao.insertReview(sessionId, member.getNick(), formatedNow, review);
%>