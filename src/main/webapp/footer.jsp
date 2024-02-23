<%@page import="model.TacGia"%>
<%@page import="database.TacGiaDAO"%>
<%@page import="database.TheLoaiDAO"%>
<%@page import="model.TheLoai"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 String url2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ request.getContextPath();
 %>
<!-- Footer -->
	<footer class="py-3">
		<ul class="nav justify-content-center border-bottom pb-3 mb-3">
			<li class="nav-item"><a href="<%=url2 %>/index.jsp"
				class="nav-link px-2 text-muted">Trang chủ</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Quy định giao hàng</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Quy định trả hàng</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Liên hệ</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Blogs</a></li>
		</ul>
		<p class="text-center text-muted">© 2023 KhangVi, Inc</p>
	</footer>
<!-- End footer -->