<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration" %>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="review.ReviewDTO" %>
<%@page import="member.MemberDTO" %>
<%@include file="/config.jsp" %>

<jsp:useBean id="reviewBean" class="review.ReviewDAO" />

<%
request.setCharacterEncoding("utf-8");

MultipartRequest multi = null;
String dir = request.getServletContext().getRealPath("data");
int max = 1024*1024*15;
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

String filename = "";
String originalfile = "";
String menu = "";
String tit = "";
int rating = 0;
String taste = "";
String quantity = "";
String quality = "";
String contents = "";

try {
	multi = new MultipartRequest(request, dir, max, "utf-8", policy); //서버 데이터 폴더에 파일 업로드
	menu = multi.getParameter("menu");
    tit = multi.getParameter("tit");    		
    rating = Integer.parseInt(multi.getParameter("rating"));
    taste = multi.getParameter("taste");
    quantity = multi.getParameter("quantity");
    quality = multi.getParameter("quality");
    contents = multi.getParameter("contents");
     
    Enumeration files = multi.getFileNames(); 
   	String file = (String) files.nextElement();
   	filename = multi.getFilesystemName(file); //서버에 업로드된 파일명
   	originalfile = multi.getOriginalFileName(file); //원래 선택한 원본파일명
} catch(Exception e) {
    e.printStackTrace();
}

reviewBean.setId(sessionId); //multipartrequest쓰면 다 일일히 해줘야하나봄
reviewBean.setNick(sessionId);
reviewBean.setDate(date);
reviewBean.setStar(rating);
reviewBean.setContents(contents);
reviewBean.setFilename(filename);

ReviewDAO dao = new ReviewDAO();
dao.insertReview(rbean);

MemberDTO member = new MemberDTO();
System.out.println(member.getNick());
%>