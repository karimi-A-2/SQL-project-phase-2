package Data.repository.DAOs;

import Data.model.Health_inq;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class HealthInqDAO implements Repository<Health_inq,Integer>,AutoCloseable {
    private Connection connection;
    private PreparedStatement statement;

    public HealthInqDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }

    @Override
    public Health_inq findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Health_inq where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Health_inq inq=new Health_inq(
                    resultSet.getInt("id"),
                    resultSet.getBoolean("is_family"),
                    resultSet.getInt("inq_id"),
                    resultSet.getInt("count_of_memeber")
            );
            return inq;

        } catch (SQLException e) {
            System.out.println(" error in HealthInqDAO.findByID method, the asked inquiry might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Health_inq> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Health_inq> inqs=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                inqs.add(findById(idArray.get(i)));
            }
            return inqs;
        } catch (SQLException e) {
            System.out.println("error in HealthInqDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Health_inq> findAll() throws SQLException {
        try {
            ArrayList<Health_inq> inqs =new ArrayList<>();
            statement=connection.prepareStatement("select * from Health_inq");

            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Health_inq hI=new Health_inq(
                        resultSet.getInt("id"),
                        resultSet.getBoolean("is_family"),
                        resultSet.getInt("inq_id"),
                        resultSet.getInt("count_of_memeber")
                );
                inqs.add(hI);
            }
            return inqs;
        } catch (SQLException e) {
            System.out.println("error in HealthInqDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Health_inq where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in HealthInqDAO.deleteByID");
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
            System.out.println("error in HealthInqDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Health_inq save(Health_inq E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Health_inq] ( [id], [inq_id], [is_family]," +
                "[count_of_memeber] )VALUES (?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setInt(2, E.getInq_id());
        statement.setBoolean(3,E.isFamily());
        statement.setInt(4,E.getCountOfMembers());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
