package aspects;

import sun.misc.IOUtils;

import java.io.*;
import java.util.StringTokenizer;

/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 21.05.13
 * Time: 21:48
 * To change this template use File | Settings | File Templates.
 */
public final class Config {
    private static Config ourInstance = null;
    public static Boolean PROFILE_ONLY_ANNOTATED = null;

    public static Config get() {
        if(ourInstance == null){
            ourInstance = new Config();
        }
        return ourInstance;
    }


    private Config() {
        String line="";
        FileReader fileR = null;
        BufferedReader bf = null;
        try {
            fileR = new FileReader("config.txt");
            bf = new BufferedReader(fileR);

            while((line = bf.readLine())!=null){
                StringTokenizer st = new StringTokenizer(line);
                String option = st.nextElement().toString();
                String flag = st.nextElement().toString();

                if(option == null || flag == null) continue;
                if(option.equalsIgnoreCase("PROFILE_ONLY_ANNOTATED")) PROFILE_ONLY_ANNOTATED = Boolean.valueOf(flag);
                System.out.println("boo: "+PROFILE_ONLY_ANNOTATED.toString());
            }

            bf.close();

        } catch (Exception e) {e.printStackTrace();}




    }
}