<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="product.ProductDAO" scope="page"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<%if(productDao.delete(request.getParameter("id"))==1){%><!--입력한 아이디가 존재하면 지움 -->
			 <script type="text/javascript">
				alert("삭제되었습니다.");
				location.href = "index.jsp";
			 </script>	
			<%}else{%>
				<script type="text/javascript">
					alert("존재하지 않는 아이디입니다.")	
					history.back();		
				</script>
			<%};%>

</body>
</html>