package Data.repository.DAOs;

import Data.model.Health_insurance;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class HealthInsuranceDAO implements Repository<Health_insurance,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public HealthInsuranceDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Health_insurance findById(Integer id) throws SQLException {
            try {
                statement=connection.prepareStatement("select * from Health_insurance where id = ?");
                statement.setInt(1,Integer.valueOf(id));

                ResultSet resultSet=statement.executeQuery();
                resultSet.next();

                Health_insurance hI=new Health_insurance(
                        resultSet.getInt("id"),
                        resultSet.getString("ins_service"),
                        resultSet.getInt("child_birth"),
                        resultSet.getInt("chronic_disease"),
                        resultSet.getInt("share_of_costs"),
                        resultSet.getInt("ins_id")
                );
                return hI;

            } catch (SQLException e) {
                System.out.println(" error in HealthInsuranceDAO.findByID method, the asked insurance might not exist in table");
                throw new RuntimeException(e);
            }
    }

    @Override
    public ArrayList<Health_insurance> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Health_insurance> insurances=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                insurances.add(findById(idArray.get(i)));
            }
            return insurances;
        } catch (SQLException e) {
            System.out.println("error in HealthInsuranceDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Health_insurance> findAll() throws SQLException {
        try {
            ArrayList<Health_insurance> insurances =new ArrayList<>();
            statement=connection.prepareStatement("select * from Health_insurance");

            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Health_insurance hI=new Health_insurance(
                        resultSet.getInt("id"),
                        resultSet.getString("ins_service"),
                        resultSet.getInt("child_birth"),
                        resultSet.getInt("chronic_disease"),
                        resultSet.getInt("share_of_costs"),
                        resultSet.getInt("ins_id")
                );
                        insurances.add(hI);
            }
            return insurances;
        } catch (SQLException e) {
            System.out.println("error in HealthInsuranceDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Health_insurance where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in HealthInsuranceDAO.deleteByID");
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
            System.out.println("error in HealthInsuranceDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Health_insurance save(Health_insurance E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Health_insurance] ( [id], [ins_service]," +
                "[child_birth], [chronic_disease], [share_of_costs], [ins_id] )VALUES (?,?,?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setString(2, E.getInsService());
        statement.setInt(3,E.getChildBirth());
        statement.setInt(4,E.getChronicDisease());
        statement.setInt(5,E.getShareOfCosts());
        statement.setInt(6,E.getIns_id());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
