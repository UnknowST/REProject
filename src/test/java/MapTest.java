import com.daomain.Infor;
import com.mapper.Workermapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Scanner;

public class MapTest {
    @Test
    public void test1() throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("sqlMapConfig-spring.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //获得MyBatis框架生成的UserMapper接口的实现类
        Workermapper workermapper = sqlSession.getMapper(Workermapper.class);
        List<Infor> listinfor = workermapper.Listinfor("11111");
        System.out.println(listinfor);
        sqlSession.close();

    }
    @Test
    public void test2(){
        String path;
        Scanner sc=new Scanner(System.in);
        path=sc.nextLine();
    System.out.println("null".equals(path));
    }
}
