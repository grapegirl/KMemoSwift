
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : DataUtils.swift
 * @Description : DataUtils 클래스
 * @since 2017.09.04
 */


import Foundation

class DataUtils {
    
    init() {
       
    }
    
    /**
     * 프로젝트 관련 파일 생성
     *
     * @return 파일 생성 완료 여부
     */
    public static func createFile() -> Bool {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory: AnyObject = paths[0] as AnyObject
        let dataPath = documentsDirectory.appendingPathComponent(ContextUtils.KEY_FILE_FOLDER)!

        do {
            try FileManager.default.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription);
            return false
        }
        return true
    }

    /**
     * 파일명으로 파일 삭제하기
     *
     * @param fileName
     * @return 파일 삭제 여부
     */
     public static func deleteFile(fileName : String) -> Bool {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: fileName)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
            return false
        }
        return true
    }

  
    // /**
    //  * 현재시간으로 파일 이름 생성 후 반환 메소드
    //  *
    //  * @return 현재시간으로 생성된 파일이름 반환
    //  */
    // public static final String getNewFileName() {
    //     File path = new File(Environment.getExternalStorageDirectory().getAbsolutePath() + "/" + ContextUtils.KEY_FILE_FOLDER);
    //     if (!path.exists()) {
    //         path.mkdirs();
    //     }
    //     Calendar calendar = Calendar.getInstance();
    //     SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
    //     String dateTime = sdf.format(calendar.getTime());
    //     String strPhotoPath = path.getPath() + "/" + dateTime + ".jpg";
    //     return strPhotoPath;
    // }

    // /***
    //  * @param selectedImagePath
    //  * @param string
    //  * @throws IOException
    //  */
    // public static void copyFile(String selectedImagePath, String string) throws IOException {
    //     InputStream in = new FileInputStream(selectedImagePath);
    //     OutputStream out = new FileOutputStream(string);

    //     // Transfer bytes from in to out
    //     byte[] buf = new byte[1024];
    //     int len;
    //     while ((len = in.read(buf)) > 0) {
    //         out.write(buf, 0, len);
    //     }
    //     in.close();
    //     out.close();
    // }

    // /**
    //  * 미디어 스캔하여 경로 반환 메소드
    //  *
    //  * @param context
    //  * @param uri
    //  * @return
    //  */
    // public static String getMediaScanPath(Context context, Uri uri) {
    //     String[] projection = {MediaStore.Images.Media.DATA};
    //     Cursor cursor = context.getContentResolver().query(uri, projection, null, null, null);
    //     int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
    //     cursor.moveToFirst();
    //     return cursor.getString(column_index);
    // }

  

    // /**
    //  * SQlite DB 파일 복원  기능
    //  *
    //  * @return 복원 여부(성공 true, 실패 false 반환)
    //  */
    // public static final boolean importDB(String backupDBPath) {
    //     try {
    //         File sd = Environment.getExternalStorageDirectory();
    //         File data = Environment.getDataDirectory();
    //         if (sd.canWrite()) {
    //             String currentDBPath = Environment.getDataDirectory() + "/" + ContextUtils.PACKAGE_NAME
    //                     + "/databases/" + ContextUtils.KBUCKET_DB_NAME;

    //             File backupDB = new File(data, currentDBPath);

    //             if(backupDBPath.contains("/file/file/")){
    //                 backupDBPath = backupDBPath.replace("/file/file", "");
    //             }
    //             File currentDB = new File(backupDBPath);
    //             FileChannel src = new FileInputStream(currentDB).getChannel();
    //             FileChannel dst = new FileOutputStream(backupDB).getChannel();
    //             dst.transferFrom(src, 0, src.size());
    //             src.close();
    //             dst.close();
    //             KLog.d("DataUtils", "@@ DB 파일 복원 완료 ");
    //         }
    //     } catch (Exception e) {
    //         KLog.d("DataUtils", "@@ DB 파일 복원 에러 : " + e.toString());
    //         return false;
    //     }
    //     return true;
    // }


    // /**
    //  * SQlite DB 파일 백업 기능
    //  *
    //  * @return 백업 여부(성공 true, 실패 false 반환)
    //  */
    // public static final boolean exportDB(String NewdbName) {
    //     try {
    //         File sd = Environment.getExternalStorageDirectory();
    //         File data = Environment.getDataDirectory();

    //         if (sd.canWrite()) {
    //             String currentDBPath = Environment.getDataDirectory() + "/" + ContextUtils.PACKAGE_NAME
    //                     + "/databases/" + ContextUtils.KBUCKET_DB_NAME;

    //             String backupDBPath = ContextUtils.KEY_FILE_FOLDER + "/" + NewdbName + ".db";
    //             File currentDB = new File(data, currentDBPath);

    //             File kmemoFile = new File(sd, ContextUtils.KEY_FILE_FOLDER);
    //             if(!kmemoFile.exists()){
    //                 kmemoFile.mkdirs();
    //             }
    //             File backupDB = new File(sd, backupDBPath);
    //             if(!backupDB.exists()){
    //                 backupDB.createNewFile();
    //             }
    //             FileChannel src = new FileInputStream(currentDB).getChannel();
    //             FileChannel dst = new FileOutputStream(backupDB).getChannel();
    //             dst.transferFrom(src, 0, src.size());
    //             src.close();
    //             dst.close();
    //             KLog.d("DataUtils", "@@ DB 파일 백업 완료 ");
    //         }
    //     } catch (Exception e) {
    //         KLog.e("DataUtils", "@@ DB 파일 백업 에러 : " + e.toString());
    //         return false;
    //     }
    //     return true;
    // }

    // /**
    //  * 내부에 저장된 이미지 바로 보기
    //  *
    //  * @param context  컨텍스트
    //  * @param filePath 이미지 저장 경로(외부저장소)
    //  */
    // public static void startImageIntent(Context context, String filePath) {
    //     File file = new File(filePath);
    //     Intent galleryIntent = new Intent(Intent.ACTION_VIEW);
    //     galleryIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    //     galleryIntent.setDataAndType(Uri.fromFile(file), "image/*");
    //     context.startActivity(galleryIntent);
    // }

    // /**
    //  * 폰트 반환하기
    //  *
    //  * @param context 컨텍스트
    //  * @return 한나폰트
    //  */
    // public static Typeface getHannaFont(Context context) {
    //     Typeface typeFace = Typeface.createFromAsset(context.getAssets(), "hanna.ttf");
    //     return typeFace;
    // }

    // /**
    //  * 폰트 반환하기
    //  *
    //  * @param context 컨텍스트
    //  * @return 폰트
    //  */
    // public static Typeface getFont(Context context, String fontName) {
    //     Typeface typeFace = Typeface.createFromAsset(context.getAssets(), fontName);
    //     return typeFace;
    // }
}
