package com.ra.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import org.springframework.context.annotation.Bean;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

public class FirebaseConfig {
    private final String serviceAccountKeyPath = "/Users/ngocthu6778gmail.com/Desktop/Rikei/Java/Jsp_servlet/demo_MD4/src/main/webapp/resources/js/commerce_firebase.json";

    @Bean
    public Storage storage() throws IOException {
        InputStream serviceAccount = Files.newInputStream(Paths.get(serviceAccountKeyPath));
        return StorageOptions.newBuilder().setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build().getService();
    }
}
