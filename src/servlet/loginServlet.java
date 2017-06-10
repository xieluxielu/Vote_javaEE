package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDAO;
import entity.user;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		userDAO userdao = new userDAO();
		ArrayList<user> list = userdao.getAlluser();
		for (user u : list) {
			if(u.getAccount().equals(account))
			{				
				if(u.getPassword().equals(password))
				{
					request.getRequestDispatcher("/Userindex.jsp").forward(request, response);
					return;
				}
				response.sendRedirect("../passwordError.jsp");
				return;
			}
		}
		response.sendRedirect("../loginFail.jsp");
		return;
	}

}
