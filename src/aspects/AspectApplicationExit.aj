package aspects;

import javax.swing.*;
import java.awt.*;

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
    z jakiej metody jest wywolywana metoda, i co wywoluje ona sama
    narzut czasowy - jak wplywa aop na wydajnosc aplikacji
    % bledu w czasach
 */

public aspect AspectApplicationExit {

       before():  execution( public static void main(..)) {
              Config.get();
       }

       after():  execution( public static void main(..)) {

           AspectCount.getValuesForTable();
           if(Config.get().SHOW_WINDOW_SUMMARY == true) {
               TableBasic frame = new TableBasic(AspectCount.getValuesForTable());
               frame.setTitle("Profiler Summary");
               frame.setPreferredSize(new Dimension(800, 600));
               frame.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
               frame.pack();
               frame.setLocationRelativeTo( null );
               frame.setVisible(true);
           }

           AspectCount.printStats();
           Logger.get().close();
       }
}
