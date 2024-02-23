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
		<div class="row d-flex justify-content-around">
				<!-- Slider -->
				<div id="carouselExampleIndicators" class="carousel slide mb-4"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="https://static.vecteezy.com/system/resources/previews/002/294/884/original/book-delivery-web-banner-design-online-bookstore-concept-online-education-online-store-online-shopping-header-or-footer-banner-free-vector.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://static.vecteezy.com/system/resources/previews/002/294/884/original/book-delivery-web-banner-design-online-bookstore-concept-online-education-online-store-online-shopping-header-or-footer-banner-free-vector.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://static.vecteezy.com/system/resources/previews/002/294/884/original/book-delivery-web-banner-design-online-bookstore-concept-online-education-online-store-online-shopping-header-or-footer-banner-free-vector.jpg" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
				</div>
				<!-- End Slider -->
				<!-- Products -->
				<div class="row">
					
				
					<%
						String tacGia = request.getAttribute("tacGia")+"";
						tacGia = (tacGia.equals("null"))?"":tacGia;
					
						SanPhamDAO spd = new SanPhamDAO();
						ArrayList<SanPham> sp_list = spd.selectAll();
					
						for (SanPham sanPham : sp_list) {
							 if(sanPham.getTacGia().getHoVaTen().equals(tacGia)){ 
								
							
					 %>
					 
					 	<div class="col-lg-3 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top" src="<%=sanPham.getAnhBia() %>"
									alt=""></a>
								<div class="card-body">
									<h5 class="card-title">
										<%=sanPham.getTenSanPham() %>
									</h5>
									<h6 class="card-subtitle mb-2 text-muted"><%=sanPham.getTacGia().getHoVaTen() %></h6>
									
								</div>
								<div class="card-footer text-primary card-price">
									<p class="card-text"><%=sanPham.getGiaBan() %> VND</p>
									<a href="#" class="btn btn-primary">Thêm vào giỏ hàng</a>
								</div>
							</div>
						</div>
				
					<%
							}
						}
					%>
				</div>
					
				
				<!-- End Products -->
			<!-- End Slider and Products -->
		</div>
	</div>
	<!-- End Page content -->

	<!-- footer -->
	<%@include file="../footer.jsp" %>
	
</body>
</html>