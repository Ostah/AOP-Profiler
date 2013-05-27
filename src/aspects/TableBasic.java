package aspects;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;
import javax.swing.table.*;

public class TableBasic extends JFrame
{
    public TableBasic(Object[][] data)
    {
        String[] columnNames = {"Caller", "Method", "Count"};

        final JTable table = new JTable(data, columnNames)
        {
            //  Returning the Class of each column will allow different
            //  renderers and editors to be used based on Class

            public Class getColumnClass(int column)
            {
                for (int row = 0; row < getRowCount(); row++)
                {
                    Object o = getValueAt(row, column);

                    if (o != null)
                        return o.getClass();
                }

                return Object.class;
            }
        };
        table.setPreferredScrollableViewportSize(table.getPreferredSize());

        table.setAutoCreateRowSorter(true);
        DefaultRowSorter sorter = ((DefaultRowSorter)table.getRowSorter());
        ArrayList list = new ArrayList();
        list.add( new RowSorter.SortKey(2, SortOrder.ASCENDING) );
        sorter.setSortKeys(list);
        sorter.sort();
        table.setAutoResizeMode( JTable.AUTO_RESIZE_LAST_COLUMN);
        JScrollPane scrollPane = new JScrollPane( table );
        getContentPane().add( scrollPane );
    }

}