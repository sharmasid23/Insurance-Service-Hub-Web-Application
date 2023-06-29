package autoInsurance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetPhoto")
public class GetPhoto extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String type=request.getParameter("type");
		try{
		DbConnect db=new DbConnect();
		byte[] photo=db.getPhoto(email,type);
		response.getOutputStream().write(photo);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
