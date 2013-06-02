package aspects;

import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: Jacek
 * Date: 01.06.2013
 * Time: 21:05
 * To change this template use File | Settings | File Templates.
 */

public class TreeNode {
    String self;
    TreeNode parent;
    ArrayList <TreeNode> children;

    TreeNode(String self) {
        this.self = self;
    }


    public String toString() {
        return self;
    }
}
