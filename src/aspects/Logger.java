package aspects;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

/**
* Created with IntelliJ IDEA.
* User: Ostah
* Date: 21.05.13
* Time: 17:47
* To change this template use File | Settings | File Templates.
*/
public class Logger {

    private final static Logger ourInstance = new Logger();
    private static  FileWriter fstream;
    private static  BufferedWriter out;

    public static Logger get() {
        return ourInstance;
    }

    private Logger() {
        try {
            fstream = new FileWriter("out.txt");
        } catch (IOException e) {
            e.printStackTrace();
        }
        out = new BufferedWriter(fstream);
    }

    public void writeLine(String line){
//        try {
//            System.out.println("Logger: "+line);
//            out.write(line+"\n");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    public void close(){
        try {out.close();}
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}
