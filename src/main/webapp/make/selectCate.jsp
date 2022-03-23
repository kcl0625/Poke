<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poke.IngreDTO"%>
<%@ page import="poke.IngreDAO"%>
<%@ page import="java.util.ArrayList"%>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String selected = request.getParameter("cate");

IngreDAO dao = new IngreDAO();
ArrayList<IngreDTO> list = dao.selectCate(selected);

//성공여부 확인 : 개발자용
int total = list.size();
System.out.println("cate: " + selected);
for(int i=0;i<total;i++){
	System.out.print(list.get(i).getName() + "/");
	
	if(i == total - 1) System.out.print("\n\n");
}
%>