<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LifeScripts</title>
<link rel="stylesheet" href="../css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<!-- Custom styles for this template -->
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<link href="<%=url%>/css/main.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container d-flex justify-content-center align-items-center noti-container">
		<div class="card" style="width: 18rem;">
			<div class="card-body">
			  <h5 class="card-title ">Thông báo</h5>
			  <p class="card-text"><%=request.getAttribute("baoLoi")+"" %></p>
			</div>
		</div>
	</div>
	<script>
         setTimeout(function(){
            window.location.href = 'index.jsp';
         }, 5000);
    </script>
      
      <jsp:include page="../footer.jsp" /> 
</body>
</html>