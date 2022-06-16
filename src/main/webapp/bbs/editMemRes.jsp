<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="javax.servlet.http.*" %>
<%@ page import="member.*" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String id = request.getParameter("memId");

MultipartRequest multi = null;
String dir = request.getServletContext().getRealPath("data/member/");
String dir2 = request.getServletContext().getRealPath("data/member/" + id);
int max = 1024*1024*15;
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

File memFolder = new File(dir);
File memIdFolder = new File(dir2);

//System.out.println(dir2);
if (!memFolder.exists()) {
	try{
		memFolder.mkdir(); //폴더 생성
    } catch(Exception e){
	    e.printStackTrace();
	}        
} else {
	if (!memIdFolder.exists()) {
		try{
			memIdFolder.mkdir(); //폴더 생성
	    } catch(Exception e){
		    e.printStackTrace();
		}        
	}
}

String name = "";
String nick = "";
String pw = "";
String zip = "";
String add1 = "";
String add2 = "";
String tel = "";
String email = "";
String profpic = "";
String originalfile = "";

try {
	multi = new MultipartRequest(request, dir2, max, "utf-8", policy); //서버 데이터 폴더에 파일 업로드
	name = multi.getParameter("name");
	nick = multi.getParameter("nick");
	pw = multi.getParameter("pw");
    zip = multi.getParameter("zip");
    add1 = multi.getParameter("add1");
    add2 = multi.getParameter("add2");
    tel = multi.getParameter("tel");
    email = multi.getParameter("email");
    
    Enumeration files = multi.getFileNames(); 
   	String file = (String) files.nextElement();
   	profpic = multi.getFilesystemName(file); //서버에 업로드된 파일명
   	originalfile = multi.getOriginalFileName(file); //원래 선택한 원본파일명
} catch(Exception e) {
    e.printStackTrace();
}

MemberDTO dto = new MemberDTO();
MemberDAO dao = new MemberDAO();

dto.setId(id);
dto.setName(name);
dto.setNick(nick);
dto.setPw(pw);
dto.setZip(zip);
dto.setAdd1(add1);
dto.setAdd2(add2);
dto.setTel(tel);
dto.setEmail(email);
dto.setProfpic(profpic);

dao.updateMember(dto);

if (isMem == 1 && isAdm == 0) response.sendRedirect(root + "/mypage/index.jsp");
else if (isAdm == 1) response.sendRedirect(root + "/admin/memberList.jsp?page=0");
%>