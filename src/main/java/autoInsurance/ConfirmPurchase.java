package autoInsurance;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ConfirmPurchase")
public class ConfirmPurchase extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String u_email=(String)session.getAttribute("u_email");
   		int pid=Integer.parseInt(request.getParameter("pid"));
		String v_no=request.getParameter("v_no");
		String e_no=request.getParameter("e_no");
		String c_email=request.getParameter("c_email");
        PrintWriter out=response.getWriter();
		try {
			DbConnect db=new DbConnect();
			HashMap<String,Object> order=new HashMap();
			order.put("u_email", u_email);
			order.put("pid", pid);
			order.put("v_no", v_no);
			order.put("e_no", e_no);
			order.put("c_email", c_email);
			boolean result=db.addOrder(order);
			if(result) {
				session.setAttribute("msg", "Insurance Purchased successfully. ");
				response.sendRedirect("BuyPolicy.jsp?pid="+pid);
			}else {
				session.setAttribute("msg", "Insurance already Purchased for this Vehicle!");
				response.sendRedirect("BuyPolicy.jsp?pid="+pid);
			}
		} catch (Exception e) {
            out.println("Exception caught");
			e.printStackTrace(out);
		}
	}
}
