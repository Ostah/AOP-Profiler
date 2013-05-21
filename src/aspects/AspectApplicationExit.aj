package aspects;

import javax.swing.*;

/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 20.05.13
 * Time: 22:11
 * To change this template use File | Settings | File Templates.
 *
 * within pakiety - sterowanie pakietami
    proste gui
    ltw
    adnotacje
    z jakiej metody jest wywolywana metoda, i co wywoluje ona sama
    narzut czasowy - jak wplywa aop na wydajnosc aplikacji
    % bledu w czasach
 */

public aspect AspectApplicationExit {

       before():  execution( public static void main(..)) {
              Config.get();
       }

       after():  execution( public static void main(..)) {
           AspectCount.printStats();
           Logger.get().close();
       }
}
