<%@page import="model.TacGia"%>
<%@page import="database.TacGiaDAO"%>
<%@page import="database.TheLoaiDAO"%>
<%@page import="model.TheLoai"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ request.getContextPath();
 %>
<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="" href="<%=url %>/index.jsp"> <img
				src="<%=url %>/img/logo/home.png"
				alt="Logo" height="52">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="<%=url %>/index.jsp">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Combo
							giảm giá</a></li>
					<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Thể loại </a>
					<ul class="dropdown-menu">	
						<%
							TheLoaiDAO tld = new TheLoaiDAO();
							ArrayList<TheLoai> tl_list = tld.selectAll();
							
							for (TheLoai theLoai : tl_list) {
						%>
							<li><a class="dropdown-item" href="san-pham?hanhDong=the-loai&theLoai=<%= theLoai.getTenTheLoai() %>"><%= theLoai.getTenTheLoai() %></a></li>
						<%
							}
						%>
						</ul>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Tác giả </a>
						<ul class="dropdown-menu">
						<%
							TacGiaDAO tgd = new TacGiaDAO();
							ArrayList<TacGia> tg_list = tgd.selectAll();
							
							for (TacGia tacGia : tg_list) {
						%>
							<li><a class="dropdown-item" href="san-pham?hanhDong=tac-gia&tacGia=<%= tacGia.getHoVaTen() %>"><%= tacGia.getHoVaTen() %></a></li>
						<%
							}
						%>
						</ul>
					</li>
				</ul>
				<form class="d-flex" role="search" style="position: relative;display: block;float: right;" action="<%=url %>/san-pham" method="GET">			
						<input type="hidden" name="hanhDong" value="tim-kiem"/>
						<input class="form-control me-2" type="search"
							placeholder="Nội dung tìm kiếm" aria-label="Search" name="noiDung">
						<button class="btn btn-outline-success" type="submit">Tìm</button>
				</form>
				<div>
					<%
						Object obj = session.getAttribute("khachHang");
						KhachHang khachHang = null;
						if (obj!=null)
							khachHang = (KhachHang)obj;
						
						if(khachHang==null){
					%>
						<a class="btn btn-primary signup-btn" href="khachhang/dangnhap.jsp">
							Đăng nhập
						</a>
					<%} else { %>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor ">
						<li class="nav-item dropdown dropstart"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Tài khoản</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
								<li><a class="dropdown-item" href="#">Thông báo</a></li>
								<li><a class="dropdown-item" href="<%=url %>/khachhang/thaydoithongtin.jsp">Thay đổi thông tin</a></li>
								<li><a class="dropdown-item" href="<%=url %>/khachhang/doimatkhau.jsp">Đổi mật khẩu</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="<%=url %>/khach-hang?hanhDong=dang-xuat">Thoát tài khoản</a></li>
							</ul></li>
					</ul>				
						
					<% } %>
				</div>
				
			</div>
		</div>
	</nav>
	<!-- End Navbar -->