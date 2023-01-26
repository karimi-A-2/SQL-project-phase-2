package Data.repository.DAOs;

import Data.model.Life_inq;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class LifeInqDAO implements Repository<Life_inq,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public LifeInqDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Life_inq findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Life_inq where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Life_inq lI=new Life_inq(
                    resultSet.getInt("id"),
                    resultSet.getString("birth_date"),
                    resultSet.getInt("contract_period"),
                    resultSet.getInt("payment_way"),
                    resultSet.getInt("monthly_payment"),
                    resultSet.getInt("premiums_increase"),
                    resultSet.getInt("capital_increase"),
                    resultSet.getInt("death_coefficient"),
                    resultSet.getInt("inq_id")
                    );
            return lI;

        } catch (SQLException e) {
            System.out.println(" error in LifeInqDAO.findByID method, the asked inquiry might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Life_inq> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Life_inq> inqs=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                inqs.add(findById(idArray.get(i)));
            }
            return inqs;
        } catch (SQLException e) {
            System.out.println("error in LifeInqDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Life_inq> findAll() throws SQLException {
        try {
            ArrayList<Life_inq> inqs=new ArrayList<>();

            statement=connection.prepareStatement("select * from Life_inq");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Life_inq inq=new Life_inq(
                        resultSet.getInt("id"),
                        resultSet.getString("birth_date"),
                        resultSet.getInt("contract_period"),
                        resultSet.getInt("payment_way"),
                        resultSet.getInt("monthly_payment"),
                        resultSet.getInt("premiums_increase"),
                        resultSet.getInt("capital_increase"),
                        resultSet.getInt("death_coefficient"),
                        resultSet.getInt("inq_id")
                );
                inqs.add(inq);
            }
            return inqs;
        } catch (SQLException e) {
            System.out.println("error in LifeInqDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Life_inq where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in LifeInqDAO.deleteByID");
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
            System.out.println("error in LifeInqDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Life_inq save(Life_inq E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Life_inq] " +
                "( [id], [birth_date], [contract_period], [payment_way], [monthly_payment], [premiums_increase]," +
                " [capital_increase], [death_coefficient], [inq_id]) " +
                "VALUES (?,?,?,?,?,?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setString(2, E.getBirth_date());
        statement.setInt(3, E.getContractPeriod());
        statement.setInt(4, E.getPaymentWay());
        statement.setInt(5, E.getMonthlyPay());
        statement.setInt(6,E.getPremiumsIncrease());
        statement.setInt(7,E.getCapitalIncrease());
        statement.setInt(8,E.getDeathCoefficient());
        statement.setInt(9,E.getInq_id());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
