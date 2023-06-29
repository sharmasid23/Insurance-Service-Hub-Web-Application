package autoInsurance;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ALogin")
public class ALogin extends HttpServlet{

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
        PrintWriter out = response.getWriter();
		try {
			HttpSession session=request.getSession();
			autoInsurance.DbConnect db=new autoInsurance.DbConnect();
			String admin_name=db.getAdminLogin(email, password);
			if(admin_name!=null) {
				session.setAttribute("admin_name",admin_name);
				response.sendRedirect("adminHome.jsp");
                out.println("Worked Logged In");
			}else {
				session.setAttribute("msg","Wrong entries!");
				response.sendRedirect("index.jsp");
                //out.println("Worked Error");
			}
		} catch (Exception e) {
            out.println("Exception Caught");
			e.printStackTrace();
		}
	}
}
