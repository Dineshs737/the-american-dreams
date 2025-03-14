package org.techlms.demoitest;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class DemoController {
    @FXML
    private Label helloMessage;


    public void clickButton()  {
        helloMessage.setText("Hello World"); //print hello world message
    }
}
