package aspects;

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

           AspectCount.getCallerMethod();

           if(Config.get().SHOW_WINDOW_SUMMARY == true) {  // summary window
               TableBasic frame = new TableBasic();

               String[] labels1 = {"Caller", "Method", "Count"} ;
               String[] labels2 = {"Caller", "Count"} ;
               String[] labels3 = {"Method", "Time", "Time w/o inner methods"} ;
               frame.addTableTab(AspectCount.getCallerMethod(), labels1, "Caller/Method",2);
               frame.addTableTab(AspectCount.getCaller(), labels2, "Method Count",1);
               frame.addTableTab(AspectTimer.getInnerTime(), labels3, "Times", 1);
               frame.addTreeMap();

               System.out.println("AAAA: " + CallLogger.INSTANCE.getRootTreeNode());
           }

           //AspectCount.printStats();
           Logger.get().close();
       }
}
