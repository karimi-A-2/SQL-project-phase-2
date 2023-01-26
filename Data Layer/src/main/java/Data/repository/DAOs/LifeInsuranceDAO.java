package Data.repository.DAOs;

import Data.model.Life_insurance;
import Data.model.User;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class LifeInsuranceDAO implements Repository<Life_insurance,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public LifeInsuranceDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Life_insurance findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Life_insurance where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Life_insurance lI=new Life_insurance(
                    resultSet.getInt("id"),
                    resultSet.getInt("redemption_value"),
                    resultSet.getInt("death_capital"),
                    resultSet.getInt("medical_expences"),
                    resultSet.getInt("ins_id")
            );
            return lI;

        } catch (SQLException e) {
            System.out.println(" error in LifeInsuranceDAO.findByID method, the asked Insurance might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Life_insurance> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Life_insurance> insurances=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                insurances.add(findById(idArray.get(i)));
            }
            return insurances;
        } catch (SQLException e) {
            System.out.println("error in LifeInsuranceDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Life_insurance> findAll() throws SQLException {
        try {
            ArrayList<Life_insurance> insurances=new ArrayList<>();

            statement=connection.prepareStatement("select * from Life_insurance");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Life_insurance lI=new Life_insurance(
                        resultSet.getInt("id"),
                        resultSet.getInt("redemption_value"),
                        resultSet.getInt("death_capital"),
                        resultSet.getInt("medical_expences"),
                        resultSet.getInt("ins_id")
                );
                insurances.add(lI);
            }
            return insurances;
        } catch (SQLException e) {
            System.out.println("error in LifeInsuranceDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Life_insurance where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in LifeInsuranceDAO.deleteByID");
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
            System.out.println("error in LifeInsuranceDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Life_insurance save(Life_insurance E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [User_] " +
                "( [id], [redemption_value], [death_capital], [medical_expences], [ins_id] VALUES (?,?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setInt(2, E.getRedemptionValue());
        statement.setInt(3, E.getDeathCapital());
        statement.setInt(4, E.getMedicalExpences());
        statement.setInt(5, E.getIns_id());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
