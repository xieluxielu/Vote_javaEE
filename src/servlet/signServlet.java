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

/**
 * Servlet implementation class signServlet
 */
@WebServlet("/signServlet")
public class signServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");

		String account = request.getParameter("account");
		userDAO userdao = new userDAO();
		ArrayList<user> list = userdao.getAlluser();
		for (user u : list) {
			if(u.getAccount().equals(account)){
				response.getWriter().println("∏√’À∫≈“—±ª◊¢≤·£°");
			}
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		user u = new user();
		u.setAccount(request.getParameter("account"));
		u.setPassword(request.getParameter("password"));
		u.setUsername(request.getParameter("username"));
		u.setSex(request.getParameter("sex"));
		u.setPhone(request.getParameter("phone"));
		u.setSchool(request.getParameter("school"));
		userDAO userdao = new userDAO();
		try {
			userdao.addUser(u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/signSuccess.jsp").forward(request, response);
	}

}
