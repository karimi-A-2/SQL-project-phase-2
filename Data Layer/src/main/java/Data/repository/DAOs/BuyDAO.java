package Data.repository.DAOs;

import Data.model.Buy;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class BuyDAO implements Repository<Buy,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public BuyDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Buy findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Buy where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Buy buy=new Buy(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getInt("ins_id"),
                    resultSet.getInt("inq_id"),
                    resultSet.getString("discount_code"),
                    resultSet.getInt("final_price")
            );
            return buy;

        } catch (SQLException e) {
            System.out.println(" error in BuyDAO.findByID method, the asked buy item might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Buy> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Buy> buys=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                buys.add(findById(idArray.get(i)));
            }
            return buys;
        } catch (SQLException e) {
            System.out.println("error in BuyDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Buy> findAll() throws SQLException {
        try {
            ArrayList<Buy> buys =new ArrayList<>();
            statement=connection.prepareStatement("select * from Buy");

            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Buy buy=new Buy(
                        resultSet.getInt("id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("ins_id"),
                        resultSet.getInt("inq_id"),
                        resultSet.getString("discount_code"),
                        resultSet.getInt("final_price")
                );
                buys.add(buy);
            }
            return buys;
        } catch (SQLException e) {
            System.out.println("error in BuyDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Buy where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in BuyDAO.deleteByID");
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
            System.out.println("error in BuyDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Buy save(Buy E) throws SQLException {
        deleteByID(Integer.valueOf(E.getBuyId()));
        statement= connection.prepareStatement("INSERT INTO [Buy] ( [id], [user_id], [ins_id], [inq_id],[final_price]," +
                " [discount_code] )VALUES (?,?,?,?,?,?)");
        statement.setInt(1,E.getBuyId());
        statement.setInt(2, E.getUserId());
        statement.setInt(3,E.getInsId());
        statement.setInt(4,E.getInqId());
        statement.setInt(5,E.getFinalPrice());
        statement.setString(6,E.getDiscountCode());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
