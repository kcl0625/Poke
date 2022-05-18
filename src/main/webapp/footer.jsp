<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
    </section>
    <footer>
        <div class="left">
            <ul>
                <li><a href="<%=root %>/notice/list.jsp?cate=전체&page=0"">Notice</a></li>
            </ul>
            <p>
                ㈜ POKE<br>
				대표이사 : 홍길동<br>
				주소 : 경기도 고양시 덕양구 ○○로 ×× 무슨 빌딩 △△△호<br>
				사업자등록번호 : 123-45-67890<br><br>
				Copyright (c) POKE CORP All right reserved.
            </p>
        </div>
        <div class="center"><p class="txt-center">POKE</p></div>
        <div class="right">
            <ul>
                <li><a href="<%=root%>/make/make.jsp">Make</a></li>
                <li><a href="<%=root%>/bowls/bowls.jsp?cate=육류&page=0">Bowls</a></li>
                <li><a href="<%=root%>/etc/list.jsp?cate=전체&page=0">Etc</a></li>
                <li><a href="<%=root%>/review/list.jsp?page=0">Review</a></li>
            </ul>
        </div>
    </footer>
    </body>
</html>