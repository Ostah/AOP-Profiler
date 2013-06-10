package aspects;

import java.util.ArrayList;
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
    static public Map<MethodCall,Integer>  callCountsAccurate =  new HashMap<MethodCall,Integer>();

    after() : AllMethods() {
        String name =  thisJoinPoint.getSignature().toString();
        String caller = thisEnclosingJoinPointStaticPart.getSignature().toString();

        //zliczanie wywołań
        Integer i  =  callCounts.get(name);
        if(i  !=  null)  callCounts.put(name,new  Integer(i.intValue()+1));
        else  callCounts.put(name,new  Integer(1));

        //zliczanie wywolań z danego callera
        MethodCall temp = new MethodCall(name,caller);
        i  =  callCountsAccurate.get(temp);
        if(i  !=  null)  callCountsAccurate.put(temp,new  Integer(i.intValue()+1));
        else  callCountsAccurate.put(temp,new  Integer(1));

    }

    public static void printStats(){



        Logger.get().writeLine("\nStatistics Method Calls ------------------------------------------------------ ");
        Iterator it=callCounts.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry m =(Map.Entry)it.next();
            String key=(String)m.getKey();
            Integer value=(Integer)m.getValue();
            Logger.get().writeLine("Method: "+key+" was called "+value+" times");
        }
        Logger.get().writeLine("-----------------------------------------------------------------\n\n") ;

        Logger.get().writeLine("\nStatistics Caller/Method Calls ------------------------------------------------------ ");
        it=callCountsAccurate.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry m = (Map.Entry)it.next();
            Logger.get().writeLine("Method: "+((MethodCall) m.getKey()).getMethod()+" was called from "+((MethodCall) m.getKey()).getCaller() + " "+ m.getValue()+" times");
        }
        Logger.get().writeLine("-----------------------------------------------------------------\n\n") ;
    }

    public static Object[][] getCallerMethod(){
        Iterator it=callCountsAccurate.entrySet().iterator();
        Object[][] o = new Object[callCountsAccurate.size()][3];
        int i = 0;
        while(it.hasNext()){
            Map.Entry m = (Map.Entry)it.next();
            o[i][0] = ((MethodCall) m.getKey()).getCaller();
            o[i][1] = ((MethodCall) m.getKey()).getMethod();
            o[i][2] = m.getValue() ;
            i++;
        }
        return o;
    }
    public static Object[][] getCaller(){
        Iterator it=callCounts.entrySet().iterator();
        Object[][] o = new Object[callCounts.size()][2];
        int i = 0;
        while(it.hasNext()){
            Map.Entry m = (Map.Entry)it.next();
            o[i][0] = (String) m.getKey();
            o[i][1] = m.getValue() ;
            i++;
        }
        return o;
    }

}
