
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : ContextUtils.swift
 * @Description : ContextUtils 클래스
 * @since 2017.09.04
 */
import Foundation

class ContextUtils : NSObject{
    
    override init() {
       
    }
    
//    /**
//      * 운영 배포시 false
//      * 개발 로그 true시 보임
//      */
//     public static boolean VIEW_LOG = false;

//     /**************************************************************************
//      *
//      * Shared Preference
//      *
//      * ***********************************************************************/

//     /**
//      * 프리퍼런스 이름
//      */
//     public static final String KEY_PREFER_NAME = "APP_PRF_NAME";
//     /**
//      * 프리퍼런스 이름(환경설정_비밀번호)
//      */
//     public static final String KEY_CONF_PASSWORD = "KEY_CONF_PASSWORD";

//     /**
//      * 프리퍼런스 이름(환경설정_닉네임)
//      */
//     public static final String KEY_USER_NICKNAME = "KEY_USER_NICKNAME";

//     /**
//      * 프리퍼런스 이름(GCM 키)
//      */
//     public static final String KEY_USER_GCM = "KEY_USER_GCM";

//     /**
//      * 프리퍼런스 이름(FCM 키)
//      */
//     public static final String KEY_USER_FCM = "KEY_USER_FCM";

//     /**
//      * 프리퍼런스 이름(MEMO)
//      */
//     public static final String KEY_USER_MEMO = "KEY_USER_MEMO";

//     /**************************************************************************
//      *
//      * Activity 별 상수 정의
//      *
//      * ***********************************************************************/

//     /**
//      * 가지 작성 화면
//      */
//     public static final String VIEW_WRITE = "WriteActivity";
//     /**
//      * 완료된 가지 목록 화면
//      */
//     public static final String VIEW_COMPLETE_LIST = "BucketListActivity";
//     /**
//      * 버킷 공유(Life)
//      */
//     public static final String DEFULAT_SHARE_BUCKET_IDX = "1";
//     /**
//      * 공유 idx
//      */
//     public static final String NUM_SHARE_BUCKET_IDX = "SHARE_BUCKET_IDX";
//     /**
//      * 공유 bucket
//      */
//     public static final String OBJ_SHARE_BUCKET = "OBJ_SHARE_BUCKET";

//     //상수들
//     public static final String WIDGET_WRITE_BUCKET = "WRITE";
//     public static final String WIDGET_BUCKET_LIST = "LIST";
//     public static final String WIDGET_SHARE = "SHARE";
//     public static final String WIDGET_OURS_BUCKET = "OURS_BUCKET";
//     public static final String WIDGET_SEND_DATA = "WIDGET_SEND_DATA";

//     public static final String SORT_DATE = "SORT_DATE";
//     public static final String SORT_MEMO = "SORT_MEMO";
//     public static final String SORT_DEADLINE = "SORT_DEADLINE";
//     public static final String BACK_MEMO = "BACK_MEMO";



//     /**************************************************************************
//      *
//      * Application 상수 정의
//      *
//      * ***********************************************************************/

//     /**
//      * 패키지명
//      */
//     public static final String PACKAGE_NAME = "momo.kikiplus.com.kbucket";

//     /**
//      * 파일 저장 장소(폴더명)
//      */
//     public static final String KEY_FILE_FOLDER = "KMemo";

//     /**
//      * GCM 프로젝트 아이디
//      */
//     public static final String KEY_GCM_PROJECT_ID = "343963170350";

//     /**
//      * 데이터베이스 이름명
//      */
//     public static final String KBUCKET_DB_NAME = "bucket.db";
//     /**
//      * 구글 Ads ID
//      */
//     public static final String KBUCKET_AD_UNIT_ID = "ca-app-pub-9950741145331464/4170271439";

//     /**
//      * Sort
//      */
//     public static final String KBUCKET_SORT_KEY = "KBUCKET_SORT";


//     /**************************************************************************
//      *
//      * Application I/O 정의
//      *
//      * ***********************************************************************/

//     /**
//      * 서버 IP
//      */
//     public static final String KBUCKET_SERVER_IP = "kikiplus2030.ddns.net";
//     /**
//      * 서버 port
//      */
//     public static final String KBUCKET_PORT = "9000";
//     /**
//      * 버전 업데이트 URL
//      */
//     public static final String KBUCKET_VERSION_UPDATE_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/version.jsp";
//     /**
//      * 가지 공유하기 URL
//      */
//     public static final String KBUCKET_INSERT_BUCKET_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/insertBucket.jsp";
//     /**
//      * 가지 파일 업로드 URL
//      */
//     public static final String KBUCKET_UPLOAD_IMAGE_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/uploadFile.jsp";
//     /**
//      * category URL
//      */
//     public static final String KBUCKET_CATEGORY_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/category.jsp";
//     /**
//      * 버킷 리스트 URL
//      */
//     public static final String KBUCKET_BUCKET_LIST_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/bucketList.jsp";
//     /**
//      * 버킷 상세 URL
//      */
//     public static final String KBUCKET_BUCKET_DETAIL_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/bucketInfo.jsp";
//     /**
//      * 버킷 댓글 URL
//      */
//     public static final String KBUCKET_COMMENT_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/comment.jsp";
//     /**
//      * 버킷 댓글 업로드 URL
//      */
//     public static final String INSERT_COMMENT_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/insertComment.jsp";
//     /**
//      * 공지사항URL
//      */
//     public static final String KBUCKET_NOTICE_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/update.jsp";
//     /**
//      * 사용자 정보 업데이트 URL
//      */
//     public static final String KBUCKET_UPDATE_USER = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/insertMobileUser.jsp";
//     /**
//      * 이미지 다운로드 URL
//      */
//     public static final String KBUCKET_DOWNLOAD_IAMGE = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/downloadFile.jsp";
//     /**
//      * 이미지 다운로드 URL
//      */
//     public static final String KBUCKET_AI = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/getAIReplay.jsp";

//     /**
//      * 버킷랭킹 리스트 URL
//      */
//     public static final String KBUCKET_RANK_LIST_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/bucketRankList.jsp";

//     /**
//      * 버킷랭킹 정보 업데이트
//      */
//     public static final String KBUCKET_RANK_COMMENT = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/bucketRankComment.jsp";

//     /**
//      * 가지 파일 업로드 URL
//      */
//     public static final String KBUCKET_UPLOAD_DB_URL = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/mobile/uploadDBFile.jsp";

//     /**
//      * 채팅 내용 전송 URL
//      */
//     public static final String INSERT_CHAT = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/chat/chat.jsp";
//     /**
//      * 채팅 내용 조회 URL
//      */
//     public static final String SELECT_CHAT = "http://" + KBUCKET_SERVER_IP + ":" + KBUCKET_PORT + "/MemoServer/chat/loadChat.jsp";

//     /**
//      * 관리자 블로그 주소
//      */
//     public static final String KBUCKET_BLOG = "http://blog.naver.com/kikiplus2030";

//     /**
//      * Anayltics 키값
//      */
//     public static final String KEY_ANALYTICS = "UA-86096322-1";
}
