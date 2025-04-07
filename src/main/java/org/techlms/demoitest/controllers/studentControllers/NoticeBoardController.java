package org.techlms.demoitest.controllers.studentControllers;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.FileChooser;
import org.techlms.demoitest.dto.utilDTO.NoticeBoardDTO;
import org.techlms.demoitest.service.studentService.NoticeBoardService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public class NoticeBoardController {

    @FXML
    private TableView<NoticeBoardDTO> userNotesTable;
    @FXML
    private TableColumn<NoticeBoardDTO, Integer> notesNumber;
    @FXML
    private TableColumn<NoticeBoardDTO, String> notesDateAndTime;
    @FXML
    private TableColumn<NoticeBoardDTO, String> notesTitle;
    @FXML
    private TableColumn<NoticeBoardDTO, Void> resourceDownload;

    @FXML
    public void initialize() {
        // Set up table columns
        notesNumber.setCellValueFactory(cellData -> new SimpleIntegerProperty(cellData.getValue().getNoticeId()).asObject());
        notesDateAndTime.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getCreatedDate()));
        notesTitle.setCellValueFactory(cellData -> new SimpleStringProperty("Notice #" + cellData.getValue().getNoticeId()));

        // Add download button to each row
        addDownloadButtonToTable();

        // Load data into the table from service
        NoticeBoardService service = new NoticeBoardService();
        userNotesTable.getItems().setAll(service.getNoticeBoard());
    }

    private void addDownloadButtonToTable() {
        resourceDownload.setCellFactory(col -> new TableCell<>() {
            private Button btn = new Button("Download");



            {
                btn.setOnAction(event -> {
                    NoticeBoardDTO dto = getTableView().getItems().get(getIndex());
                    byte[] fileData = dto.getNoticeData();

                    // Open FileChooser to save file
                    FileChooser fileChooser = new FileChooser();
                    fileChooser.setTitle("Save File");
                    fileChooser.setInitialFileName(dto.getNoticeName().trim() + dto.getNoticeId() + ".pdf"); // Adjust extension as needed

                    File file = fileChooser.showSaveDialog(getScene().getWindow());
                    if (file != null) {
                        try {
                            // Save the notice data to the file
                            Files.write(file.toPath(), fileData);
                        } catch (IOException e) {
                            e.printStackTrace();
                            showError("Failed to save the file.");
                        }
                    }
                });
            }

            @Override
            protected void updateItem(Void item, boolean empty) {
                super.updateItem(item, empty);
                setGraphic(empty ? null : btn);
            }
        });
    }

    private void showError(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Error");
        alert.setHeaderText("Download Failed");
        alert.setContentText(message);
        alert.showAndWait();
    }
}
