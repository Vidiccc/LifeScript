<%@page import="database.SanPhamDAO"%>
<%@page import="model.SanPham"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LifeScripts</title>
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
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- Page content -->
	<div class="container mt-4">
		<div class="row">
			<%
				
				String maSanPham = request.getAttribute("maSanPham")+"";
				maSanPham = (maSanPham.equals("null"))?"":maSanPham;
		
				SanPhamDAO spd = new SanPhamDAO();
				ArrayList<SanPham> sp_list = spd.selectAll();
			
				for (SanPham sanPham : sp_list) {
					 if(sanPham.getMaSanPham().equals(maSanPham)){
			 %>
			 
			 	<div class="col-lg-4 col-md-6 mb-4">
						<img class="card-img-top" src="<%=sanPham.getAnhBia() %>"
							alt="">
						
				</div>
				
				<div class="col-lg-7 col-md-6 mb-4">
					<h1 class="">
								<%=sanPham.getTenSanPham() %>
						</h1>
						<h3 class="card-subtitle mb-2 text-muted">Tác giả: <%=sanPham.getTacGia().getHoVaTen() %></h3>
						<h5 class="mb-2">Năm xuất bản: <%=sanPham.getNamXuatBan()%></h5>
						<h5 class="mb-2">Ngôn ngữ: Tiếng <%=sanPham.getNgonNgu()%></h5>
						<h6 class="mb-2"><%=sanPham.getMoTa()%></h6>
						<div class="text-primary card-price">
							<p class="card-text"><%=sanPham.getGiaBan() %> VND</p>
							<a href="#" class="btn btn-primary">Thêm vào giỏ hàng</a>
						</div>
				</div>
				<%
						}
					}
				%>
		</div>
				
	</div>
				
	<!-- End Page content -->

	<!-- footer -->
	<%@include file="../footer.jsp" %>
	
</body>
</html>