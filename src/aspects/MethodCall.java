package aspects;


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

    @Override
    public int hashCode() {
        return method.hashCode()+caller.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null)
            return false;
        if (obj == this)
            return true;
        if (!(obj instanceof MethodCall))
            return false;

        MethodCall rhs = (MethodCall) obj;
        if(method.equalsIgnoreCase(rhs.method) && caller.equalsIgnoreCase(rhs.caller)) return  true;
        return false;
    }

    public String getMethod() {
        return method;
    }

    public String getCaller() {
        return caller;
    }
}
