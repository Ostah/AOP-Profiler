package aspects;

import javax.swing.*;
import javax.swing.tree.DefaultMutableTreeNode;
import java.awt.*;
import java.util.ArrayList;
import java.util.Iterator;

public class TableBasic extends JFrame
{
    public ArrayList<Object> mTables = new ArrayList<Object>(); // dostęp do tabelek może sie przydać więc dodaje to tutaj
    JTabbedPane mTabbedPane;

    public TableBasic(){
        mTabbedPane = new JTabbedPane();
        getContentPane().add(mTabbedPane);
        setTitle("Profiler Summary");
        setPreferredSize(new Dimension(800, 600));
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    public void addTableTab(Object[][] data, String[] columnNames, String paneName, int sortColumn) {

        JTable table = new JTable(data, columnNames);
        table.setPreferredScrollableViewportSize(table.getPreferredSize());
        table.setAutoCreateRowSorter(true);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_LAST_COLUMN);

        DefaultRowSorter sorter = ((DefaultRowSorter)table.getRowSorter());
        ArrayList list = new ArrayList();
        list.add( new RowSorter.SortKey(sortColumn, SortOrder.DESCENDING) );
        sorter.setSortKeys(list);
        sorter.sort();

        mTabbedPane.add(paneName, new JScrollPane(table));
        mTables.add(table);
    }

    public void addTreeMap() {
        TreeNode rootNode = CallLogger.INSTANCE.getRootTreeNode();
        JTree tree = new JTree(parseTree(rootNode, null));
        mTabbedPane.add("Tree map", new JScrollPane(tree));
    }

    public DefaultMutableTreeNode parseTree(TreeNode node, DefaultMutableTreeNode visualNode) {
       // System.out.println("node: " + node);

        DefaultMutableTreeNode temp = new DefaultMutableTreeNode(node.self);

        if (visualNode == null) {
            visualNode = temp;
        } else {
            visualNode.add(temp);
        }

        ArrayList<TreeNode> children = node.children;
        if (children == null || children.isEmpty()) {
           return null;
        } else {
            Iterator<TreeNode> i = children.iterator();
            while (i.hasNext()) {
                TreeNode tN = i.next();
                parseTree(tN, temp);
                i.remove();
            }
        }

        return visualNode;
    }
}