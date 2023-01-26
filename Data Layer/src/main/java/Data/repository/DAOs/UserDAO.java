package Data.repository.DAOs;

import Data.model.User;
import Data.repository.JDBC;
import Data.repository.Repository;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class UserDAO implements Repository<User,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public UserDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }

    @Override
    public User findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from User_ where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            User user0=new User(
                    resultSet.getInt("id"),
                    resultSet.getString("phone"),
                    resultSet.getString("fname"),
                    resultSet.getString("lname"),
                    resultSet.getString("pass"),
                    resultSet.getInt("invatation"),
                    resultSet.getBoolean("is_Logged_In")
            );
            return user0;

        } catch (SQLException e) {
            System.out.println(" error in userDAO.findByID method, the asked user might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<User> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<User> users=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                users.add(findById(idArray.get(i)));
            }
            return users;
        } catch (SQLException e) {
            System.out.println("error in UserDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<User> findAll() throws SQLException {
        try {
            ArrayList<User> users=new ArrayList<>();

            statement=connection.prepareStatement("select * from user_");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                User user0=new User(
                        resultSet.getInt("id"),
                        resultSet.getString("phone"),
                        resultSet.getString("fname"),
                        resultSet.getString("lname"),
                        resultSet.getString("pass"),
                        resultSet.getInt("invatation"),
                        resultSet.getBoolean("is_Logged_In")
                );
                users.add(user0);
            }
            return users;
        } catch (SQLException e) {
            System.out.println("error in UserDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from User_ where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in UserDAO.deleteByID");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean DeleteByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            Boolean output=Boolean.valueOf(true);

            for (int i = 0; i < idArray.size(); i++) {
                if(!deleteByID(idArray.get(i))) {
                    output = Boolean.valueOf(false);
                }
            }
            return output;
        } catch (SQLException e) {
            System.out.println("error in User.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public User save(User E) throws SQLException {
        try {
            deleteByID(Integer.valueOf(E.getId()));
            statement= connection.prepareStatement("INSERT INTO [User_] " +
                    "( [id], [phone], [code], [fname], [lname], [pass], [invatation], [is_logged_in]) " +
                    "VALUES (?,?,?,?,?,?,?,?)");
            connection.commit();
            statement.setInt(1,E.getId());
            statement.setString(2, E.getPhone());
            statement.setString(3, E.getCode());
            statement.setString(4, E.getFname());
            statement.setString(5, E.getLname());
            statement.setString(6,E.getPassWord());
            statement.setBoolean(7,E.isLogedIn());


            return E;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void close() throws Exception {
        statement.close();
        connection.close();
    }
}
