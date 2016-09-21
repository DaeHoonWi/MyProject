<%@ tag body-content="scriptless" pageEncoding="UTF-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>

<!-- 사용 안함 (16.9.21) -->
<%
	int i = 0;
	int j;
	
	if(i%5 == 1){
%>
<tr>
<jsp:doBody/>
<tr>
<%
	}else{
%>		
<jsp:doBody/>
<%				
	}
%>
