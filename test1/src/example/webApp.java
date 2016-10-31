package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class webApp extends HttpServlet	{
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
resp.setContentType("text/html;charset=UTF-8");
try (PrintWriter out = resp.getWriter()) {
/* TODO output your page here. You may use following sample code. */
String name = req.getParameter("username");
String pass = req.getParameter("password");

//out.println("Welcome :    " +name);
out.println(" <br/><br/>");
try {
	//out.print("akdgbgakbkjb");
Class.forName("com.mysql.jdbc.Driver");
//out.println("driver loaded....");
Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
//out.println("Connection success...");
Statement stmt = con.createStatement();

stmt.executeUpdate("insert into login values('"+name+"','"+pass+"')");
out.print(call() +" "+ name);
con.close();
}catch(Exception e) {
	e.printStackTrace();
}
}
	}

	public String call() {
		// TODO Auto-generated method stub
		return "Welcome";
	}
}
