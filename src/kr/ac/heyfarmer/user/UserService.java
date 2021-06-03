package kr.ac.heyfarmer.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserService 
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
	
	public int login(String user_id, String user_pw)
	{
		try
		{
			Connection con = getConnection();
			
			
			Statement stmt = con.createStatement();	
			
			String sql = "select user_pw from user where user_id='" + user_id + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				String check_pw = rs.getString(1);
				if(check_pw.equals(user_pw))
					return 2; 
				else
					return 3; 
			}
			return 4;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return 1; 
	}
	
	public int join(String user_id, String user_pw, String user_name, 
			        String user_gender, String user_email)
	{
		try
		{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			
			String sql = "insert into user values(";
			sql += "'" + user_id + "','" + user_pw + "','" + user_name + "','" + 
			       user_gender + "','" + user_email + "');";
			
			stmt.execute(sql);
			
			return 0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return 1;
	}
}

