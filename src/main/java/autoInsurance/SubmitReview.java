package autoInsurance;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SubmitReview")
public class SubmitReview extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("Name");
		String email=request.getParameter("Email");
		String phone=request.getParameter("Phone");
		String zipcode=request.getParameter("ZipCode");
        String type1=request.getParameter("type1");
        String input=request.getParameter("input");
        PrintWriter out= response.getWriter();

        try{
            HttpSession session=request.getSession();
			
            // HashMap<String,Object> reviewlist=new HashMap();
			// reviewlist.put("email", email);
			// reviewlist.put("name", name);
			// reviewlist.put("phone", phone);
			// reviewlist.put("reg_no", reg_no);
            MongoDBDataStoreUtilities.insertReview(name, email, phone, zipcode,type1,input);
            session.setAttribute("msg", "Thank You for the suggestions.");
			response.sendRedirect("contact.jsp");
        }
        catch(Exception e) {
			e.printStackTrace(out);
		}
    }
    
}
