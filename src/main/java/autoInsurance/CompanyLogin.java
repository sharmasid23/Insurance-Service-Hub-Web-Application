package autoInsurance;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/CompanyLogin")
public class CompanyLogin extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
        try {
            int cid=Integer.parseInt(request.getParameter("cid"));
            String password=request.getParameter("password");
            String email=request.getParameter("email");
           
			HttpSession session=request.getSession();
			DbConnect db=new DbConnect();
			String c_name=db.getCompanyLogin(cid, email, password);
			if(c_name!=null) {
				session.setAttribute("c_email",email);
				session.setAttribute("c_name",c_name);
				response.sendRedirect("CompanyHome.jsp");
			}else {
				session.setAttribute("msg","Wrong entries!");
				response.sendRedirect("Company.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}
}
