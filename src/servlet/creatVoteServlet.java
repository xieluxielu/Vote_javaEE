package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDAO;
import entity.voteproject;


@WebServlet("/creatVoteServlet")
public class creatVoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public creatVoteServlet() {
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
		request.setCharacterEncoding("utf-8");
		voteproject voteproject = new voteproject();
		String title = request.getParameter("title");
		String username = request.getParameter("username");
		String votetype = request.getParameter("votetype");
		String temp = request.getParameter("votenumber");
		String ban = "no";
		int year = Integer.parseInt(request.getParameter("year"))-1900;
		int month = Integer.parseInt(request.getParameter("month"))-1;
		int day = Integer.parseInt(request.getParameter("day"));
		Date date = new Date(year, month, day);
		voteproject.setTime(date);
		voteproject.setBan(ban);
		voteproject.setTitle(title);
		voteproject.setUsername(username);
		voteproject.setVotetype(votetype);
		String votenumber = "";
		String[] temp2 = temp.split("，");
		for (String string : temp2) {
			votenumber+=string+"-"+"0"+",";
		}
		voteproject.setVotenumber(votenumber);
		//加进数据库
		userDAO userdao = new userDAO();
		try {
			userdao.addVote(voteproject);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/creatVoteSuccess.jsp?account="+request.getParameter("account")).forward(request, response);
	}

}
