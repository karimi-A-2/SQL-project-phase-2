package Data.repository.DAOs;

import Data.model.Property_ins;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class PropertyInsuranceDAO implements Repository<Property_ins,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public PropertyInsuranceDAO() throws SQLException {
        connection=JDBC.getJdbc().getConnection();
    }
    @Override
    public Property_ins findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Property_ins where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Property_ins pI=new Property_ins(
                    resultSet.getInt("id"),
                    resultSet.getInt("rating"),
                    resultSet.getInt("ability"),
                    resultSet.getInt("satisfaction"),
                    resultSet.getInt("branch"),
                    resultSet.getInt("ins_id")
            );
            return pI;

        } catch (SQLException e) {

            System.out.println(" error in PropertyInsuranceDAO.findByID method," +
                    " the asked Insurance might not exist in the table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Property_ins> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Property_ins> propertyInsArrayList=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                propertyInsArrayList.add(findById(idArray.get(i)));
            }
            return propertyInsArrayList;

        } catch (SQLException e) {
            System.out.println("error in PropertyInsuranceDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Property_ins> findAll() throws SQLException {
        try {
            ArrayList<Property_ins> propertyInsArrayList=new ArrayList<>();

            statement=connection.prepareStatement("select * from Property_ins");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Property_ins pI=new Property_ins(
                        resultSet.getInt("id"),
                        resultSet.getInt("rating"),
                        resultSet.getInt("ability"),
                        resultSet.getInt("satisfaction"),
                        resultSet.getInt("branch"),
                        resultSet.getInt("ins_id")
                );
                propertyInsArrayList.add(pI);
            }
            return propertyInsArrayList;

        } catch (SQLException e) {
            System.out.println("error in PropertyInsuranceDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Property_ins where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in PropertyInsuranceDAO.deleteByID");
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
            System.out.println("error in PropertyInsuranceDAO.deleteByIDs");
            throw new RuntimeException(e);
        }

    }

    @Override
    public Property_ins save(Property_ins E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Property_ins] " +
                "( [id], [rating], [ability], [satisfaction], [branch], [ins_id] VALUES (?,?,?,?,?,?)");
        statement.setInt(1, E.getId());
        statement.setInt(2, E.getRating());
        statement.setInt(3, E.getAbility());
        statement.setInt(4, E.getSatisfaction());
        statement.setInt(5,E.getBranch());
        statement.setInt(6,E.getIns_id());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
