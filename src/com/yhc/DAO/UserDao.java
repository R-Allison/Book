package com.yhc.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {  
    public String findUsername(String username){  
        String psw = null;  
        Connection con =null;  
        PreparedStatement pstmt =null;  
        ResultSet rs = null;  
        try {   
            con = DBHelper.getConnection();  
            String sql = "select * from user where username=?";  
            pstmt = con.prepareStatement(sql);  
            pstmt.setString(1, username);  
            rs = pstmt.executeQuery();  
            if(rs==null){  
                return null;  
            }  
            if(rs.next()){  
                psw=rs.getString("password");  
            }else{  
                psw=null;  
            }  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }finally {  
            try {  
                if(pstmt!=null)pstmt.close();  
                if(con!=null)con.close();  
                }   
            catch (SQLException e) {          
                                    }  
        }  
        return psw;  
    }  
//    µ•∂¿≤‚ ‘ π”√  
//    public static void main(String[] args) {  
//        String psw =new UserDao().findUsername("zhou");  
//        System.out.println(psw);   
//    }  
      
}  