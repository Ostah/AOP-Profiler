package aspects; /**
* Created with IntelliJ IDEA.
* User: Jacek
* Date: 07.05.2013
* Time: 21:02
* To change this template use File | Settings | File Templates.
*/

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ArrayList;

public aspect AspectTimer extends AspectAllMethods
{
    static HashMap <String, Double> times = new HashMap<String, Double>();

    static HashMap <String, ArrayList<String>> logTimes = new HashMap<String, ArrayList<String>>();

    Object around() : AllMethods() {
        double start = System.nanoTime();
        Object ret = proceed();
        double end = System.nanoTime();

        String caller = thisEnclosingJoinPointStaticPart.getSignature().toString();

        if (times.containsKey(caller)) {
            Double previousTime = times.get(caller);
            previousTime += (end - start);
            times.put(caller, previousTime);
        } else {
            times.put(caller, end - start);
        }

        Double innerTime = 0.0;
        if (times.containsKey(thisJoinPointStaticPart.getSignature().toString())) {
            innerTime = times.get(thisJoinPointStaticPart.getSignature().toString());
            times.put(thisJoinPointStaticPart.getSignature().toString(), 0.0);
        }

        ArrayList <String> innerAndOuterTimes = new ArrayList<String>();
        innerAndOuterTimes.add(0, new BigDecimal(Double.toString((end-start)/1000000000)).toPlainString());
        innerAndOuterTimes.add(1, new BigDecimal(Double.toString(((end-start) - innerTime.doubleValue())/1000000000)).toPlainString());

        logTimes.put(thisJoinPointStaticPart.getSignature().toString(), innerAndOuterTimes);
        return ret;
    }

    public static Object[][] getInnerTime(){
        Iterator it = logTimes.entrySet().iterator();
        Object[][] o = new Object[logTimes.size()][3];
        int i = 0;
        while(it.hasNext()){
            Map.Entry m = (Map.Entry)it.next();
            o[i][0] = (String) m.getKey();
            ArrayList<String> innerAndOuterTimes = (ArrayList) m.getValue();

            o[i][1] = innerAndOuterTimes.get(0);
            o[i][2] = innerAndOuterTimes.get(1);
            i++;
        }
        return o;
    }

    public static void printStats() {

        Logger.get().writeLine("\nStatistics Method Time execution ------------------------------------------------------ ");
        Iterator it=logTimes.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry m =(Map.Entry)it.next();
            String key=(String)m.getKey();
            ArrayList<String> value=(ArrayList)m.getValue();
            Logger.get().writeLine("Method: "+key+ " took " + value.get(0) + " s, without inner methods took " + value.get(1) + " s");// was called "+value+" times");
        }
        Logger.get().writeLine("-----------------------------------------------------------------\n\n") ;

    }
}
