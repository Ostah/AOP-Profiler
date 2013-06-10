package aspects;

import java.util.HashMap;

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
    HashMap <String, Object> children;
    int counter = 1;

    TreeNode(String self) {
        this.self = self;
    }


    public String toString() {
        return self;
    }
}
