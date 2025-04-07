module org.techlms.demoitest {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.web;
    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires net.synedra.validatorfx;
    requires org.kordamp.ikonli.javafx;
    requires org.kordamp.bootstrapfx.core;
    requires eu.hansolo.tilesfx;
    requires com.almasb.fxgl.all;
    requires io.github.cdimascio.dotenv.java;
    requires static lombok;
    requires java.sql;
    requires com.fasterxml.jackson.core;
    opens org.techlms.demoitest to javafx.fxml;
    exports org.techlms.demoitest;
    exports org.techlms.demoitest.controllers.studentControllers;
    opens org.techlms.demoitest.controllers.studentControllers to javafx.fxml;
    exports org.techlms.demoitest.util;
    opens org.techlms.demoitest.util to javafx.fxml;
}