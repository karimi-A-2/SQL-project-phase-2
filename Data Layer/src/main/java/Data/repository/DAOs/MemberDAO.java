package Data.repository.DAOs;

import Data.model.Member;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class MemberDAO implements Repository<Member,Integer>,AutoCloseable {
    Connection connection;
    PreparedStatement statement;

    public MemberDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Member findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Member where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Member member=new Member(
                    resultSet.getInt("id"),
                    resultSet.getInt("base_ins"),
                    resultSet.getInt("age_range"),
                    resultSet.getInt("relation"),
                    resultSet.getInt("head_id"),
                    resultSet.getInt("health_inq_id")
            );
            return member;

        } catch (SQLException e) {
            System.out.println(" error in MemberDAO.findByID method, the asked member might not exist in table");
            throw new RuntimeException(e);
        }

    }

    @Override
    public ArrayList<Member> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Member> members=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                members.add(findById(idArray.get(i)));
            }
            return members;
        } catch (SQLException e) {
            System.out.println("error in MemberDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Member> findAll() throws SQLException {
        try {
            ArrayList<Member> members=new ArrayList<>();

            statement=connection.prepareStatement("select * from Member");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Member member=new Member(
                        resultSet.getInt("id"),
                        resultSet.getInt("base_ins"),
                        resultSet.getInt("age_range"),
                        resultSet.getInt("relation"),
                        resultSet.getInt("head_id"),
                        resultSet.getInt("health_inq_id")
                );
                members.add(member);
            }
            return members;
        } catch (SQLException e) {
            System.out.println("error in MemberDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from Member where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in MemberDAO.deleteByID");
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
            System.out.println("error in MemberDAO.deleteByIDs");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Member save(Member E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Member] " +
                "( [id], [base_ins], [age_range], [relation], [head_id],[health_inq_id] VALUES (?,?,?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setInt(2, E.getBase_in());
        statement.setInt(3, E.getAge_range());
        statement.setInt(4, E.getRelation());
        statement.setInt(5, E.getHead_id());
        statement.setInt(6,E.getHead_id());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
