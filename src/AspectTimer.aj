/**
 * Created with IntelliJ IDEA.
 * User: Jacek
 * Date: 07.05.2013
 * Time: 21:02
 * To change this template use File | Settings | File Templates.
 */

import java.math.BigDecimal;
import java.util.HashMap;

public aspect AspectTimer extends AspectAllMethods
{
    static HashMap <String, Double> times = new HashMap<String, Double>();
    Object around() : AllMethods() {
        double start = System.nanoTime();
        Object ret = proceed();
        double end = System.nanoTime();

        String caller = thisEnclosingJoinPointStaticPart.getSignature().toString();

        if (times.containsKey(caller)) {
            Double previousTime = times.get(caller);
            previousTime += (end - start);
            times.put(caller, previousTime);
            //System.out.println("TEEEERAZ " + previousTime);
        } else {
            times.put(caller, end - start);
        }

        Double innerTime = 0.0;
        if (times.containsKey(thisJoinPointStaticPart.getSignature().toString())) {
            innerTime = times.get(thisJoinPointStaticPart.getSignature().toString());
            times.put(thisJoinPointStaticPart.getSignature().toString(), 0.0);
        }
        System.out.println("Method: " + thisJoinPointStaticPart.getSignature() + " took " + new BigDecimal(Double.toString((end-start)/1000000000)).toPlainString() + " seconds, without inner methods took: " + new BigDecimal(Double.toString(((end-start) - innerTime.doubleValue())/1000000000)).toPlainString() + " seconds");
        return ret;
    }
}
