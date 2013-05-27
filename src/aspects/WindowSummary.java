package aspects;

/**
 * Created with IntelliJ IDEA.
 * User: Ostah
 * Date: 27.05.13
 * Time: 15:50
 * To change this template use File | Settings | File Templates.
 */
import java.awt.*;
import javax.swing.*;

public class WindowSummary {
    public static void createWindow() {

        //Create and set up the window.
        JFrame frame = new JFrame("Profiler Sumary");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel textLabel = new JLabel("Here goes results table",SwingConstants.CENTER);
        textLabel.setPreferredSize(new Dimension(800, 600));
        frame.getContentPane().add(textLabel, BorderLayout.CENTER);

        //Display the window.
        frame.setLocationRelativeTo(null);
        frame.pack();
        frame.setVisible(true);
    }
}
