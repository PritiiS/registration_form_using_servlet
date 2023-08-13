package com.login_form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig
public class register extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			Thread.sleep(3000);
			PrintWriter pw = response.getWriter();

			String fname = request.getParameter("user_fname");
			String lname = request.getParameter("user_lname");
			String password = request.getParameter("user_password");
			String email = request.getParameter("user_email");
			String gender = request.getParameter("user_gender");
			Part part=request.getPart("image");
			String filename=part.getSubmittedFileName();
//			pw.println(filename);
			
//			pw.println(fname);
//			pw.println(lname);
//			pw.println(password);
//			pw.println(gender);
//			pw.println(email);

//			String driver = "com.mysql.cj.jdbc.Driver";
			String database_url = "jdbc:mysql://localhost:3306/login";
			String name = "root";
			String paasword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(database_url, name, paasword);
			System.out.println("database is connected");

			String que = "insert into user_info(fname,lname,password,email_id,gender,image) values(?,?,?,?,?,?)";
			PreparedStatement ppst = con.prepareStatement(que);
//			ppst.setString(1, id);
			ppst.setString(1, fname);
			ppst.setString(2, lname);
			ppst.setString(3, password);
			ppst.setString(4, email);
			ppst.setString(5, gender);
			ppst.setString(6, filename);

			ppst.executeUpdate();
			
//			uploading....
			InputStream is=part.getInputStream();
			byte []photo_data=new byte[is.available()];
			is.read(photo_data);
			
			String path="C:\\Users\\lenovo\\eclipse-workspace\\login_form\\build\\classes\\"+"img"+ File.separator +filename;
		//	pw.println(path);
			FileOutputStream fos=new FileOutputStream(path);
			
			fos.write(photo_data);
			fos.close();
//		
			pw.println("connected");

		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("this " + e + " kind of error has occur..");
		}

	}

}
