/**
 * Created with IntelliJ IDEA.
 * User: Jacek
 * Date: 17.04.2013
 * Time: 12:47
 * To change this template use File | Settings | File Templates.
 */
public class ProfilerTest {

    ProfilerTest(){
        System.out.println("constructor");
    }
    public void firstTestMethod() {
        System.out.println("firstTestMethod");
    }

    public void secondTestMethod() {
        System.out.println("secondTestMethod");
    }

    public void otherMethod() {
        System.out.println("otherMethod");
        this.secondTestMethod();
    }

    public static void main(String[] args) {
        ProfilerTest profilerTest = new ProfilerTest();
        profilerTest.firstTestMethod();
//        profilerTest.firstTestMethod();
//        profilerTest.secondTestMethod();
//        profilerTest.otherMethod();
//        profilerTest.otherMethod();
//        profilerTest.otherMethod();

        AspectCount.printStats();
    }

}
