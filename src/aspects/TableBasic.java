package aspects;

import java.awt.*;
import java.util.*;
import javax.swing.*;

public class TableBasic extends JFrame
{
    public ArrayList<JTable> mTables = new ArrayList<JTable>(); // dostęp do tabelek może sie przydać więc dodaje to tutaj
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

    public void addTableTab(Object[][] data, String[] columnNames, String paneName, int sortColumn){

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

}