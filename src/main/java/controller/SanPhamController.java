package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import database.SanPhamDAO;
import model.SanPham;


/**
 * Servlet implementation class SanPhamController
 */
@WebServlet("/san-pham")
public class SanPhamController extends HttpServlet {
//	public void init() throws ServletException {
//        // Thực hiện kết nối cơ sở dữ liệu và lấy dữ liệu sản phẩm ở đây
//		SanPhamDAO spd = new SanPhamDAO();
//		KhachHangDAO khd = new KhachHangDAO();
//        List<Product> productList = // Lấy dữ liệu từ cơ sở dữ liệu
//        
//        // Gửi dữ liệu lên JSP
//        getServletContext().setAttribute("productList", productList);
//    }

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hanhDong = request.getParameter("hanhDong");
		if (hanhDong.equals("the-loai")) {
			filterTheoTheLoai(request, response);
		} else if (hanhDong.equals("tac-gia")) {
			filterTheoTacGia(request, response);	
		} else if (hanhDong.equals("chi-tiet-san-pham")) {
			chiTietSanPham(request, response);
		}else if (hanhDong.equals("tim-kiem")) {
			timKiem(request, response);
			System.out.println("=====================");
		}
//		else if (hanhDong.equals("thay-doi-thong-tin")) {
//			thayDoiThongTin(request, response);
//		}else if (hanhDong.equals("xac-thuc")) {
//			xacThuc(request, response);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void filterTheoTheLoai(HttpServletRequest request, HttpServletResponse response) {
		try {
			String theLoai = request.getParameter("theLoai");
			request.setAttribute("theLoai", theLoai);
			System.out.println(theLoai);

			String url = "/sanpham/theotheloai.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void filterTheoTacGia(HttpServletRequest request, HttpServletResponse response) {
		try {
			String tacGia = request.getParameter("tacGia");
			request.setAttribute("tacGia", tacGia);
			System.out.println(tacGia);

			String url = "/sanpham/theotacgia.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void chiTietSanPham(HttpServletRequest request, HttpServletResponse response) {
		try {
			String maSanPham = request.getParameter("maSanPham");
			request.setAttribute("maSanPham", maSanPham);
			System.out.println(maSanPham);

			String url = "/sanpham/chitietsanpham.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void timKiem(HttpServletRequest request, HttpServletResponse response) {
		try {
			String noiDung = request.getParameter("noiDung");
			request.setAttribute("noiDung", noiDung);
			System.out.println("=====================");
			System.out.println(noiDung);
			
			SanPhamDAO spd = new SanPhamDAO();
			ArrayList<SanPham> sp_list = spd.selectAll();
			ArrayList<SanPham> results = new ArrayList<>();
	        for (SanPham SanPham : sp_list) {
	            if (SanPham.getTenSanPham().toLowerCase().contains(noiDung.toLowerCase())) {
	                results.add(SanPham);
	            }
	        }
	        request.setAttribute("results", results);

			String url = "/sanpham/timkiemsanpham.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
