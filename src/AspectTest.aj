/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 17.04.13
 * Time: 14:49
 * To change this template use File | Settings | File Templates.
 */
public aspect AspectTest {
    pointcut greeting() : call(* ProfilerTest.firstTestMethod(..));

    after() : greeting() {
        System.out.println("AOP KURWA!");
    }
}
