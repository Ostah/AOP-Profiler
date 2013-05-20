package aspects;

import javax.swing.*;

/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 20.05.13
 * Time: 22:11
 * To change this template use File | Settings | File Templates.
 */
public aspect AspectApplicationExit {
       after():  execution( public static void main(..)) {
           AspectCount.printStats();
       }
}
