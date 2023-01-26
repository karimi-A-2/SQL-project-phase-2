package Data.repository.DAOs;

import Data.model.Reminder;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class ReminderDAO implements Repository<Reminder,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;
    
    public ReminderDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }

    @Override
    public Reminder findById(Integer id) throws SQLException {
        try {
            statement = connection.prepareStatement("select * from Reminder where id = ?");
            statement.setInt(1,id);

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Reminder reminder=new Reminder(
                    resultSet.getInt("id"),
                    resultSet.getInt("ins_type"),
                    resultSet.getString("due_date"),
                    resultSet.getInt("ins_period"),
                    resultSet.getString("ins_description"),
                    resultSet.getInt("province_id"),
                    resultSet.getInt("city_id"),
                    resultSet.getInt("user_id")
            );
            return reminder;
        } catch (SQLException e) {
            System.out.println(" error in ReminderDAO.findByID method, the asked Reminder might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Reminder> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Reminder> reminders=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                reminders.add(findById(idArray.get(i)));
            }
            return reminders;
        } catch (SQLException e) {
            System.out.println("error in Reminder.DAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Reminder> findAll() throws SQLException {
        try {
            ArrayList<Reminder> reminders=new ArrayList<>();

            statement=connection.prepareStatement("select * from reminder");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Reminder reminder=new Reminder(
                        resultSet.getInt("id"),
                        resultSet.getInt("ins_type"),
                        resultSet.getString("due_date"),
                        resultSet.getInt("ins_period"),
                        resultSet.getString("ins_description"),
                        resultSet.getInt("province_Id"),
                        resultSet.getInt("city_Id"),
                        resultSet.getInt("user_Id")
                );
                reminders.add(reminder);
            }
            return reminders;
        } catch (SQLException e) {

            System.out.println("error in Reminder.DAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Reminder where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in Reminder.deleteByID");
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
            System.out.println("error in Reminder.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Reminder save(Reminder E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Reminder] " +
                "( [id], [ins_type], [due_date], [ins_period], [ins_description], [province_Id], [city_id], " +
                "[user_id]) VALUES (?,?,?,?,?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setInt(2, E.getIns_type());
        statement.setString(3, E.getDue_date());
        statement.setInt(4, E.getIns_period());
        statement.setString(5, E.getIns_description());
        statement.setInt(6,E.getProvinceId());
        statement.setInt(7,E.getCityId());
        statement.setInt(8,E.getUserId());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
