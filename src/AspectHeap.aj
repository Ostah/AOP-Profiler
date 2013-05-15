import java.util.Hashtable;

/**
* Created with IntelliJ IDEA.
* User: Ostah
* Date: 07.05.13
* Time: 18:49
* To change this template use File | Settings | File Templates.
*/
public aspect AspectHeap {
    public static Hashtable usesList = new Hashtable();

    pointcut HeapUsage() : call(*.new(..)) && !within(AspectHeap)&&!within(AspectCount) && !within(AspectTimer) && !within(Sizeof);

    before(): HeapUsage(){
        Integer tot = getTotal(thisEnclosingJoinPointStaticPart);
        Class createdClass = thisJoinPoint.getStaticPart().getSignature().getDeclaringType();
        tot += Sizeof.sizeof(createdClass);
        System.out.println("tot= "+tot+ " "+thisEnclosingJoinPointStaticPart.getSignature().toString())            ;
        usesList.put(thisEnclosingJoinPointStaticPart,tot) ;
    }

    Integer getTotal(Object k){
        Integer s = (Integer) usesList.get(k);
        if(s == null){
            s = new Integer(0);
            usesList.put(k,s);
        }
        return  s;
    }





}
