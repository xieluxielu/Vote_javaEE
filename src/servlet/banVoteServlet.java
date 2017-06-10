package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDAO;
import entity.user;
import entity.voteproject;

/**
 * Servlet implementation class banVoteServlet
 */
@WebServlet("/banVoteServlet")
public class banVoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public banVoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ban = request.getParameter("ban");
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO userdao = new userDAO();
		if(ban.equals("yes"))
		{
			try {
				userdao.updateBan(id, ban);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(ban.equals("no"))
		{
			try {
				userdao.updateBan(id, ban);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("/UserCheck.jsp?account="+request.getParameter("account")).forward(request, response);
	}

}
