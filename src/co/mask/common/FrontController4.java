package co.mask.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.mask.join.web.IdCheck;
import co.mask.join.web.Join;
import co.mask.join.web.JoinForm;
import co.mask.login.web.Login;
import co.mask.login.web.LoginForm;
import co.mask.admin.web.AdminFrom;
import co.mask.admin.web.AdminSellerForm;
import co.mask.admin.web.AdminUserForm;
import co.mask.admin.web.SellerDelete;
import co.mask.admin.web.SellerUpForm;
import co.mask.admin.web.SellerUpdate;
import co.mask.admin.web.UserDelete;
import co.mask.admin.web.UserUpForm;
import co.mask.admin.web.UserUpdate;
import co.mask.cart.web.BootPay;
import co.mask.cart.web.CartView;
import co.mask.main.MainPage;
import co.mask.main.Menu;
import co.mask.member.web.MyPageDelete;
import co.mask.member.web.MyPageForm;
import co.mask.member.web.MyPageUpdate;
import co.mask.member.web.MyPageUpdateForm;
import co.mask.product.web.ToInsertProduct;
import co.mask.product.web.ToUpdateProduct;
import co.mask.product.web.UpdateExec;
import co.mask.product.web.DeleteAdminExec;
import co.mask.product.web.DeleteExec;
import co.mask.product.web.Insertexec;
import co.mask.product.web.ShowProduct;
import co.mask.product.web.ShowProductSeller;

@WebServlet("/FrontController4")
public class FrontController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController4() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		map.put("/menu.do", new Menu());
		map.put("/main.do", new MainPage());
		map.put("/joinForm.do", new JoinForm());	//회원가입 폼 호출
		map.put("/idCheck.do", new IdCheck());	//아이디 중복체크
		map.put("/join.do", new Join()); 	//회원가입
		map.put("/loginForm.do", new LoginForm());	//로그인 폼 호출
		map.put("/login.do", new Login()); 	//로그인
		map.put("/adminForm.do", new AdminFrom()); //관리자의 관리자창 폼 호출
		map.put("/adminUserForm.do", new AdminUserForm()); //관리자의 회원목록 폼 호출
		map.put("/userUpForm.do", new UserUpForm()); //관리자의 회원 수정 폼 호출
		map.put("/userUpdate.do", new UserUpdate()); //관리자의 회원 수정
		map.put("/userDelete.do", new UserDelete()); //관리자의 회원 삭제 
		map.put("/adminSellerForm.do", new AdminSellerForm()); //관리자의 거래처목록 폼 호출
		map.put("/sellerUpForm.do", new SellerUpForm()); //관리자의 거래처 수정 폼 호출
		map.put("/sellerUpdate.do", new SellerUpdate()); //관리자의 거래처 수정
		map.put("/sellerDelete.do", new SellerDelete()); //관리자의 거래처 삭제
		map.put("/myPageForm.do", new MyPageForm()); //멤버(회원,거래처)의 내정보 조회
		map.put("/myPageUpdateForm.do", new MyPageUpdateForm());//멤버의 내정보 수정 폼 호출
		map.put("/myPageUpdate.do", new MyPageUpdate());//멤버의 내정보 수정
		map.put("/myPageDelete.do", new MyPageDelete());//멤버의 회원탈퇴
		map.put("/cartView.do", new CartView()); // 장바구니 리스트 페이지
		map.put("/bootPay.do", new BootPay());
		map.put("/myPageUpdateForm.do", new MyPageUpdateForm());//멤버의 내정보 수정 폼 호출
		map.put("/myPageUpdate.do", new MyPageUpdate());//멤버의 내정보 수정
		map.put("/showProduct.do", new ShowProduct()); //상품목록 조회
		map.put("/toInsertProduct.do", new ToInsertProduct()); //상품등록 화면 가기
		map.put("/insertExec.do", new Insertexec()); //상품등록
		map.put("/toUpdateProduct.do", new ToUpdateProduct()); //상품수정 화면 가기
		map.put("/updateExec.do", new UpdateExec()); //상품수정
		map.put("/deleteExec.do", new DeleteExec()); //상품삭제
		map.put("/showProductSeller.do", new ShowProductSeller()); //판매자용 상품관리 
		map.put("/deleteAdminExec.do",new DeleteAdminExec()); //관리자용 상품삭제
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String contexPath = request.getContextPath();
		String uri = request.getRequestURI();
		String path = uri.substring(contexPath.length());
		
		Command command = map.get(path);
		String viewPage = command.execute(request, response);
		
		if(!viewPage.endsWith(".do")) viewPage = "/WEB-INF/jsp/" + viewPage + ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
