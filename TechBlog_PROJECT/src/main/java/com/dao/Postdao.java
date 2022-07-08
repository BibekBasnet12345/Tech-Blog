package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;

import com.entities.Categories;
import com.entities.Post;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class Postdao {
			Connection con;
			public Postdao(Connection con) {
				super();
				this.con = con;
			}
      public ArrayList<Categories> getALLCategories(){
				ArrayList<Categories> list =new ArrayList<Categories>();
				try {
						String q="select * from categories";
						Statement st=(Statement) this.con.createStatement();
						ResultSet set=st.executeQuery(q);
						while (set.next())
						{
						int cid=set.getInt("cid");
						String cname=set.getString("cname");
						String description=set.getString("description");
						Categories c=new Categories(cid,cname,description);
						list.add(c);
						}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return list;
			}
	 public boolean Savepost(Post p) {
			 boolean	flag=false;
			 try {
				String q="insert into posts(pTitle,pContent,pCode,pPic,catID,userID) values(?,?,?,?,?,?)";
				PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(q);
				pstmt.setString(1, p.getpTitle());
				pstmt.setString(2,p.getpContent());
				pstmt.setString(3,p.getpCode());
				pstmt.setString(4, p.getpPic());
				pstmt.setInt(5,p.getCatId());
				pstmt.setInt(6,p.getUserID());
				pstmt.executeUpdate();
				
			flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			 return flag;
			}
		
	 
	 //get all posts
			public List<Post> getAllPost() {
			
				List<Post> pli=new ArrayList<Post>();
				//fetch all post
				try {
					String q="select * from posts order by pid desc";
					PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(q);
					ResultSet set=pstmt.executeQuery();
					while (set.next()) {
					int pid=set.getInt("pid");	
					String pTitle=set.getString("pTitle");
					String pContent=set.getString("pContent");
					String pCode=set.getString("pCode");
					String pPic=set.getString("pPic");
					Timestamp time=set.getTimestamp("pDate");
					int catid=set.getInt("catID");	
					int userID=set.getInt("userID");	
	         		Post p=new Post(pid, pTitle, pContent, pCode, pPic, time, catid, userID);
                    pli.add(p)	;		
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return pli;

			}
			 //getpost by particular catID
			public List< Post> getPostByCatID(int catID) {
						List<Post> pli=new ArrayList<Post>();
						try {
							String q="select * from posts where catID=?";
							PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(q);
							pstmt.setInt(1, catID);
							ResultSet set=pstmt.executeQuery();
							while (set.next()) {
							int pid=set.getInt("pid");	
							String pTitle=set.getString("pTitle");
							String pContent=set.getString("pContent");
							String pCode=set.getString("pCode");
							String pPic=set.getString("pPic");
							Timestamp time=set.getTimestamp("pDate");

							int userID=set.getInt("userID");	
							Post p=new Post(pid, pTitle, pContent, pCode, pPic, time, catID, userID);
		                    pli.add(p)	;		
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
						return pli;
			}
           
			public Post getPostbyIdPost(int postId) {
				Post p=null;
				String q="select * from posts where pid=?";
				try {
					PreparedStatement pstmt=(PreparedStatement) this.con.prepareStatement(q);
					pstmt.setInt(1, postId);
					ResultSet set=pstmt.executeQuery();
					if (set.next()) {
						Post post=new  Post();
						int pid=set.getInt("pid");	
						String pTitle=set.getString("pTitle");
						String pContent=set.getString("pContent");
						String pCode=set.getString("pCode");
						String pPic=set.getString("pPic");
						Timestamp time=set.getTimestamp("pDate");
						int catID=set.getInt("catID");
						int userID=set.getInt("userID");	
						p=new Post(pid, pTitle, pContent, pCode, pPic, time, catID, userID);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return  p;
				
			}
}
