package Data.repository.DAOs;

import Data.model.Property_inq;
import Data.repository.JDBC;
import Data.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class PropertyInqDAO implements Repository<Property_inq,Integer>,AutoCloseable {
    Connection connection;
    PreparedStatement statement;

    public PropertyInqDAO() throws SQLException {
        connection= JDBC.getJdbc().getConnection();
    }
    @Override
    public Property_inq findById(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("select * from Property_inq where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            ResultSet resultSet=statement.executeQuery();
            resultSet.next();

            Property_inq pI=new Property_inq(
                    resultSet.getInt("id"),
                    resultSet.getInt("province_id"),
                    resultSet.getInt("city_id"),
                    resultSet.getInt("structure_type"),
                    resultSet.getInt("uinit_count"),
                    resultSet.getInt("building_material"),
                    resultSet.getInt("life_building"),
                    resultSet.getInt("meterage"),
                    resultSet.getInt("cost_per_meter"),
                    resultSet.getInt("appliance_price"),
                    resultSet.getInt("inq_id")
            );
            return pI;

        } catch (SQLException e) {
            System.out.println(" error in PropertyInqDAO.findByID method, the asked inquiry might not exist in table");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Property_inq> findByIDs(Collection<Integer> ids) throws SQLException {
        try {
            ArrayList<Integer> idArray=new ArrayList<>(ids);
            ArrayList<Property_inq> propertyInqArrayList=new ArrayList<>();

            for (int i = 0; i < idArray.size(); i++) {
                propertyInqArrayList.add(findById(idArray.get(i)));
            }
            return propertyInqArrayList;
        } catch (SQLException e) {
            System.out.println("error in PropertyInqDAO.finaByIDs method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Property_inq> findAll() throws SQLException {
        try {
            ArrayList<Property_inq> propertyInqArrayList=new ArrayList<>();

            statement=connection.prepareStatement("select * from Property_inq");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Property_inq pI=new Property_inq(
                        resultSet.getInt("id"),
                        resultSet.getInt("province_id"),
                        resultSet.getInt("city_id"),
                        resultSet.getInt("structure_type"),
                        resultSet.getInt("uinit_count"),
                        resultSet.getInt("building_material"),
                        resultSet.getInt("life_building"),
                        resultSet.getInt("meterage"),
                        resultSet.getInt("cost_per_meter"),
                        resultSet.getInt("appliance_price"),
                        resultSet.getInt("inq_id")
                );
                propertyInqArrayList.add(pI);
            }
            return propertyInqArrayList;
        } catch (SQLException e) {
            System.out.println("error in PropertyInqDAO.finaAll method");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteByID(Integer id) throws SQLException {
        try {
            statement=connection.prepareStatement("delete from User_ where id = ?");
            statement.setInt(1,Integer.valueOf(id));

            if(statement.executeUpdate()>=1){
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("error in PropertyInqDAO.deleteByID");
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
            System.out.println("error in PropertyInqDAO.deleteByIDs");
            throw new RuntimeException(e);
        }

    }

    @Override
    public Property_inq save(Property_inq E) throws SQLException {
        deleteByID(Integer.valueOf(E.getId()));
        statement= connection.prepareStatement("INSERT INTO [Property_inq] " +
                "( [id], [province_id], [city_id], [structure_type], [uinit_count], [building_material], [life_building]," +
                " [meterage], [cost_per_meter], [appliance_price], [inq_id]) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
        statement.setInt(1,E.getId());
        statement.setInt(2, E.getProvinceId());
        statement.setInt(3, E.getCityId());
        statement.setInt(4, E.getStructureType());
        statement.setInt(5, E.getUinitCount());
        statement.setInt(6,E.getBuildingType());
        statement.setInt(7,E.getLifeBulding());
        statement.setInt(8,E.getMeterage());
        statement.setInt(9,E.getCostPerMeter());
        statement.setInt(10,E.getAppliancePrice());
        statement.setInt(11,E.getInq_id());

        return E;
    }

    @Override
    public void close() throws Exception {
        connection.close();
        statement.close();
    }
}
