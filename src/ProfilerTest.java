/**
 * Created with IntelliJ IDEA.
 * User: Jacek
 * Date: 17.04.2013
 * Time: 12:47
 * To change this template use File | Settings | File Templates.
 */
public class ProfilerTest {


    public void firstTestMethod() {
        System.out.println("firstTestMethod");
    }

    public void secondTestMethod() {
        System.out.println("secondTestMethod");
    }

    public static void main(String[] args) {
        ProfilerTest profilerTest = new ProfilerTest();
        profilerTest.firstTestMethod();
        profilerTest.secondTestMethod();
    }

}
