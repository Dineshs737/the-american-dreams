package org.techlms.demoitest.controllers.adminControllers.notice;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.util.Notice;
import org.techlms.demoitest.service.adminService.AdminService;

import java.net.URL;
import java.util.ResourceBundle;

public class AdminNoticeController implements Initializable {

    public static int  num = 0;
    private final AdminService service = new AdminService();
    @FXML
    private VBox contentContainer;


    @FXML
    private TableView<Notice>  noiceTable;

    @FXML
    private TableColumn<Notice , String> createdDate;

    @FXML
    private VBox lecturer;

    @FXML
    private TableColumn<Notice, Integer> no;

    @FXML
    private TableColumn<Notice, Void> resource;

    @FXML
    private TableColumn<Notice, String> title;

    @FXML
    private TableColumn<Notice, String> updatedDate;

    @FXML
    void CreateNotice(MouseEvent event) {

    }

    @FXML
    void deleteNotice(MouseEvent event) {

    }

    @FXML
    void updateNotice(MouseEvent event) {

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loadNoticesTable();

    }




    public void loadNoticesTable() {
        // Reset the table data
        noiceTable.getItems().clear();

        // Fetch the notices from the service
        noiceTable.getItems().setAll(service.fetchNotices());

        // Set the row number dynamically using the SimpleIntegerProperty
        no.setCellValueFactory(cellData -> {
            int rowIndex = noiceTable.getItems().indexOf(cellData.getValue()) + 1; // rowIndex starts from 1
            return new SimpleIntegerProperty(rowIndex).asObject();
        });

        // Set the created date and updated date columns
        createdDate.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getCreateDate()));
        updatedDate.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getUpdatedDate()));
        title.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getNoticeTitle()));
    }
}
