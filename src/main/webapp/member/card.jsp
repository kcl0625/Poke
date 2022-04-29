<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="member.*"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="memberBean" class="member.MemberDTO">
	<jsp:setProperty property="*" name="memberBean" />
</jsp:useBean>
<%
	MemberDAO memDAO = new MemberDAO();
	MemberDTO member = memberBean;

    LocalDateTime now = LocalDateTime.now();
    String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    
    int totPrice = Integer.parseInt(request.getParameter("totPrice"));
    session.setAttribute("member", memberBean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이니시스 결제</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%
System.out.println(memberBean);
%>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'POKE',
            amount : <%=totPrice%>,
            buyer_name : '<%=memberBean.getName()%>',
            buyer_tel : '<%=memberBean.getTel()%>',
            buyer_add1 : '<%=memberBean.getAdd1()%>',
            buyer_add2 : '<%=memberBean.getAdd2()%>',
            buyer_postcode : '<%=memberBean.getZip()%>',
            buyer_email : '<%=memberBean.getEmail()%>',
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: 'order.jsp', //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                        merchant_uid : rsp.merchant_uidmerchan,
                        payment: 'card',
                        isPaid: 'y',
                        totPrice : <%=totPrice%>,
                        weekPlan: <%=Integer.parseInt(request.getParameter("weekPlan"))%>,
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href = 'orderOk.jsp';
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                location.href='<%=root%>/member/cart.jsp';
            }
        });
        
    });
	</script>
</body>
</html>