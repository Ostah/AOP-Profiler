import org.aspectj.lang.reflect.MethodSignature;

/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 17.04.13
 * Time: 14:49
 * To change this template use File | Settings | File Templates.
 */
public aspect AspectTest {
    pointcut AllMethods() : (call(* *(..)) && !within(AspectTest));

    after() : AllMethods() {
        System.out.println("metoda : "+ thisJoinPoint.getSignature()+" wywołana z : "+thisEnclosingJoinPointStaticPart.getSignature()+"\n");
    }
}
