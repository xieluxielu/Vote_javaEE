package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.voteproject;
import entity.user;
import util.DBHelper;

public class userDAO {
	public void addUser(user user) throws Exception{
		Connection conn = DBHelper.getConnection();
		String sql = "" + 
					 "insert into user (account,password,username,phone,school,sex) values (" + 
					 "?,?,?,?,?,?)";
		try {
			PreparedStatement ptmt = (PreparedStatement)conn.prepareStatement(sql);
			ptmt.setString(1, user.getAccount());
			ptmt.setString(2, user.getPassword());
			ptmt.setString(3, user.getUsername());
			ptmt.setString(4, user.getPhone());
			ptmt.setString(5, user.getSchool());
			ptmt.setString(6, user.getSex());
			ptmt.execute();

		} catch (SQLException e) {
			System.out.println("添加失败！");
			e.printStackTrace();
		}		
	}
	public ArrayList<user> getAlluser() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<user> list = new ArrayList<user>(); 
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from user;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				user u = new user();
				u.setAccount(rs.getString("account"));
				u.setPhone(rs.getString("phone"));
				u.setSchool(rs.getString("school"));
				u.setSex(rs.getString("sex"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				list.add(u);
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	public user getUser(String account){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		user item = new user();
		try{		
			conn = DBHelper.getConnection();
			String sql = "select * from user where account = '" + account + "';";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			if(rs.next()){			

				item.setAccount(rs.getString("account"));
				item.setPhone(rs.getString("phone"));
				item.setSchool(rs.getString("school"));
				item.setSex(rs.getString("sex"));
				item.setUsername(rs.getString("username"));
				item.setPassword(rs.getString("password"));
			}
			return item;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void addVote(voteproject voteproject) throws Exception{
		Connection conn = DBHelper.getConnection();
		String sql = "" + 
					 "insert into voteproject (title,username,time,votetype,votenumber,ban) values (" + 
					 "?,?,?,?,?,?)";
		try {
			PreparedStatement ptmt = (PreparedStatement)conn.prepareStatement(sql);
			ptmt.setString(1, voteproject.getTitle());
			ptmt.setString(2, voteproject.getUsername());
			ptmt.setDate(3, voteproject.getTime());
			ptmt.setString(4, voteproject.getVotetype());
			ptmt.setString(5, voteproject.getVotenumber());
			ptmt.setString(6, voteproject.getBan());
			ptmt.execute();

		} catch (SQLException e) {
			System.out.println("添加失败！");
			e.printStackTrace();
		}		
	}
	
	public voteproject getItem(int id){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		voteproject item = new voteproject();
		try{		
			conn = DBHelper.getConnection();
			String sql = "select * from voteproject where id = " + id + ";";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			if(rs.next()){			

				item.setTitle(rs.getString("title"));
				item.setUsername(rs.getString("username"));
				item.setVotetype(rs.getString("votetype"));
				item.setVotenumber(rs.getString("votenumber"));
				item.setTime(rs.getDate("time"));
				item.setId(rs.getInt("id"));
				item.setBan(rs.getString("ban"));
				
			}
			return item;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public ArrayList<voteproject> getAllvoteproject() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<voteproject> list = new ArrayList<voteproject>(); 
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from voteproject;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				voteproject u = new voteproject();
				u.setTitle(rs.getString("title"));
				u.setUsername(rs.getString("username"));
				u.setVotetype(rs.getString("votetype"));
				u.setVotenumber(rs.getString("votenumber"));
				u.setId(rs.getInt("id"));
				u.setTime(rs.getDate("time"));
				u.setBan(rs.getString("ban"));
				java.util.Date date = new java.util.Date();
				if(date.getTime()>u.getTime().getTime())
				{
					u.setBan("yes");
					updateBan(u.getId(), "yes");
				}

				list.add(u);
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	//得到用户自己的发起的投票
	public ArrayList<voteproject> getUservoteproject(String find) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<voteproject> list = new ArrayList<voteproject>(); 
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from voteproject where username = '"+find+"';"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				voteproject u = new voteproject();
				u.setTitle(rs.getString("title"));
				u.setUsername(rs.getString("username"));
				u.setVotetype(rs.getString("votetype"));
				u.setVotenumber(rs.getString("votenumber"));
				u.setTime(rs.getDate("time"));
				u.setId(rs.getInt("id"));
				u.setBan(rs.getString("ban"));
				list.add(u);
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	public ArrayList<voteproject> getFindvoteproject(String find) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<voteproject> list = new ArrayList<voteproject>(); 
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from voteproject where title like '%"+find+"%';"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				voteproject u = new voteproject();
				u.setTitle(rs.getString("title"));
				u.setUsername(rs.getString("username"));
				u.setVotetype(rs.getString("votetype"));
				u.setVotenumber(rs.getString("votenumber"));
				u.setTime(rs.getDate("time"));
				u.setId(rs.getInt("id"));
				u.setBan(rs.getString("ban"));
				list.add(u);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	public void updateVoteNumber(int id,String votenumber) throws Exception{
		Connection conn = DBHelper.getConnection();
		String sql = "" +
					 " update voteproject "+
					 " set votenumber = ? where id = ? ";
		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);

		ptmt.setString(1, votenumber);
		ptmt.setInt(2,id);
		ptmt.execute();
	}
	public void updateBan(int id,String ban) throws Exception{
		Connection conn = DBHelper.getConnection();
		String sql = "" +
					 " update voteproject "+
					 " set ban = ? where id = ? ";
		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);

		ptmt.setString(1, ban);
		ptmt.setInt(2,id);
		ptmt.execute();
	}
}
