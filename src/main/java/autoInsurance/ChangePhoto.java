package autoInsurance;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/ChangePhoto")
@MultipartConfig
public class ChangePhoto extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String u_email=(String)session.getAttribute("u_email");
		Part p=request.getPart("photo");
		InputStream photo=p.getInputStream();
		try {
			DbConnect db=new DbConnect();
			boolean result=db.changePhoto(u_email,photo);
			if(result) {
				session.setAttribute("msg", "Photo updated successfully!");
				response.sendRedirect("UserHome.jsp");
			}else {
				session.setAttribute("msg", "Something went wrong!");
				response.sendRedirect("UserHome.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
