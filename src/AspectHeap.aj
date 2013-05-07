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
        Integer tot = getTotal(thisEnclosingJoinPointStaticPart);
        Class createdClass = thisJoinPoint.getStaticPart().getSignature().getDeclaringType();

        if(createdClass.isArray()){
            Object[] data = thisJoinPoint.getArgs();
            tot += sizeof(createdClass,data);
        }
        else{
            tot += sizeof(createdClass);
        }
    }

    Integer getTotal(Object k){
        Integer s = (Integer) usesList.get(k);
        if(s == null){
            s = new Integer(0);
            usesList.put(k,s);
        }
        return  s;
    }

    Integer sizeof(Class c) {
        return  0;
    }
    Integer sizeof(Class c, Object arrayDimensions) {
        return  0;
    }
}
