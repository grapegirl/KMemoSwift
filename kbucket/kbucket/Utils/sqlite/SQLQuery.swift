
/***
 * @author SQLQuery
 * @version 1.1
 * @Class Name : SQLQuery.swift
 * @Description : SQLQuery 클래스
 * @since 2017.09.08
 */
import RealmSwift
import Realm

class SQLQuery{
    
    private let TAG : String = "SQLQuery"
    private var sql : String = ""
    private let TABLE_MEMO : String = "KMEMO";
    private let TABLE_USER : String = "KUSER";
    private let TABLE_CHAT : String = "KCHAT";

    init() {
        KLog.d(tag: TAG, msg: "create Table 생성자");
    }
    
   
     /**
     * 테이블생성
     */
    public func createTable() -> Void {
      
    }

    public func selectKbucket() -> Results<Bucket>? {
        // Get the default Realm
        do{
            let realm = try! Realm()
            
            // Query Realm for all dogs less than 2 years old
            let bucketList = realm.objects(Bucket.self)
            
            return bucketList

        }catch let error as NSError{
            KLog.d(tag: TAG, msg: "selectKbucet db error")
            return nil
        }
        
    }
//
//    public func selectKbucket(memoContents : String ) -> LinkedList<String> {
//        
//    }
//
//    public func containsKbucket(memoContents : String ) -> Bool {
//      
//    }

    /**
     * 사용자 정보 insert 메소드
     *
     * @param context       컨텍스트
     * @param contents      내용
     * @param date          날짜
     * @param completeYN    완료여부
     * @param completedDate 완료된 날짜
     */
    public func insertUserSetting( contents : String , date : String , completeYN : String , completedDate : String ) -> Bool {
        KLog.d(tag: TAG, msg: "insertUserInfo mContent : " + contents);
        let bucketObj = Bucket()
        bucketObj.mContent = contents
        bucketObj.mCompleteDate = completedDate
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(bucketObj)
        }

        KLog.d(tag: TAG, msg: "success insertUserInfo mContent : " + contents);
        return true
    }

    /**
     * 메모 내용 업데이트 (수정)
     *
     * @param context     컨텍스트
     * @param contents    내용
     * @param newContents 새로운 내용
     */
    public func updateMemoContent(contents : String , newContents :  String ) -> Void {
        KLog.d(tag: TAG, msg: "updateMemoContent contents : " + contents);
        KLog.d(tag: TAG, msg: "updateMemoContent newContents : " + newContents);

        let realm = try! Realm()

        let bucketObj = realm.objects(Bucket.self).filter("contents = '" + contents + "'")
        
        //bucketObj.mContent = newContents

        try! realm.write {
            realm.add(bucketObj, update: true)
        }
        KLog.d(tag: TAG, msg: "success updateMemoContent mContent : " + newContents);
    }

    /**
     * 메모 내용 업데이트 (수정)
     *
     * @param context     컨텍스트
     * @param contents    내용
     * @param newContents 새로운 내용
     * @param completeYn  완료여부(Y/N)
     * @param date        완료날짜
     */
    public func updateMemoContent(contents : String , newContents : String ,completeYn :  String ,date :  String ,imagePath:  String ) -> Void {
        
    }

    /**
     * 메모 내용 업데이트 (수정)
     */
    public func updateMemoContent(contents : String , newContents : String , completeYn : String , date : String , imagePath : String , deadline: String ) -> Void {
        
    }

    /**
     * 사용자 닉네임 업데이트 메소드
     *
     * @param context  컨텍스트
     * @param nickanme 업데이트 할 닉네임
     */
    public func updateUserNickName(nickanme : String ) -> Void {
       
    }

    /**
     * 사용자 정보 테이블 내용 검색하기
     *
     * @param context 컨텍스트
     * @return 사용자 정보 반환
     */
//    public func selectUserTable() -> LinkedList<String> {
//       
//    }

    /**
     * 사용자 정보 설정 삭제
     *
     * @param context 컨텍스트
     */
    public func deleteUserBucket(contents: String ) -> Bool {
        KLog.d(tag: TAG, msg: "deleteUserBucket contents : " + contents);
        let realm = try! Realm()

        let bucketObj = realm.objects(Bucket.self).filter("mContent = '" + contents + "'")
        print(bucketObj)
        // Delete an object with a transaction
        try! realm.write {
         realm.delete(bucketObj)
        }
        KLog.d(tag: TAG, msg: "success deleteUserBucket contents : " + contents);
        return true
    }

    public func createChatTable() -> Void {
       

    }

    /**
     * 채팅 정보 insert 메소드
     *
     * @param context  컨텍스트
     * @param contents 내용
     * @param date     날짜
     */
    public func insertChatting(contents : String, date : String , nickname : String ,imagePath : String , seq : String , chatId : String ) -> Void {
        
    }

    /**
     * 채팅 테이블 내용 검색하기
     *
     * @param context 컨텍스트
     * @param chatIdx 채팅방 번호
     * @return 채팅 내용
     */
//    public func selectChatTable(chatIdx : String)-> LinkedList<String> {
//       
//    }
    
//
}
