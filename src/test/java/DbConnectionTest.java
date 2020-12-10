import org.testng.annotations.Test;

import java.sql.*;

public class DbConnectionTest {

    @Test
    public void testDbConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressbook?serverTimezone=Europe/Moscow&user=root&password=");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from month_lookup");
            while (rs.next()){
                System.out.println(rs.toString());
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
