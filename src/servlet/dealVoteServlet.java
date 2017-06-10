package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDAO;
import entity.voteproject;

/**
 * Servlet implementation class dealVoteServlet
 */
@WebServlet("/dealVoteServlet")
public class dealVoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dealVoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getSession().setAttribute("isVote", "true");
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO userdao = new userDAO();
		voteproject voteproject = userdao.getItem(id);
		// 开始改变投票
		String[] temp1 = voteproject.getVotenumber().split(",");
		String[][] temp2 = new String[temp1.length][2];
		for (int i = 0; i < temp1.length; i++) {
			String[] temp3 = temp1[i].split("-");
			temp2[i][0] = temp3[0];// 投票项
			temp2[i][1] = temp3[1];// 票数
		}
		// 单选的情况
		if (voteproject.getVotetype().equals("1")) {
			String items = request.getParameter("vote");
			for (int i = 0; i < temp1.length; i++) {
				if (items.equals(temp2[i][0])) {
					int n = Integer.parseInt(temp2[i][1]);
					n++;
					temp2[i][1] = n + ""; // 票数加一
				}
			}
			String votenumber = "";
			for (int i = 0; i < temp1.length; i++) {
				votenumber += temp2[i][0] + "-" + temp2[i][1] + ",";
			}
			try {
				userdao.updateVoteNumber(id, votenumber);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 多选的情况
		if (voteproject.getVotetype().equals("2")) {
			String[] items = request.getParameterValues("vote");
			for (String string : items) {
				for (int i = 0; i < temp1.length; i++) {
					if (string.equals(temp2[i][0])) {
						int n = Integer.parseInt(temp2[i][1]);
						n++;
						temp2[i][1] = n + ""; // 票数加一
					}
				}
			}
			String votenumber = "";
			for (int i = 0; i < temp1.length; i++) {
				votenumber += temp2[i][0] + "-" + temp2[i][1] + ",";
			}
			try {
				userdao.updateVoteNumber(id, votenumber);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//投完票后，跳到成功页面
		request.getRequestDispatcher("/voteSuccess.jsp").forward(request, response);
	}
}
