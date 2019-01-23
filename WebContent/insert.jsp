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
		productDto.setId(request.getParameter("id"));//상품등록 아이디
		productDto.setProduct_name(request.getParameter("name"));//상품이름
		productDto.setProduct_explain(request.getParameter("explain"));//상품 설명
		productDto.setPrice(Integer.parseInt(request.getParameter("price")));//상품 가격

		if (productDao.insert(productDto) == 1) {
			response.sendRedirect("index.jsp");
		} else {
	%>
		<script type="text/javascript">
			alert("등록에 실패하였습니다.");
			history.back();
		</script>
	<%
		};
	%>

</body>
</html>