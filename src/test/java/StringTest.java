import org.junit.Test;

import java.util.Scanner;

public class StringTest {
    @Test
    public void test2(){
        String path;
        Scanner sc=new Scanner(System.in);
        path=sc.nextLine();
        System.out.println("null".equals(path));
    }
}
