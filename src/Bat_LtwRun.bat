:: sample ltw bat by Ostah
:: you need aspect jar compiled by ajc (aspects.jar)
:: and class for profiling, here ProfilerTest
java -javaagent:C:\aspectj1.7\lib\aspectjweaver.jar -classpath "code;aspects.jar;C:\aspectj1.7\lib\aspectjrt.jar;."  ProfilerTest