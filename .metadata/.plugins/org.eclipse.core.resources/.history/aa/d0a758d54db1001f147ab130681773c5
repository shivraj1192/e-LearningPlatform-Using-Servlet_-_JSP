package com.dao;

import com.bean.LoginBean;
import com.bean.SignupBean;
import com.connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignupDao {
    public boolean signup(SignupBean u) throws SQLException {
        String uname = u.getuName();
        String upwd = u.getuPwd();
        String fname = u.getfName();
        String lname = u.getlName();
        String email = u.getuEmail();
        Connection con = DBConnect.Connect();
        PreparedStatement st = con.prepareStatement("SELECT MAX(id) FROM user");
        ResultSet rs = st.executeQuery();
        int id = 0;
        if(rs.next()) {
        	id = rs.getInt(1);
        	id++;
        }
        
        PreparedStatement pt = con.prepareStatement("INSERT INTO user (id,userName, firstName, lastName, email, password) VALUES (?,?, ?, ?, ?, ?)");
        
        
            pt.setInt(1, id);
            pt.setString(2, uname);
            pt.setString(3, fname);
            pt.setString(4, lname);
            pt.setString(5, email);
            pt.setString(6, upwd);
            
            int i = pt.executeUpdate();
            return i > 0;
        
    }
}
