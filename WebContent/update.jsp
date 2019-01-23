<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="product.ProductDAO" scope="page"></jsp:useBean>  
<%@ page import="product.ProductDTO" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
ArrayList<ProductDTO> list = null;
	if(productDao.select(request.getParameter("id")).size() !=0){

	 list = productDao.select(request.getParameter("id"));
	
	}else{%>
		<script type="text/javascript">
			alert("존재하지 않는 아이디입니다.");		
			history.back();
		</script>
	<%}%>


<script type="text/javascript">

function IdLimit() {
	 document.getElementById('update_id').value = document.getElementById('update_id').value.replace( /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g,'');
   // 특수문자 제한
   document.getElementById('update_id').value = document.getElementById('update_id').value.trim();
   // 공백문자 제한
    document.getElementById('update_id').value = document.getElementById('update_id').value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,'');
   // 한글 제한
}

function update() {
	if(document.getElementById("explain") == ""){
		alert("상품설명을 입력해주세요");
	}else if(document.getElementById("price") == ""){
		alert("가격을 입력해주세요");
	}else{
		var update = document.updateForm;
		update.action = "lastUpdate.jsp";
		update.submit();
	}
}
</script>



<form name  = "updateForm">
<h3>수정 내용</h3>
회원 아이디 : <input type="text" name = "id" id = "update_id" oninput="IdLimit()" style="width: 150px;" value=<%=list.get(0).getId() %> readonly="readonly"><br>
상품 설명 : <input type="text" name = "explain" id = "explain" style="width: 200px;" value = <%=list.get(0).getProduct_explain() %> ><br>
상품 가격 : <input type="text" name = "price" id = "price" style="width: 200px;" value = <%=list.get(0).getPrice() %>>
</form>

<input type="submit" value = "수정" style="width: 50px;" onclick = "update()">

</body>
</html>