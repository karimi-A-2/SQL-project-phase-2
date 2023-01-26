package Data.repository;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface Repository <Entity,ID extends Serializable>{
    Entity findById(ID id) throws SQLException;
    ArrayList<Entity> findByIDs(Collection<ID> ids) throws SQLException;
    ArrayList<Entity> findAll() throws SQLException;
    Boolean deleteByID(ID id) throws SQLException;
    Boolean DeleteByIDs(Collection<ID> ids) throws SQLException;
    Entity save(Entity E) throws SQLException; // saves the Entity, if already exists updates it, then returns the entity with the given id by the database

}
