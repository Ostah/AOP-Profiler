/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 07.05.13
 * Time: 18:44
 * To change this template use File | Settings | File Templates.
 */


public abstract aspect AspectAllMethods {

    // jeśli zamienimy tutaj calle na executiony to nie będzie łapać zewnętrznych metod (np printfów)
    // ale dzięki temu będzie bardziej bezpiecznie (execution wyłapuje ciało metody, call tylko jej wywołanie)

    pointcut AllMethods() : ((call(* *(..)) || call(*.new(..)))  && !within(AspectCount));

}
