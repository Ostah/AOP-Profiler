import java.util.Hashtable;

/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 07.05.13
 * Time: 18:49
 * To change this template use File | Settings | File Templates.
 */
public aspect AspectHeap {
    Hashtable usesList = new Hashtable();

    pointcut HeapUsage() : call(*.new(..)) && within(AspectHeap);

    before(): HeapUsage(){
        Class createdClass = thisJoinPoint.getStaticPart().getSignature().getDeclaringType();

        if(createdClass.isArray()){

        }
    }
}
