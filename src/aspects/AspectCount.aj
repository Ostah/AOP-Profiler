package aspects;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 17.04.13
 * Time: 14:49
 * To change this template use File | Settings | File Templates.
 */


public aspect AspectCount extends AspectAllMethods {
    static public Map<String,Integer>  callCounts =  new HashMap<String,Integer>();

    after() : AllMethods() {
        String name =  thisJoinPoint.getSignature().toString();
        String caller = thisEnclosingJoinPointStaticPart.getSignature().toString();

        //zliczanie wywołań
        Integer i  =  callCounts.get(name);
        if(i  !=  null)  callCounts.put(name,new  Integer(i.intValue()+1));
        else  callCounts.put(name,new  Integer(1));

       // System.out.println("metoda : "+ name+" wywołana z : "+caller+"\n");
    }

    public static void printStats(){

        Iterator it=callCounts.entrySet().iterator();

        System.out.println("\nStatistics ------------------------------------------------------ ");
        while(it.hasNext()){
            Map.Entry m =(Map.Entry)it.next();
            String key=(String)m.getKey();
            Integer value=(Integer)m.getValue();
            System.out.println("Method: "+key+" was called "+value+" times");
        }
        System.out.println("-----------------------------------------------------------------\n") ;
        System.out.println(AspectHeap.usesList);
    }
}
