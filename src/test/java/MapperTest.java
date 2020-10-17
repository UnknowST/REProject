import com.daomain.User;
import com.service.LoginService;
import com.service.Userservice;
import com.service.impl.LoginServiceImpl;
import com.service.impl.UserserviceImpl;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.io.IOException;

public class MapperTest {
    @Test
    public void test1(){
        Userservice userservice=new UserserviceImpl();

            System.out.println(userservice.findall());

    }
    @Test
    public void test2(){

        LoginService loginService=new LoginServiceImpl();
        User user=new User();
        user.setUserid("1853130");
        user.setPassword("111");
        User user1=loginService.Userlogin(user);
        System.out.println(user1);
    }
}
