package com.dao;

import com.bean.LoginBean;
import com.connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
    public boolean login(LoginBean u) throws SQLException {
        String userName = u.getUserName();
        String password = u.getPassword();
        
        try (Connection con = DBConnect.Connect();
             PreparedStatement pt = con.prepareStatement("SELECT * FROM user WHERE UserName = ? AND Password = ?")) {
            
            pt.setString(1, userName);
            pt.setString(2, password);
            
            ResultSet rs = pt.executeQuery();
            return rs.next();
        }
    }
    
    public String recog(LoginBean u) throws SQLException {
    	String user = u.getUserName();
    	try (Connection con = DBConnect.Connect();
               PreparedStatement pt = con.prepareStatement("SELECT * FROM admin WHERE UserName = ?")) {
               
               pt.setString(1, user);
               
               ResultSet rs = pt.executeQuery();
               if(rs.next()) {
            	   if(rs.getBoolean(3) == true) {
            		   return "S";
            	   }
            	   else {
            		   return "I";
            	   }
               }
               return "U";
           }
    }
}
