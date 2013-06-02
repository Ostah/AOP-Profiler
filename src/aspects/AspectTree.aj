package aspects;

import java.util.HashMap;

/**
 * Created with IntelliJ IDEA.
 * User: Jacek
 * Date: 01.06.2013
 * Time: 12:52
 * To change this template use File | Settings | File Templates.
 */
public aspect AspectTree extends AspectAllMethods {

    before() : AllMethods() {
        CallLogger.INSTANCE.pushMethod(thisJoinPointStaticPart.getSignature());
        CallLogger.INSTANCE.logCall();
    }

    after() : AllMethods() {
        CallLogger.INSTANCE.popMethod();
    }
}
