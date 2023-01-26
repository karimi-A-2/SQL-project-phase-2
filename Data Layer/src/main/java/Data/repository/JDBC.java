package Data.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {
    private static JDBC jdbc=new JDBC();

    private JDBC() {
    }

    public static JDBC getJdbc() {
        return jdbc;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:sqlserver://LAPTOP-OKEOK3S5;encrypt=true;trustServerCertificate=true;" +
                "databaseName=projDB1;IntegratedSecurity=true");
    }
}
