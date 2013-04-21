/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 21.04.13
 * Time: 18:32
 * To change this template use File | Settings | File Templates.
 */
public class MethodCall {

    private String method;
    private String caller;

    MethodCall(String method, String caller){
        this.method = method;
        this.caller = caller;
    }

    public String toString(){
        return "Method "+method+" called from "+caller;
    }
}
