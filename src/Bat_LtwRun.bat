:: sample ltw bat by Michał Ostaszewski
:: you need aspect jar compiled by ajc (aspects.jar)
:: and class for profiling, here ProfilerTest
java -javaagent:C:\aspectj1.7\lib\aspectjweaver.jar -classpath "code;aspects.jar;ProfilerTest.jar;C:\aspectj1.7\lib\aspectjrt.jar;."  ProfilerTest