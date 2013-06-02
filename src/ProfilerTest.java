import annotations.ProfilerProfile;

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

    @ProfilerProfile
    public void firstTestMethod() {
        //System.out.println("firstTestMethod");


    }

    public void secondTestMethod() {
       // HeapTestClass a = new HeapTestClass();
        firstTestMethod();
    }

    public void otherMethod() {
        firstTestMethod();
        secondTestMethod();
    }

    public static void main(String[] args) {
        ProfilerTest profilerTest = new ProfilerTest();
//        Integer tralala = new Integer(1231);
        profilerTest.otherMethod();
        profilerTest.secondTestMethod();
//        profilerTest.firstTestMethod();
//        profilerTest.firstTestMethod();
//        profilerTest.secondTestMethod();
//        profilerTest.otherMethod();
//        profilerTest.otherMethod();
//        profilerTest.otherMethod();



    }

}
