//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class RecorderVideoVC: MJBasicViewController {
    @IBOutlet weak var preview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        
    }

//    //MARK: **************************** 懒加载
//    lazy var recorder:AliyunIRecorder  = {
//        let _recorder = AliyunIRecorder.init(delegate: self, videoSize: CGSize.init(width: 720, height: 1280))!
//
//        // 预览视图，必须设置
//        _recorder.preview = self.preview
//        //  摄像头角度
//        _recorder.cameraRotate = 270
//        /*
//         视频的输出路径
//         注意：若上一次录制的 outputPath 路径的视频存在沙盒里没有删除，并且与本次录制的视频路径且相同重名的话，录制将会失败
//         */
//        _recorder.outputPath = ;
//
//        // 视频的输出类型
//        _recorder.outputType = AliyunIRecorderVideoOutputPixelFormatType420f;
//
//        /*
//         文件配置路径
//         注意：若上一次录制的 taskPath  路径的视频存在沙盒里没有删除，并且与本次录制的视频路径相且同重名的话，录制将会失败
//         */
//        _recorder.taskPath = taskPath;
//
//        // 美颜状态
//        _recorder.beautifyStatus = YES;
//
//        // 设置美颜度 [0,100]
//        _recorder.beautifyValue = 0;
//
//        // 使用自带人脸识别，开启该功能，系统会在检测到有人脸动图加入时自动进行追踪显示
//        _recorder.useFaceDetect = YES;
//
//        // 后置摄像头采集分辨率 默认：AVCaptureSessionPreset640x480
//        _recorder.backCaptureSessionPreset = AVCaptureSessionPreset1280x720;
//
//        // 前置摄像头采集分辨率 默认：AVCaptureSessionPreset640x480
//        _recorder.frontCaptureSessionPreset = AVCaptureSessionPreset1280x720;
//
//        // 设置识别人脸的个数  最大是3个 最小是1个  如果不需要检测人脸 使用:useFaceDetect = NO
//        _recorder.faceDetectCount = 2;
//
//        // 开始预览，cameraPosition 摄像头位置（前置、后置）
//        [_recorder startPreviewWithPositon:AliyunIRecorderCameraPositionBack];
//
//        // 设置视频最大时长 默认8
//        _recorder.clipManager.maxDuration = 30;
//
//
//        return _recorder
//    }()
   

}
//extension RecorderVideoVC: AliyunIRecorderDelegate  {
//    func recorderDeviceAuthorization(_ status: AliyunIRecorderDeviceAuthor) {
//        
//    }
//    
//    
//}
