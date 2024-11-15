//package org.mock.interview_managerment.services;
//
//import com.google.api.client.auth.oauth2.Credential;
//import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
//import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
//import com.google.api.client.http.FileContent;
//import com.google.api.client.http.javanet.NetHttpTransport;
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.gson.GsonFactory;
//import com.google.api.services.drive.Drive;
//import com.google.api.services.drive.model.File;
//import com.google.api.services.drive.model.Permission;
//
//import java.io.IOException;
//import java.security.GeneralSecurityException;
//import java.util.Arrays;
//import java.util.List;
//
///* class to demonstrate use of Drive files list API */
//public class UploadtoDriver {
//
//    private static final String APPLICATION_NAME = "Google Drive API Java Quickstart";
//
//    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
//
//    public static Drive service;
//    private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {
//        // Lấy access token và refresh token từ nơi bạn lưu trữ
//        String accessToken = "your_access_token";
//        String refreshToken = "1//04Kt5TNKhImXtCgYIARAAGAQSNwF-L9IrXm4mndJ4SKP7IeL7JDI9cqpb7Dswt5u3zeKk_XFpN4Ceh_uDnaPDwtdQWDyJ8nfF4dc";
//
//        GoogleCredential.Builder credentialBuilder = new GoogleCredential.Builder()
//                .setTransport(HTTP_TRANSPORT)
//                .setJsonFactory(JSON_FACTORY)
//                .setClientSecrets("175451496265-n5po0k2ph3l2m0tbnburu6bqs1b6pmj9.apps.googleusercontent.com", "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");
//
//
//        GoogleCredential credential = credentialBuilder.build();
//        credential.setAccessToken(accessToken);
//        credential.setRefreshToken(refreshToken);
//
//        return credential;
//    }
//    public void init() throws IOException, GeneralSecurityException {
//        // Build a new authorized API client service.
//        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
//        service = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
//                .setApplicationName(APPLICATION_NAME)
//                .build();
//    }
//    public static File uploadFile(Drive driveService, java.io.File file, String fileName) throws IOException {
//        // Tạo File metadata
//        File fileMetadata = new File();
//        fileMetadata.setName(fileName);
//        // Tạo FileContent từ đường dẫn file
//        FileContent mediaContent = new FileContent("application/pdf", file);
//
//        File file2;
//        // Upload file lên Google Drive
//        file2= driveService.files().create(fileMetadata, mediaContent)
//                .setFields("id, webViewLink")
//                .execute();
//        List<String> emails = Arrays.asList("damnhau04@gmail.com", "trantran30102002@gmail.com");
//
//        for (String email : emails) {
//            Permission permission = new Permission()
//                    .setType("user")
//                    .setRole("reader")
//                    .setEmailAddress(email);
//            service.permissions().create(file2.getId(), permission)
//                    .execute();
//        }
//        return file2;
//    }
//}