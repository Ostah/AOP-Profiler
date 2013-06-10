package aspects;

/**
* Created with IntelliJ IDEA.
* User: Ostah
* Date: 20.05.13
* Time: 22:11
* To change this template use File | Settings | File Templates.
*/

public aspect AspectApplicationExit {
       TableBasic frame;
       before():  execution( public static void main(..)) {
              Config.get();

           Runtime.getRuntime().addShutdownHook(new Thread() {
               public void run() { beforeExit(); }
           });
       }

       after():  execution( public static void main(..)) {
           frame = new TableBasic();
           System.out.println("After" )   ;
           AspectCount.printStats();


           if(Config.get().SHOW_WINDOW_SUMMARY == true) {  // summary window


               String[] labels1 = {"Caller", "Method", "Count"} ;
               String[] labels2 = {"Caller", "Count"} ;
               String[] labels3 = {"Method", "Time", "Time w/o inner methods"} ;
               frame.addTableTab(AspectCount.getCallerMethod(), labels1, "Caller/Method",2);
               frame.addTableTab(AspectCount.getCaller(), labels2, "Method Count",1);
               frame.addTableTab(AspectTimer.getInnerTime(), labels3, "Times", 1);
               System.out.println("skonczono model");
               frame.addTreeMap();
               System.out.println("skonczono rysownaie");

               //System.out.println("AAAA: " + CallLogger.INSTANCE.getRootTreeNode());
           }

           //AspectCount.printStats();
           Logger.get().close();
       }

        before():  execution( public void beforeExit(..)) {
            System.out.println("beforeexit" )   ;

        }
       public void beforeExit(){

       }
}
