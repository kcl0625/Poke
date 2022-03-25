<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();

request.setCharacterEncoding("utf-8");
String sessionId = null;
int isAdm = 0;
int isMem = 0;

sessionId = (String)session.getAttribute("id");
if(sessionId != null){ //로그인 상태일 때
	isMem = 1;
	if(Integer.parseInt((String)session.getAttribute("isAdm")) == 1){
		isAdm = Integer.parseInt((String)session.getAttribute("isAdm"));
	}
}
%>