package autoInsurance;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/CompanyRegister")
@MultipartConfig
public class CompanyRegister extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String reg_no=request.getParameter("reg_no");
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		Part p=request.getPart("logo");
		InputStream logo=p.getInputStream();
		//String logo =request.getParameter("logo");
        int cid=(int)(Math.random()*100000);
        PrintWriter out = response.getWriter();
		try {
			HttpSession session=request.getSession();
			DbConnect db=new DbConnect();
			HashMap<String,Object> company=new HashMap();
			company.put("email", email);
			company.put("name", name);
			company.put("phone", phone);
			company.put("reg_no", reg_no);
			company.put("address", address);
			company.put("password", password);
			company.put("logo", logo);
			company.put("cid", cid);
			boolean result=db.addCompany(company);
			if(result) {
				String r=MailSendCode.sendMail(email, "Company Registration", 
						"Your Company successfully Registered with us. Your Company id is "+cid+" . Use this id for login. ");
				session.setAttribute("msg", "Company registered successfully. "+r);
				response.sendRedirect("Company.jsp");
                out.println("registered");
			}else {
				session.setAttribute("msg", "Company Already Registered!");
				response.sendRedirect("Company.jsp");
			}
		} catch (Exception e) {
            out.println("Caught inside catch");
			e.printStackTrace(out);
		}
	}
    
}
