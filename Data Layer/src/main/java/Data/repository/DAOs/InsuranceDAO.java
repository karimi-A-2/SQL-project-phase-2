package Data.repository.DAOs;

import Data.model.Insurance;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class InsuranceDAO implements Repository<Insurance,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public InsuranceDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Insurance findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Insurance where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Insurance insurance=new Insurance(
                    resultSet.getInt("id"),
                    resultSet.getInt("company_id"),
                    resultSet.getInt("price"),
                    resultSet.getInt("ins_type"),
                    resultSet.getInt("discount")
            );
            return insurance;

        } catch (SQLException e) {
            System.out.println(" error in InsuranceDAO.findByID method, the asked Insurance might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Insurance> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Insurance> insurances=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                insurances.add(findById(idArray.get(i)));
            }
            return insurances;
        } catch (SQLException e) {
            System.out.println("error in InsuranceDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Insurance> findAll() throws SQLException {
        try {
            ArrayList<Insurance> insurances =new ArrayList<>();

            statement=connection.prepareStatement("select * from Insurance");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Insurance insurance=new Insurance(
                        resultSet.getInt("id"),
                        resultSet.getInt("company_id"),
                        resultSet.getInt("price"),
                        resultSet.getInt("ins_type"),
                        resultSet.getInt("discount")
                );
                insurances.add(insurance);
            }
            return insurances;
        } catch (SQLException e) {
            System.out.println("error in InsuranceDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Insurance where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in InsuranceDAO.deleteByID");
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
            System.out.println("error in InsuranceDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Insurance save(Insurance E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Insurance] " +
                "( [id], [company_id], [price], [ins_type], [discount]) VALUES (?,?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setInt(2, E.getCompanyId());
        statement.setInt(3, E.getPrice());
        statement.setInt(4, E.getType());
        statement.setInt(5, E.getDiscount());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
