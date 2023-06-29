package autoInsurance;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddPolicy")
public class AddPolicy extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
        //int pid=(int)(Math.random()*100000);
		String c_email=(String)session.getAttribute("c_email");
		
		int p_si_amt=Integer.parseInt(request.getParameter("p_si_amt"));
        String p_name=request.getParameter("p_name");
		String p_desc=request.getParameter("p_desc");
		String category=request.getParameter("category");
        
		try {
			DbConnect db=new DbConnect();
			HashMap<String,Object> policy=new  HashMap();
			policy.put("c_email", c_email);
			policy.put("p_name", p_name);
			policy.put("p_si_amt", p_si_amt);
			policy.put("p_desc", p_desc);
			policy.put("category", category);
			boolean result=db.addPolicy(policy);
			if(result) {
				session.setAttribute("msg", "Policy added successfully. ");
				response.sendRedirect("CompanyHome.jsp");
			}else {
				session.setAttribute("msg", "Policy Already Registered!");
				response.sendRedirect("CompanyHome.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
