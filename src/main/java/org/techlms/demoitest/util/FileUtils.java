package org.techlms.demoitest.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileUtils {

    // Method to convert a File into a byte array
    public static byte[] convertFileToByteArray(File file) throws IOException {
        // Step 1: Check if the file exists
        if (!file.exists()) {
            throw new FileNotFoundException("File not found: " + file.getAbsolutePath());
        }

        // Step 2: Create a byte array of the same size as the file
        byte[] byteArray = new byte[(int) file.length()];

        // Step 3: Use FileInputStream to read the file
        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            // Step 4: Read the file content into the byte array
            fileInputStream.read(byteArray);
        }

        // Step 5: Return the byte array
        return byteArray;
    }
}
