package kr.ac.heyfarmer.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class shopboardService 
{
	private Connection getConnection()
	{
		Connection con = null;
		try
		{
			String url = "jdbc:mysql://localhost:3306/bbs4dm?useSSL=false";
			String user = "root";
			String password = "/Tjdus4740";
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user, password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
	public int write(Message msg)
	{
		try
		{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "insert into shop values(NULL,'" + msg.getMsg_title() + "','" + 
			              msg.getMsg_content() + "','" + getDate() + "','" + msg.getUser_id() + "');";
			stmt.execute(sql);
			
			return 1;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	

	
	
	private String getDate()
	{
		String date = null;
		try
		{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "select now();";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			date = rs.getString(1);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return date;
	}
	
	public ArrayList<Message> getMessages()
	{
		ArrayList<Message> msgs = new ArrayList<Message>();
		
		try
		{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from shop;";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				Message msg = new Message();
				
				msg.setMsg_id(rs.getInt(1));
				msg.setMsg_title(rs.getString(2));
				msg.setMsg_content(rs.getString(3));
				msg.setMsg_date(rs.getString(4));
				msg.setUser_id(rs.getNString(5));
				
				msgs.add(msg);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return msgs;
	}
	
	public Message getMessage(int msg_id)
	{
		Message msg = null;
		
		try
		{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from shop  where msg_id=" + msg_id + ";";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			
			msg = new Message();
			msg.setMsg_id(rs.getInt(1));
			msg.setMsg_title(rs.getString(2));
			msg.setMsg_content(rs.getString(3));
			msg.setMsg_date(rs.getString(4));
			msg.setUser_id(rs.getString(5));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return msg;
	}
	
	public void deleteMessage(String msg_id)
	{
		try
		{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "delete from shop  where msg_id=" + msg_id + ";";
			stmt.execute(sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void updateMessage(String msg_title, String msg_content, String msg_id)
	{
		try
		{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "update shop  set msg_title='" + msg_title + "'," +
					     "msg_content='" + msg_content + "' where msg_id=" + msg_id + ";"; 
			stmt.execute(sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args)
	{
		System.out.println(new shopboardService().getDate());
	}
}
