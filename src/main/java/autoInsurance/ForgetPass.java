package autoInsurance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ForgetPass")
public class ForgetPass extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		try {
			HttpSession session=request.getSession();
			DbConnect db=new DbConnect();
			String result=db.getPassword(email);
			if(result!=null) {
				String r=MailSendCode.sendMail(email, "Forget Password", 
						"Your password is "+result+" .");
				session.setAttribute("msg", "Password send successfully. "+r);
				response.sendRedirect("ForgetPassword.jsp");
			}else {
				session.setAttribute("msg","Email id does not exist!");
				response.sendRedirect("ForgetPassword.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
