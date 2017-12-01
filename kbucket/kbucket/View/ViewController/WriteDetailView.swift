//
//  WriteDetailView.swift
//  버킷 상세 클래스
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import AVFoundation

class WriteDetailView: UIViewController , IHttpReceive, AVCapturePhotoCaptureDelegate , UIImagePickerControllerDelegate,
UIPopoverControllerDelegate,UINavigationControllerDelegate {
    
    private let TAG : String = "WriteDetailView"
    private var mContents : String = ""
    private var mDate : String = ""
    private var mDeadLineDate : String = ""
    private var mPhotoPath : String = ""
    var CONTENTS  = String()
    var BACK  = String()
    
    private var mImageIdx : Int = -1
    private var mCategory : Int = 1
    
    private let TOAST_MASSEGE : Int = 10
    private let UPLOAD_IMAGE : Int = 20
    private let UPLOAD_BUCKET : Int = 30
    private let SELECT_BUCKET_CATEGORY : Int = 40
    
     /*카메라 호출 리턴값*/
    private let REQ_CODE_PICKCUTRE : Int = 1000
     /*갤러리 호출 리턴값*/
    private let REQ_CODE_GALLERY : Int = 1001
    
    @IBOutlet weak var btShare: UIButton!
    @IBOutlet weak var btSave: UIButton!
    @IBOutlet weak var btDel: UIButton!
    @IBOutlet weak var ckComplete: UISwitch!
    @IBOutlet weak var btGallery: UIButton!
    @IBOutlet weak var btCamera: UIButton!
    
    @IBOutlet weak var btCheckbox: UISwitch!
    private var mSqlQuery  : SQLQuery? = nil
    
    @IBOutlet weak var etDate: UITextField!
    @IBOutlet weak var etContent: UITextField!
    @IBOutlet weak var etCompleteDate: UITextField!
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var ivRemoveImage: UIImageView!
    // private ConfirmPopup mConfirmPopup = null;
    // private SpinnerListPopup mCategoryPopup = null;
    
    var picker:UIImagePickerController? = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: TAG, msg: "viewDidLoad");
        KLog.d(tag: TAG, msg: "viewDidLoad CONTENTS : "  + CONTENTS);
        KLog.d(tag: TAG, msg: "viewDidLoad BACK : "  + BACK);
        mContents = CONTENTS
        initialize()
    }
    
    func initialize(){
        KLog.d(tag: TAG, msg: "initialize");
        mSqlQuery = SQLQuery()
        setData()
        picker?.delegate = self
        //AppUtils.sendTrackerScreen(this, "가지상세화면");
    }
    
    /**
     * 이미지 첨부 버튼 보이게 하기/숨기기 메소드
     *
     * @param ishide 숨기기 여부 (true - 숨기기)
     */
    private func hideImageAttachButton(ishide : Bool) {
        if (ishide) {
            btCamera.isHidden = true
            btGallery.isHidden = true
        } else {
            btCamera.isHidden = false
            btGallery.isHidden = false
        }
    }
    
    /**
     * DB 데이타 불러와서 데이타 표시하기
     */
    private func setData() {
        if(mSqlQuery != nil){
            var bucketList : Results<Bucket>? = nil
            bucketList = mSqlQuery?.selectKbucket(memoContents: mContents)
            let strCount = String(describing: bucketList?.count)
            KLog.d(tag: TAG, msg: "realm DB count : " + strCount)
            for kbucket in bucketList!
            {
                KLog.d(tag: TAG, msg: "realm DB mContent : " + kbucket.mContent)
                KLog.d(tag: TAG, msg: "realm DB mCompleteDate : " + kbucket.mCompleteDate)
                KLog.d(tag: TAG, msg: "realm DB mCompleteYN : " + kbucket.mCompleteYN)
                KLog.d(tag: TAG, msg: "realm DB mImageURl : " + kbucket.mImageURl)
                
                if(kbucket.mCompleteYN == "Y"){
                    btCheckbox.isOn = true
                }else{
                    btCheckbox.isOn = false
                }
                
                if(kbucket.mImageURl != nil && kbucket.mImageURl.count > 0 ){
                    hideImageAttachButton(ishide: true)
                    ivImage.isHidden = true
                    //         mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
                    //         mImageView.setImageBitmap(bm);
                    ivRemoveImage.isHidden = true
                }else{
                    hideImageAttachButton(ishide: false)
                    ivImage.isHidden = true
                }
                
                etDate.text = kbucket.mCompleteDate
                etContent.text = kbucket.mContent
                etCompleteDate.text = kbucket.mCompleteDate
            }
        }
    }
    
    /**
     * DB 데이타 동기화하기
     */
    private func updateDBDate() {
        let NewContents = etContent.text!
        let completeYN = btCheckbox.isOn ? "Y" : "N"
        let imagePath = mPhotoPath != nil ? mPhotoPath : ""
        let date = etDate.text != nil ?  etDate.text! : ""
        let completeDate = etCompleteDate.text != nil ? etCompleteDate.text! : ""
        
        let newBucket : Bucket = Bucket()
        newBucket.mContent = NewContents
        newBucket.mCompleteYN = completeYN
        newBucket.mImageURl = imagePath
        newBucket.mCompleteDate = date
        newBucket.mCompleteDate = completeDate
        
        if(mSqlQuery != nil){
            mSqlQuery?.updateMemoContent(newBucket: newBucket, cotents: mContents)
        }
    }
    
    /**
     * DB 데이타 동기화하기(삭제)
     */
    private func removeDBData(Content : String) {
        KLog.d(tag : TAG, msg: "@@ remove Data Contents : " + Content);
        if(mSqlQuery != nil){
            mSqlQuery?.deleteUserBucket(contents: Content)
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        back(strBack : BACK)
    }
    
    private func back(strBack : String){
        KLog.d(tag: TAG, msg: "back : " + strBack)
        if(BACK == ContextUtils.VIEW_COMPLETE_LIST){
            let uvc = self.storyboard?.instantiateViewController(withIdentifier: "BucketListViewCtrl")
            uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
            present(uvc!, animated: true, completion: nil)
        }else{
            let uvc = self.storyboard?.instantiateViewController(withIdentifier: ContextUtils.MAIN_VIEW)
            uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
            present(uvc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
        switch (sender  as! UIButton)  {
        case btSave:
            KLog.d(tag: TAG, msg: "onClick btSave")
            updateDBDate()
            back(strBack : BACK)
            break;
        case btDel:
            KLog.d(tag: TAG, msg: "onClick btDel")
            var title = AppUtils.localizedString(forKey : "delete_popup_title")
            var content = AppUtils.localizedString(forKey : "delete_popup_content")
            //             mConfirmPopup = new ConfirmPopup(this, title, ": " + mContents + "\n\n " + content, R.layout.popup_confirm, this, OnPopupEventListener.POPUP_BUCKET_DELETE);
            //             mConfirmPopup.showDialog()
            break;
        case btShare:
            KLog.d(tag: TAG, msg: "onClick btShare")
            var title = AppUtils.localizedString(forKey : "share_popup_title")
            var content = AppUtils.localizedString(forKey : "share_popup_content")
            //             mConfirmPopup = new ConfirmPopup(this, title, ": " + mContents + "\n\n " + content, R.layout.popup_confirm, this, OnPopupEventListener.POPUP_BUCKET_SHARE);
            //             mConfirmPopup.showDialog();
            break
        case btCamera:
             KLog.d(tag: TAG, msg: "onClick btCamera")
             startCamera()
            //             mPhotoPath = DataUtils.getNewFileName();
            //             Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
            //             intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(new File(mPhotoPath)));
            //             startActivityForResult(intent, REQ_CODE_PICKCUTRE);
            break;
        case btGallery:
             KLog.d(tag: TAG, msg: "onClick btGallery")
             openGallary()
            //             intent = new Intent(Intent.ACTION_PICK);
            //             intent.setType(MediaStore.Images.Media.CONTENT_TYPE);
            //             intent.setData(MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
            //             startActivityForResult(intent, REQ_CODE_GALLERY);
            break;
        case etDate:
             KLog.d(tag: TAG, msg: "onClick etDate")
            //             GregorianCalendar gregorianCalendar = new GregorianCalendar();
            //             int year = gregorianCalendar.get(Calendar.YEAR);
            //             int month = gregorianCalendar.get(Calendar.MONTH);
            //             int day = gregorianCalendar.get(Calendar.DAY_OF_MONTH);
            //             int hour = gregorianCalendar.get(Calendar.HOUR_OF_DAY);
            //             int minute = gregorianCalendar.get(Calendar.MINUTE);
            //             DatePickerDialog datePickerDialog = new DatePickerDialog(WriteDetailActivity.this, dateSetListener, year, month, day);
            //             datePickerDialog.show();
            break;
        case etCompleteDate:
             KLog.d(tag: TAG, msg: "onClick etCompleteDate")
            //             gregorianCalendar = new GregorianCalendar();
            //             year = gregorianCalendar.get(Calendar.YEAR);
            //             month = gregorianCalendar.get(Calendar.MONTH);
            //             day = gregorianCalendar.get(Calendar.DAY_OF_MONTH);
            //             datePickerDialog = new DatePickerDialog(WriteDetailActivity.this, dateSetListener2, year, month, day);
            //             datePickerDialog.show();
            break;
        
        case ivRemoveImage:
            mPhotoPath = ""
            hideImageAttachButton(ishide : false)
            ivImage.isHidden = true
            ivRemoveImage.isHidden = true
            break;
        
        default:
            break;
        }
    }
    
     private func dateSetListener(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
     }

    private func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
    }

    // private DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener() {
    //     @Override
    //     public void onDateSet(DatePicker view, int year, int monthOfYear,
    //                           int dayOfMonth) {
    //         String msg = String.format("%d-%02d-%02d", year, monthOfYear + 1, dayOfMonth);
    //         mDate = msg;
    //         ((TextView) findViewById(R.id.write_layout_titleView)).setText(mDate);
    //     }
    // };
    
    // private DatePickerDialog.OnDateSetListener dateSetListener2 = new DatePickerDialog.OnDateSetListener() {
    //     @Override
    //     public void onDateSet(DatePicker view, int year, int monthOfYear,
    //                           int dayOfMonth) {
    //         String msg = String.format("%d-%02d-%02d", year, monthOfYear + 1, dayOfMonth);
    //         mDeadLineDate = msg;
    //         ((TextView) findViewById(R.id.write_layout_deadline)).setText(mDeadLineDate);
    //     }
    // };
    
    // @Override
    // protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    //     if (requestCode == REQ_CODE_PICKCUTRE) {
    //         if (resultCode == Activity.RESULT_OK) {
    //             Bitmap bm = ByteUtils.getFileBitmap(mPhotoPath);
    //             if (bm != null) {
    //                 hideImageAttachButton(true);
    //                 mImageView.setVisibility(View.VISIBLE);
    //                 mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
    //                 mImageView.setImageBitmap(bm);
    //                 ((Button) findViewById(R.id.write_image_remove)).setVisibility(View.VISIBLE);
    //             }
    //         }
    //     } else if (requestCode == REQ_CODE_GALLERY) {
    //         if (data != null) {
    //             Uri imgUri = data.getData();
    //             if (imgUri != null) {
    //                 KLog.d(TAG, "@@ photo data: " + imgUri.getPath());
    //                 mPhotoPath = DataUtils.getNewFileName();
    //                 try {
    //                     String imagePath = DataUtils.getMediaScanPath(this, imgUri);
    //                     KLog.d(TAG, "@@ photo imagePath :" + imagePath);
    //                     if (imagePath == null) {
    //                         String message = getString(R.string.write_bucekt_image_attch);
    //                         Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //                     }
    //                     DataUtils.copyFile(imagePath, mPhotoPath);
    //                     ByteUtils.setFileResize(mPhotoPath, 400, 800, false);
    //                     Bitmap photo = ByteUtils.getFileBitmap(mPhotoPath);
    //                     if (photo != null) {
    //                         hideImageAttachButton(true);
    //                         mImageView.setVisibility(View.VISIBLE);
    //                         mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
    //                         mImageView.setImageBitmap(photo);
    //                         ((Button) findViewById(R.id.write_image_remove)).setVisibility(View.VISIBLE);
    //                     }
    //                 } catch (IOException e) {
    //                     e.printStackTrace();
    //                 }
    //             }
    //         }
    //     }
    // }
    
    // @Override
    // public void onPopupAction(int popId, int what, Object obj) {
    //     if (popId == OnPopupEventListener.POPUP_BUCKET_SHARE) {
    //         if (what == POPUP_BTN_OK) {
    //             mHandler.sendEmptyMessage(SELECT_BUCKET_CATEGORY);
    //         }
    //         mConfirmPopup.closeDialog();
    //     } else if (popId == OnPopupEventListener.POPUP_BUCKET_DELETE) {
    //         if (what == POPUP_BTN_OK) {
    //             removeDBData(mContents);
    //             onBackPressed();
    //         }
    //         mConfirmPopup.closeDialog();
    //     } else if (popId == OnPopupEventListener.POPUP_BUCKET_CATEGORY) {
    //         if (what == POPUP_BTN_OK) {
    //             JSONObject json = (JSONObject) obj;
    //             try {
    //                 mCategory = Integer.valueOf(json.getString("styleCode"));
    //             } catch (JSONException e) {
    //                 mCategory = 1;
    //             }
    //             mHandler.sendEmptyMessage(UPLOAD_BUCKET);
    //         }
    //         mCategoryPopup.closeDialog();
    //     }
    // }
    
    /**
     * 서버로 전송할 데이타 만들기
     *
     * @return 전송 데이타
     */
    private func shareBucketImage() -> Bucket {
        let bucket : Bucket = Bucket()
        let userNickName = UserDefault.read(key : ContextUtils.KEY_USER_NICKNAME)
        bucket.mNickName = userNickName
        bucket.mContent = mContent
        bucket.mImageURl = ""
        bucket.mDate = mDate
        bucket.mCategory = mCategory
        
        return bucket
    }
    
    func onHttpReceive(type : Int, actionId: Int,  data : Data){
        KLog.d(tag : TAG, msg : "@@ onHttpReceive : " + obj);
        KLog.d(tag : TAG, msg : "@@ onHttpReceive type : " + type);
        
        var isValid : Bool  = false
        do {
            if let jsonString = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                if jsonString != nil {
                    isValid = jsonString["isValid"] as! Bool
                    print(jsonString)
                }
            }
        } catch {
            print("JSON 파상 에러")
        }

        if (actionId == IHttpReceive.INSERT_BUCKET) {
                if (type == IHttpReceive.HTTP_FAIL) {
                    let message = AppUtils.localizedString(forKey : "write_bucekt_fail_string")
                    handleMessage(what: TOAST_MASSEGE, obj: message)
                } else {
                    if (data != nil) {
                        do {
                            if let jsonString = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                    mImageIdx = json.getInt("idx")
                            }
                        } catch {
                             KLog.d(tag : TAG, msg : "@@ Exception : " + error)
                        }
        
                        if (isValid == true) {
                            // 이미지가 있는 경우 전송함
                            if (mPhotoPath != nil && mPhotoPath.count > 0 ) {
                                handleMessage(what: UPLOAD_IMAGE, obj: "")
                            } else {
                                 let message = AppUtils.localizedString(forKey : "write_bucekt_success_string")
                                handleMessage(what: TOAST_MASSEGE, obj: message)
                            }
                        }
                    }
                }
            }// 이미지 업로드 결과
            else if (actionId == IHttpReceive.INSERT_IMAGE) {
                if (type == IHttpReceive.HTTP_FAIL) {
                    let message = AppUtils.localizedString(forKey : "upload_image_fail_string")
                    handleMessage(what: TOAST_MASSEGE, obj: message)
                } else {
                    if (isValid == true) {
                        let message = AppUtils.localizedString(forKey : "write_bucekt_success_string")
                        handleMessage(what: TOAST_MASSEGE, obj: message)
                    }
                }
            }
    }
    
    func handleMessage(what : Int, obj : String) {
        switch (what) {
        case TOAST_MASSEGE:
            Toast.showToast(message: obj)
            break;
        case UPLOAD_IMAGE:
            let photoPath = mPhotoPath
             KLog.d(tag : TAG, msg : "handleMessage UPLOAD_IMAGE photoPath : " + photoPath);
             if(photoPath != nil && photoPath.count > 0 ){
//                 Bitmap bitmap = ByteUtils.getFileBitmap(photoPath);
            //                 Calendar calendar = Calendar.getInstance();
            //                 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmss");
            //                 String fileName = sdf.format(calendar.getTime());
            
            //                 byte[] bytes = ByteUtils.getByteArrayFromBitmap(bitmap);
            let  httpUrlFileUploadManager : HttpUrlFileUploadManager =  HttpUrlFileUploadManager(url : ContextUtils.KBUCKET_UPLOAD_IMAGE_URL, post : true, receive : self, id : ConstHTTP.INSERT_IMAGE, bytes)
            httpUrlFileUploadManager.actionTask(photoPath, "idx", mImageIdx + "", fileName + ".jpg")
            // HttpUrlFileUploadManager httpUrlFileUploadManager = new HttpUrlFileUploadManager(ContextUtils.KBUCKET_UPLOAD_IMAGE_URL, this, IHttpReceive.INSERT_IMAGE, bytes);
             // httpUrlFileUploadManager.execute(photoPath, "idx", mImageIdx + "", fileName + ".jpg");
             }else{
                 KLog.d(tag : TAG, msg : "@@ UPLOAD IMAGE NO !");
             }
            break;
        case UPLOAD_BUCKET:
            let url  = ContextUtils.KBUCKET_INSERT_BUCKET_URL
            let  httpUrlTaskManager : HttpUrlTaskManager =  HttpUrlTaskManager(url : url, post : true, receive : self, id : ConstHTTP.INSERT_BUCKET);
            httpUrlTaskManager.actionTask();
            break;
        case SELECT_BUCKET_CATEGORY:
            let title = AppUtils.localizedString(forKey : "category_popup_title")
            let content = AppUtils.localizedString(forKey : "category_popup_content")

            var list : Array<Category> = Array()
            list.append(Category("LIEF", 1))
            list.append(Category("LOVE", 2))
            list.append(Category("WORK", 3))
            list.append(Category("EDUCATION", 4))
            list.append(Category("FAMILY", 5))
            list.append(Category("FINANCE", 6))
            list.append(Category("DEVELOP", 7))
            list.append(Category("HEALTH", 8))
            list.append(Category("ETC", 9))
            //             mCategoryPopup = new SpinnerListPopup(this, title, "", list, R.layout.popupview_spinner_list, this, OnPopupEventListener.POPUP_BUCKET_CATEGORY);
            //             mCategoryPopup.showDialog();
            break;
        default:
            break;
        }
    }
    
    func startCamera(){
        var captureSesssion: AVCaptureSession!
        var stillImageOutput: AVCapturePhotoOutput?
        var previewLayer: AVCaptureVideoPreviewLayer?
        
        captureSesssion = AVCaptureSession()
        stillImageOutput = AVCapturePhotoOutput()
        
        captureSesssion.sessionPreset = AVCaptureSessionPreset1920x1080 // 해상도설정
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            
            // 입력
            if (captureSesssion.canAddInput(input)) {
                captureSesssion.addInput(input)
                
                // 출력
                if (captureSesssion.canAddOutput(stillImageOutput)) {
                    captureSesssion.addOutput(stillImageOutput)
                    captureSesssion.startRunning() // 카메라 시작
                    
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSesssion)
                    previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect //화면 조절
                    previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait // 카메라 방향
                    
                    ivImage.layer.addSublayer(previewLayer!)
                    
                    // 뷰 크기 조절
                    previewLayer?.position = CGPoint(x: self.ivImage.frame.width / 2, y: self.ivImage.frame.height / 2)
                    previewLayer?.bounds = self.ivImage.frame
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let photoSampleBuffer = photoSampleBuffer {
            // JPEG형식으로 이미지데이터 검색
            let photoData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
            let image = UIImage(data: photoData!)
            
            // 사진보관함에 저장
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }
    }
    
    func openGallary(){
        picker!.allowsEditing = false
        picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        present(picker!, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        ivImage.contentMode = .scaleAspectFill
        ivImage.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
}
