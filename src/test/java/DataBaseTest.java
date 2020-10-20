import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DataBaseTest {
    @Test
    public void test1() throws SQLException {
        //创建数据源
        DruidDataSource dataSource = new DruidDataSource();
//设置数据库连接参数
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://39.96.71.36:3306/dbtest");
        dataSource.setUsername("root");
        dataSource.setPassword("root");
//获得连接对象
        Connection connection = dataSource.getConnection();
        System.out.println(connection);
    }
}
