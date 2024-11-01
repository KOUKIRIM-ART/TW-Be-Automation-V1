package com.example;


import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;

public class PropertyFileWriter {

    public static void writeToPropertyFile(String newToken, int timeout) {
        ObjectMapper mapper = new ObjectMapper ();
        Token token = new Token(newToken);
        try {
            // Write JSON object to file
            mapper.writeValue(new File("src/test/resources/common/config.json"), token);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
