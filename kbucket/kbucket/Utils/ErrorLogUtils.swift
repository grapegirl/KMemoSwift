
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : ErrorLogUtils.swift
 * @Description : ErrorLogUtils 클래스
 * @since 2017.09.04
 */

class ErrorLogUtils {
    
    init() {
       
    }

    public static let ERROR_FILE : String = "/KMemo/ErrorLog"

    
    // private static final String ERROR_FILE = Environment.getExternalStorageDirectory().getAbsolutePath() + "/KMemo/"
    //         + "ErrorLog";
    // private File mLogFile = null;

    // /**
    //  * 로그 파일 생성
    //  *
    //  * @param error
    //  */
    // public static void saveFileEror(String error) {
    //     File file = new File(ERROR_FILE);
    //     FileWriter fw;
    //     try {
    //         // 파일이 존재하지 않으면
    //         if (!file.exists()) {
    //             // 파일 생성
    //             file.createNewFile();
    //             fw = new FileWriter(file.getPath());
    //         } else {
    //             // 기존 파일에 추가하기
    //             fw = new FileWriter(file.getPath(), true);
    //         }

    //         BufferedWriter bw = new BufferedWriter(fw);
    //         bw.write("Error Invoke Date : " + getCurrentTime());
    //         bw.write("\n");
    //         bw.write(error);
    //         bw.write("\n");
    //         bw.close();
    //     } catch (IOException e) {
    //         e.printStackTrace();
    //     }

    // }

    // /**
    //  * 로그 파일 생성 시점 반환
    //  *
    //  * @return 로그 파일 생성 시간
    //  */
    // private static String getCurrentTime() {
    //     Calendar calendar = Calendar.getInstance();
    //     int hour = calendar.get(Calendar.HOUR);
    //     int minute = calendar.get(Calendar.MINUTE);
    //     int second = calendar.get(Calendar.SECOND);
    //     int misecond = calendar.get(Calendar.MILLISECOND);

    //     String time = hour + ":" + minute + ":" + second + ":" + misecond;
    //     return time;
    // }

    // /**
    //  * 사용법
    //  * Thread.setDefaultUncaughtExceptionHandler(new ErrorLogUtils.UncaughtExceptionHandlerApplication());
    //  */
    // public static class UncaughtExceptionHandlerApplication implements Thread.UncaughtExceptionHandler {
    //     @Override
    //     public void uncaughtException(Thread thread, Throwable ex) {

    //         // 예외상황이 발행 되는 경우 작업
    //         String error = getStackTrace(ex);
    //         Log.e("Error", error);
    //         saveFileEror(error);

    //         // 현재 프로세스 종료
    //         android.os.Process.killProcess(android.os.Process.myPid());
    //         System.exit(10);

    //     }
    // }

    // /**
    //  * 메시지로 변환
    //  *
    //  * @param th
    //  * @return
    //  */
    // private static String getStackTrace(Throwable th) {

    //     final Writer result = new StringWriter();
    //     final PrintWriter printWriter = new PrintWriter(result);

    //     Throwable cause = th;
    //     while (cause != null) {
    //         cause.printStackTrace(printWriter);
    //         cause = cause.getCause();
    //     }
    //     final String stacktraceAsString = result.toString();
    //     printWriter.close();

    //     return stacktraceAsString;
    // }


    // /**
    //  * Logcat capture 기능 추가
    //  */
    // public void startFileLogging() {
    //     boolean isDebuggable = true;
    //     if (isDebuggable) {
    //         try {
    //             createLogFile();
    //             Runtime.getRuntime().exec(new String[]{"logcat", "-d", "-f", mLogFile.getPath()});
    //         } catch (IOException e) {
    //             e.printStackTrace();
    //         }
    //     }
    // }

    // private void createLogFile() {
    //     if (mLogFile == null) {
    //         File folder = new File(ERROR_FILE);
    //         if (folder.mkdir() || folder.isDirectory()) {
    //             mLogFile = new File(ERROR_FILE, "log_" + getCurrentTime() + ".log");
    //             try {
    //                 if (mLogFile.createNewFile()) {
    //                 }
    //             } catch (IOException e) {
    //                 e.printStackTrace();
    //             }
    //         }
    //     }
    // }
}
