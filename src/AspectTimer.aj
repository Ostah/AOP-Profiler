/**
 * Created with IntelliJ IDEA.
 * User: Jacek
 * Date: 07.05.2013
 * Time: 21:02
 * To change this template use File | Settings | File Templates.
 */

import java.math.BigDecimal;

public aspect AspectTimer extends AspectAllMethods
{
    Object around() : AllMethods() {
        double start = System.nanoTime();
        Object ret = proceed();
        double end = System.nanoTime();
        System.out.println(thisJoinPointStaticPart.getSignature() + " took " + new BigDecimal(Double.toString((end-start)/1000000000)).toPlainString() + " seconds");
        return ret;
    }
}
