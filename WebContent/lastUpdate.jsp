<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="product.ProductDAO" scope="page"></jsp:useBean>  
<jsp:useBean id="productDto" class="product.ProductDTO" scope="page"></jsp:useBean>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	productDto.setId(request.getParameter("id"));
	productDto.setPrice(Integer.parseInt(request.getParameter("price")));
	productDto.setProduct_explain(request.getParameter("explain"));
	
	if(productDao.update(productDto) == 1){%>
		
	<script type="text/javascript">
		alert("수정되었습니다.");
		location.href = "index.jsp";
	</script>
	<%}%>






</body>
</html>