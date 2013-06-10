package aspects;

import org.aspectj.lang.Signature;

import java.io.*;
import java.util.HashSet;
import java.util.Set;
import java.util.Stack;
import java.util.*;


/**
 * Created with IntelliJ IDEA.
 * User: Jacek
 * Date: 01.06.2013
 * Time: 16:59
 * To change this template use File | Settings | File Templates.
 */

public class CallLogger
{
    public static CallLogger INSTANCE = new CallLogger();
    private Stack<String> callStack = new Stack<String>();
    private Set<String> callLog = new HashSet<String>();
    private Writer writer = new PrintWriter(System.out);
    private ArrayList <Object> allMethods = new ArrayList <Object> ();
    public static TreeNode root;
    public TreeNode currentTreeNode;


    public void pushMethod(Signature s) {
        //System.out.println("PUSH");

        TreeNode treeNode = new TreeNode(s.toString());
        if (root == null) {
            root = new TreeNode("void ProfilerTest.main(String[])");
            currentTreeNode = root;
        }

        if (currentTreeNode == null) {
            currentTreeNode = treeNode;
        } else {
            if (currentTreeNode.children == null) {
                currentTreeNode.children = new HashMap<String, Object>();
            }
            HashMap<TreeNode, Integer> innerHashMap = new HashMap<TreeNode, Integer>();
            Integer counter = 1;
            if (currentTreeNode.children.containsKey(treeNode.self)) { //the same function called many times
                innerHashMap = (HashMap<TreeNode, Integer>)currentTreeNode.children.get(treeNode.self);
                Iterator i = innerHashMap.entrySet().iterator();
                while (i.hasNext()) {
                    Map.Entry innerPairs = (Map.Entry)i.next();
                    counter = (Integer)innerPairs.getValue();
                    i.remove();
                }
                counter += 1;
                treeNode.counter = counter;
            }
            System.out.println("pierwszy raz" + counter);
            innerHashMap.put(treeNode, counter);

            currentTreeNode.children.put(treeNode.self, innerHashMap);
            treeNode.parent = currentTreeNode;
            currentTreeNode = treeNode;
        }

        String type = s.getDeclaringType().getName();
        String method = type.substring(type.lastIndexOf('.') + 1) + "." + s.getName();
        callStack.push(method);
    }

    public void popMethod() {

        currentTreeNode = currentTreeNode.parent;
        callStack.pop();
    }

    public TreeNode getRootTreeNode() {
        return root;
    }

    public void logCall() {
        if(callStack.size() < 2)
            return;
        String call = "\"" + top(1) + "\" -> \"" + top(0) +"\"";
        if(!callLog.contains(call)) {
            callLog.add(call);
        }
    }

    private String top(int i) {
        return callStack.get(callStack.size() - (i + 1));
    }
}