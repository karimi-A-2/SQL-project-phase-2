package Data;

import Data.model.*;
import Data.repository.DAOs.*;
import Data.repository.JDBC;

import java.sql.*;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws SQLException {
        UserDAO userDAO=new UserDAO();
        User user=new User(35,"kghn,","gcghvbv","hgmmmmm","gjgvbmb","ssssss",true);
        userDAO.save(user);
    }
}