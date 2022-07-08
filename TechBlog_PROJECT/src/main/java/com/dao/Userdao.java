package com.dao;

import java.sql.*;
import java.sql.ResultSet;
import com.entities.User;
import com.mysql.jdbc.PreparedStatement;

public class Userdao {
   private Connection con;

          public Userdao(Connection con) {
	         super();
	           this.con = con;
                }
   //method to insert value in database.
        public boolean saveuser(User user) {
	    boolean f=false;
					try {
						String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";	
		         		PreparedStatement pstmt=	(PreparedStatement) this.con.prepareStatement(query);
		         		pstmt.setString(1,user.getName());
		         		pstmt.setString(2,user.getEmail());
		         		pstmt.setString(3,user.getPassword());
		         		pstmt.setString(4,user.getGender());
		         		pstmt.setString(5,user.getAbout());
		               pstmt.executeUpdate();
						f=true;
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return f;
				}
  //get user by useremail and userpassword
		   public User getUserByEmailAndPassword(String email,String password) {
			   User user=null;
			   try {
				String q="select * from user where email=? and password=?";
				PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(q);
				pstmt.setString(1, email);
				pstmt.setString(2,password);
			   ResultSet set=	pstmt.executeQuery();
			    if (set.next()) {
				user=new User();
				//from data
				String name=set.getString("name");
				//set to user object
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("reg_date"));
				user.setProfile(set.getString("profile"));
				
			}
			   
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			   return user;
		   }
		   public boolean UpdateUserDetails(User user) {
			 
			   boolean f=false;
			   try {
				   String query="update user set name=?,email=?,password=?,gender=?,profile=?,about=? where id=?";	 
	         		PreparedStatement pstmt=	(PreparedStatement) this.con.prepareStatement(query);
	         		pstmt.setString(1,user.getName());
	         		pstmt.setString(2,user.getEmail());
	         		pstmt.setString(3,user.getPassword());
	         		pstmt.setString(4,user.getGender());
	         		pstmt.setString(5,user.getProfile());
	         		pstmt.setString(6,user.getAbout());
	         		pstmt.setInt(7,user.getId());
	               pstmt.executeUpdate();
	               f=true;
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			   return f;
		   }

        public User getUserbyUserID(int userID) {
        	User user=null;
        		try {
					String q="select * from user where id=?";
					PreparedStatement pstmt=(PreparedStatement) this.con.prepareStatement(q);
					pstmt.setInt(1, userID);
					ResultSet set=pstmt.executeQuery();
					if(set.next()) {
						//from data
                        user=new User();
						//set to user object
						user.setName(set.getString("name"));
						user.setId(set.getInt("id"));
						user.setEmail(set.getString("email"));
						user.setPassword(set.getString("password"));
						user.setGender(set.getString("gender"));
						user.setAbout(set.getString("about"));
						user.setDateTime(set.getTimestamp("reg_date"));
						user.setProfile(set.getString("profile"));
					}
					
				} catch (Exception e) {
				e.printStackTrace();
				}
        	return user;	
        }
}
 