<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="product.ProductDAO" scope="page"></jsp:useBean>
<%@ page import="product.ProductDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="/myShop/css/page.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<ProductDTO> list = null;//검색한 아이디에맞는 상품정보 
		if (productDao.select(request.getParameter("id")).size() != 0) {
			list = productDao.select(request.getParameter("id"));

		} else {
	%>
	<script type="text/javascript">
		alert("존재하지 않는 아이디입니다.");
		history.back();
	</script>

	<%
		}
	%>
	<form class="insert_form" method="post" name="form_name">
		<h1>상품 정보</h1>
		<table border="1" class="insert_table">
			<tr height="30px">
				<td width="100px">아이디</td>
				<td width="250px"><input type="text" name="id" id="id"
					readonly="readonly" value=<%=list.get(0).getId()%>></td>
			</tr>
			<tr height="30px">
				<td>상품이름</td>
				<td><input type="text" name="name" id="name"
					readonly="readonly" value=<%=list.get(0).getProduct_name()%>>
				</td>
			</tr>
			<tr height="30px">
				<td>상품설명</td>
				<td height="100px"><textarea name="explain" id="explain"
						readonly="readonly"><%=list.get(0).getProduct_explain()%></textarea>
				</td>
			</tr>
			<tr style="" height="30px">
				<td>상품가격</td>
				<td><input type="text" name="price" id="price"
					readonly="readonly" value=<%=list.get(0).getPrice()%>></td>
			</tr>
		</table>
	</form>
</body>
</html>