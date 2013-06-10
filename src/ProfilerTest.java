import annotations.ProfilerProfile;

import java.util.Arrays;

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

    public void test(){
        int[] kickerNumbers = new int[100000];
        for(int i = 0; i < kickerNumbers.length; i++) {
            kickerNumbers[i] = (int)(Math.random()*0+9);
        }
        Arrays.sort(kickerNumbers);
    }

    public static void main(String[] args) {
        ProfilerTest profilerTest = new ProfilerTest();
//        Integer tralala = new Integer(1231);
        profilerTest.test();
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
