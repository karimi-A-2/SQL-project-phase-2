package Data.repository.DAOs;

import Data.model.Inquriy;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class InquiryDAO implements Repository<Inquriy,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public InquiryDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Inquriy findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Inqury where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Inquriy inquriy=new Inquriy(
                    resultSet.getInt("id"),
                    resultSet.getInt("inq_type")
            );
            return inquriy;

        } catch (SQLException e) {
            System.out.println(" error in InquiryDAO.findByID method, the asked inquiry might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Inquriy> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Inquriy> inquriys=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                inquriys.add(findById(idArray.get(i)));
            }
            return inquriys;
        } catch (SQLException e) {
            System.out.println("error in InquiryDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Inquriy> findAll() throws SQLException {
        try {
            ArrayList<Inquriy> inquriys =new ArrayList<>();
            statement=connection.prepareStatement("select * from Inqury");

            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Inquriy inquriy=new Inquriy(
                        resultSet.getInt("id"),
                        resultSet.getInt("inq_type")
                );
                inquriys.add(inquriy);
            }
            return inquriys;
        } catch (SQLException e) {
            System.out.println("error in InquiryDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Inqury where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in InquiryDAO.deleteByID");
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
            System.out.println("error in InquiryDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Inquriy save(Inquriy E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Inqury] ( [id], [inq_type] )VALUES (?,?)");
        statement.setInt(1,E.getId());
        statement.setInt(2, E.getType());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
