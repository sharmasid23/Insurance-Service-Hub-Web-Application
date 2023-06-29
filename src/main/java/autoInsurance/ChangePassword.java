package autoInsurance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String u_email=(String)session.getAttribute("u_email");
		String old_password=request.getParameter("old_password");
		String new_password=request.getParameter("new_password");
		String confirm_password=request.getParameter("confirm_password");
		if(new_password.equals(confirm_password)) {
		try {
			DbConnect db=new DbConnect();
			boolean result=db.changePassword(u_email,old_password,new_password);
			if(result) {
				session.setAttribute("msg", "Password updated successfully!");
				response.sendRedirect("UserHome.jsp");
			}else {
				session.setAttribute("msg", "Old Password is Wrong!");
				response.sendRedirect("UserHome.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		}else {
			session.setAttribute("msg", "Password mismatched!");
			response.sendRedirect("UserHome.jsp");
		}
	}
}
