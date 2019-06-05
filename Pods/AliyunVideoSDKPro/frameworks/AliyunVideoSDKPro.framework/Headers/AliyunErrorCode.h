//
//  AliyunErrorCode.h
//  QUSDK
//
//  Created by Vienta on 2017/10/17.
//  Copyright © 2017年 Alibaba Group Holding Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

//多媒体编解码
#define ERROR_MEDIA_ -100001

//网络
#define ERROR_NETWORK_ -200001

// IO
#define ERROR_IO_ -300001

//内存
#define ERROR_MEM_ -400001

//线程（资源）
#define ERROR_TRES_ -500001

//权限(包含设备权限和SDK权限）
#define ERROR_PERM_ -600001

//参数
#define ERROR_ARG_ -700001

//其他
#define ERROR_PUB_ -800001

typedef enum : int {

    /**
     * 成功
     */
    OK = 0,

    /**
     * 未知错误
     */
    ERROR_UNKNOWN = -1,

    /**
     * License无效
     */
    ERROR_LICENSE_FAILED = ERROR_PERM_ - 1,

    /**
     * 未支付该特效功能
     */
    ERROR_EFFECT_NOT_PAY = ERROR_PERM_ - 2,

    /**
     * 特效使用资源不存在
     */
    ERROR_EFFECT_NO_RESOURCE = ERROR_PERM_ - 3,

    /**
     * 特效不能覆盖已有的效果
     */
    ERROR_EFFECT_USE_NOT_OVERRIDE = ERROR_PERM_ - 4,

    /**
     * 特效使用失败
     */
    ERROR_EFFECT_USE_FAILED = ERROR_PERM_ - 5,

    /**
     * 没有设备权限(音频采集、文件读写、摄像头使用、网络访问等Android 设备权限）
     */
    ERROR_PERM_NO_DEVICE_PERMISSION = ERROR_PERM_ - 6,

    /**
     * 设置背景音乐时参数错误，像背景音乐路径及时间参数,
     */
    ERROR_MUSIC_PARAM = ERROR_PERM_ - 7,

    /**
     * 播放器未准备好
     */
    ERROR_TRES_PLAYER_UNPREPARED = ERROR_TRES_ - 1,

    /**
     * 不合法的裁剪状态（当前有可能正在裁剪或者正在停止裁剪）
     */
    ERROR_TRES_ILLEGAL_CROP_STATE = ERROR_TRES_ - 2, // Android保留

    /**
     * 多次调用异常
     */
    ERROR_START_MULTI = ERROR_TRES_ - 4,

    /**
     * 音频输入流异常
     */
    ERROR_AUDIO_INPUTS_INVALID = ERROR_TRES_ - 5,

    /**
     * 视频渲染类异常
     */
    ERROR_SCREENRENDER_INVALID = ERROR_TRES_ - 6,

    /**
     * 不合法的裁剪状态（当前有可能正在裁剪或者正在停止裁剪）
     */
    ERROR_ILLEGAL_CROP_STATE = ERROR_TRES_ - 7,

    /**
     * 不支持的摄像头类型
     */
    ERROR_TRES_NOT_SUPPORTED_CAMERA_TYPE = ERROR_TRES_ - 8,

    /**
     * 裁剪参数有误
     */
    ERROR_CROP_PARAM = ERROR_ARG_ - 8,
    /**
     * 片段索引无效，超出clip列表最大值或者索引不合法
     */
    ERROR_CLIP_INDEX_INVALID = ERROR_ARG_ - 21,
    /**
     * 片段无效，片段为null
     */
    ERROR_CLIP_INVALID = ERROR_ARG_ - 22,
    /**
     * 当前列表已经没有片段了, 不能执行删除操作
     */
    ERROR_NO_CLIP = ERROR_ARG_ - 23,

    /**
     * 录制尚未准备好
     */
    ERROR_RECORDER_NOT_READY = ERROR_TRES_ - 9,

    /**
     * 重复添加特效
     */
    ERROR_DUPLICATE_ADD_EFFECT = ERROR_TRES_ - 10,

    /**
     * 错误的合成状态
     */
    ERROR_COMPOSE_STATUS_ERROR = ERROR_TRES_ - 11,

    /**
     * 编辑模块没有准备好
     */
    ERROR_TRES_ILLEGAL_EDITOR_STATE = ERROR_TRES_ - 12,

    /**
     * 不合法的状态
     */
    ERROR_INVALID_STATE = ERROR_TRES_ - 13,

    /**
     * 达到最大时长
     */
    ERROR_MAX_DURATION = ERROR_TRES_ - 14,

    /**
     * 不支持的视频格式
     */
    ERROR_MEDIA_NOT_SUPPORTED_VIDEO = ERROR_MEDIA_ - 1,

    /**
     * 不支持的音频格式
     */
    ERROR_MEDIA_NOT_SUPPORTED_AUDIO = ERROR_MEDIA_ - 2,

    /**
     * 不支持的图片格式
     */
    ERROR_MEDIA_NOT_SUPPORTED_IMAGE = ERROR_MEDIA_ - 3,

    /**
     * 不支持的媒体类型
     */
    ERROR_MEDIA_NOT_SUPPORTED_TYPE = ERROR_MEDIA_ - 4,

    /**
     * 视频编码器内部错误
     */
    ERROR_MEDIA_VIDEO_ENCODER_INTERNAL = ERROR_MEDIA_ - 5,

    /**
     * 音频编码器内部错误
     */
    ERROR_MEDIA_AUDIO_ENCODER_INTERNAL = ERROR_MEDIA_ - 6,

    /**
     * 裁剪图片失败
     */
    ERROR_MEDIA_CROP_IMAGE_FAILURE = ERROR_MEDIA_ - 7,

    /**
     * 视频解码器内部错误
     */
    ERROR_MEDIA_VIDEO_DECODER_INTERNAL = ERROR_MEDIA_ - 8,

    /**
     * 视频编码器参数错误
     */
    ERROR_MEDIA_VIDEO_ENCODER_PARAM = ERROR_MEDIA_ - 10,

    /**
     * 音频编码器参数错误
     */
    ERROR_MEDIA_AUDIO_ENCODER_PARAM = ERROR_MEDIA_ - 11,

    /**
     * 音频解码器内部错误
     */
    ERROR_MEDIA_AUDIO_DECODER_INTERNAL = ERROR_MEDIA_ - 13,

    /**
     * 不支持的像素格式
     */
    ERROR_MEDIA_NOT_SUPPORTED_PIXEL_FORMAT = ERROR_MEDIA_ - 12,

    /**
     * 播放器内部错误
     */
    ERROR_MEDIA_PLAYER_INTERNAL = ERROR_MEDIA_ - 14,

    /**
     * 不支持的像素格式
     */
    ERROR_MEDIA_NOT_SUPPORTED_PIXCEL_FORMAT = ERROR_MEDIA_ - 15,

    /**
     * 完成录制失败
     */
    ERROR_FINISH_RECORD_FAILED = ERROR_MEDIA_ - 16,

    /**
     * 录制尚未结束
     */
    ERROR_RECORD_NOT_COMPLETE = ERROR_MEDIA_ - 17,

    /**
     * 开启预览失败
     */
    ERROR_IO_START_PREVIEW_FAILED = ERROR_IO_ - 1,

    /**
     * 开启摄像头失败
     */
    ERROR_IO_OPEN_CAMERA_FAILED = ERROR_IO_ - 2,

    /**
     * 切换摄像头失败
     */
    ERROR_IO_SWITCH_CAMERA = ERROR_IO_ - 3,

    /**
     * 创建临时文件失败
     */
    ERROR_IO_CREATE_TEMP_FILE_FAILED = ERROR_IO_ - 4,

    /**
     * 音频录制失败
     */
    ERROR_IO_AUDIO_RECORD_FAILED = ERROR_IO_ - 5,

    /**
     * 输入视频路径为空
     */
    ERROR_VIDEO_PATH_NULL = ERROR_ARG_ - 1,

    /**
     * 转码初始化参数错误
     */
    ERROR_TRANSCODE_INIT_PARAM_INVALID = ERROR_ARG_ - 3,

    /**
     * 视频尺寸设置不正确
     */
    ERROR_SIZE_INVALID = ERROR_ARG_ - 4,

    /**
     * 视频或音频时长设置异常
     */
    ERROR_PARAM_AUDIO_VIDEO_DURATION_INVALID = ERROR_ARG_ - 8,

    /**
     * 过渡动画时长参数异常
     */
    ERROR_PARAM_TRANSITION_DURATION_INVALID = ERROR_ARG_ - 9,

    /**
     * 动图路径异常
     */
    ERROR_PARAM_GIF_FILE_PATH_INVALID = ERROR_ARG_ - 10,

    /**
     * 资源解析异常
     */
    ERROR_PARAM_RESOURCE_PARSE_INVALID = ERROR_ARG_ - 11,

    /**
     * 图片路径异常
     */
    ERROR_PARAM_IMAGE_FILE_PATH_INVALID = ERROR_ARG_ - 12,

    /**
     * 滤镜路径异常
     */
    ERROR_PARAM_FILTER_FILE_PATH_INVALID = ERROR_ARG_ - 13,

    /**
     * PictureSize不合法
     */
    ERROR_PARAM_PICTURE_SIZE = ERROR_ARG_ - 14,

    /**
     * 水印对象为空
     */
    ERROR_PARAM_IMAGE_WATERMARK_NULL = ERROR_ARG_ - 15,

    /**
     * 无效的涂鸦
     */
    ERROR_PARAM_INVALID_CANVAS = ERROR_ARG_ - 16,

    /**
     * 合成参数无效
     */
    ERROR_PARAM_INVALID_COMPOSE = ERROR_ARG_ - 17,

    /**
     * 合成接口初始化失败
     */
    ERROR_COMPOSE_INIT_FAILED = ERROR_ARG_ - 18,

    /**
     * 特效作用时间区间冲突（两个动效滤镜时间区间有交叉）
     */
    ERROR_CONFLICT_TIME_INTERVAL = ERROR_ARG_ - 19,

    /**
     * 无效参数
     */
    ERROR_INVALID_ARGUMENTS = ERROR_ARG_ - 20,

    /*
     * project 为空
     */
    ERROR_PROJECT_NULL = ERROR_ARG_ - 21,

    /**
     * 添加媒体文件失败
     */
    ERROR_ADD_MEDIA_SOURCE_FAILED = ERROR_ARG_ - 22,

    /**
     * 输出路径无效
     */
    ERROR_OUTOUT_PATH_INVALID = ERROR_ARG_ - 23,

    /**
     * MV路径异常
     */
    ERROR_MV_FILE_PATH_INVALID = ERROR_ARG_ - 24,

    /**
     * 执行任务失败，详细错误码通过回调上报，该错误码用来表示接口执行失败
     */
    ERROR_TASK_FAILED = ERROR_PUB_ - 1,

    /**
     * 上传接口调用失败
     */
    ERROR_UPLOAD_FAILED = ERROR_PUB_ - 2,

    /**
     * 文件不存在
     */
    ERROR_FILE_NOT_EXISTS = ERROR_ARG_ - 25,

    /**
     * 参数异常
     */
    ERROR_PROGRAM = ERROR_ARG_ - 26,

    /**
     * 裁剪退后台
     */
    ERROR_TRANS_BACKGROUND = ERROR_PUB_ - 3,
} AliyunIErrorCode;

// 内部错误
enum AliyunVideoCoreError {

    ALIVC_COMMON_INVALID_STATE = -4,
    ALIVC_COMMON_UNKNOWN_ERROR_CODE = -3,
    ALIVC_COMMON_INVALID_PARAM = -2,
    ALIVC_COMMON_RETURN_FAILED = -1,
    ALIVC_COMMON_RETURN_SUCCESS = 0x00000000,

    ALIVC_FRAMEWORK_ERROR_START = 0x10000000,
    ALIVC_FRAMEWORK_ERROR_THREAD_EXIT = 0x10000001,
    ALIVC_FRAMEWORK_DISPATCH_MSG_FAILED = 0x10000002,
    ALIVC_FRAMEWORK_IS_SYNC_MSG = 0x10000003,
    ALIVC_FRAMEWORK_SEND_SYNC_MSG_TIME_OUT = 0x10000004,
    ALIVC_FRAMEWORK_ERROR_MSG_QUEUE_FULL = 0x10000005,
    ALIVC_FRAMEWORK_ERROR_SERVICE_IS_ALREADY_EXIST = 0x10000006,
    ALIVC_FRAMEWORK_ERROR_SERVICE_CHANGE_STATE_NULL = 0x10000007,
    ALIVC_FRAMEWORK_ERROR_SERVICE_CHANGE_PREPARED_STATE_FAILED = 0x10000008,
    ALIVC_FRAMEWORK_ERROR_SERVICE_CHANGE_PLAYING_STATE_FAILED = 0x10000009,
    ALIVC_FRAMEWORK_ERROR_SERVICE_CHANGE_INITED_STATE_FAILED = 0x1000000A,

    ALIVC_FRAMEWORK_MUXER_ERROR_START = 0x10001000,
    ALIVC_FRAMEWORK_DEMUXER_INIT_MULTI_TIMES = 0x10001001,
    ALIVC_FRAMEWORK_DEMUXER_OPEN_FILE_FAILED = 0x10001002,
    ALIVC_FRAMEWORK_DEMUXER_FIND_STREAM_INFO_FAILED = 0x10001003,

    ALIVC_FRAMEWORK_DECODER_ERROR_START = 0x10002000,
    ALIVC_FRAMEWORK_VIDEO_DECODER_QUEUE_FULL_WARNING = 0x10002001,
    ALIVC_FRAMEWORK_VIDEO_DECODER_SPS_PPS_NULL = 0x10002002,
    ALIVC_FRAMEWORK_VIDEO_DECODER_CREATE_H264_PARAM_SET_FAILED = 0x10002003,
    ALIVC_FRAMEWORK_VIDEO_DECODER_CREATE_HEVC_PARAM_SET_FAILED = 0x10002004,

    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_START = 0x10003000,

    ALIVC_FRAMEWORK_VIDEO_ENCODER_QUEUE_EMPTY_WARNING = 0x10003001,

    ALIVC_FRAMEWORK_VIDEO_ENCODER_QUEUE_FULL_WARNING = 0x10003002,
    ALIVC_FRAMEWORK_VIDEO_DECODER_QUEUE_EMPTY_WARNING = 0x10003003,
    ALIVC_FRAMEWORK_VIDEO_DECODER_CREATE_DECODER_FAILED = 0x10003004,
    ALIVC_FRAMEWORK_VIDEO_DECODER_ERROR_STATE = 0x10003005,
    ALIVC_FRAMEWORK_VIDEO_DECODER_ERROR_INPUT = 0x10003006,
    ALIVC_FRAMEWORK_VIDEO_DECODER_ERROR_NO_BUFFER_AVAILABLE = 0x10003007,
    ALIVC_FRAMEWORK_VIDEO_DECODER_ERROR_INTERRUPT = 0x10003008,
    ALIVC_FRAMEWORK_VIDEO_DECODER_ERROR_DECODE_SPS = 0x10003009,
    ALIVC_FRAMEWORK_VIDEO_ENCODER_CREATE_ENCODER_FAILED = 0x1000300A,
    ALIVC_FRAMEWORK_VIDEO_ENCODER_WIDTHOUT_MATCH_ENCODER = 0x1000300B,
    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_WITHOUT_WORK = 0x1000300C,
    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_INTERRUPT = 0x1000300D,
    ALIVC_FRAMEWORK_VIDEO_DECODER_ERROR_RESOURCE_PREEMPTED = 0x1000300E,
    ALIVC_FRAMEWORK_VIDEO_DECODER_ERROR_DECODE_PACKET = 0x1000300F,
    ALIVC_FRAMEWORK_VIDEO_DECODER_IOS_RESIGN_ACTIVE = 0x10003010,
    ALIVC_FRAMEWORK_VIDEO_DECODER_IOS_BECOME_ACTIVE = 0x10003011,

    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_ANDROID_API_LEVEL = 0x10003100,
    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_STATE = 0x10003101,
    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_INPUT = 0x10003102,
    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_NO_BUFFER_AVAILABLE = 0x10003103,

    ALIVC_FRAMEWORK_VIDEO_ENCODER_ERROR_SESSION_BORKEN = 0x10003104,

    ALIVC_FRAMEWORK_AUDIO_ENCODER_INIT_FAILED = 0x10003203,
    ALIVC_FRAMEWORK_AUDIO_ENCODER_ERROR_STATE = 0x10003204,
    ALIVC_FRAMEWORK_AUDIO_ENCODER_ERROR_INPUT = 0x10003205,
    ALIVC_FRAMEWORK_AUDIO_ENCODER_ERROR_INTERRUPT = 0x10003206,
    ALIVC_FRAMEWORK_AUDIO_ENCODER_ERROR_WITHOUT_WORK = 0x10003207,
    ALIVC_FRAMEWORK_AUDIO_ENCODER_WIDTHOUT_MATCH_ENCODER = 0x10003208,

    ALIVC_FRAMEWORK_AUDIO_DECODER_QUEUE_EMPTY_WARNING = 0x10003300,
    ALIVC_FRAMEWORK_AUDIO_DECODER_QUEUE_FULL_WARNING = 0x10003301,
    ALIVC_FRAMEWORK_AUDIO_DECODER_CREATE_DECODER_FAILED = 0x10003302,
    ALIVC_FRAMEWORK_AUDIO_DECODER_ERROR_STATE = 0x10003303,
    ALIVC_FRAMEWORK_AUDIO_DECODER_ERROR_INPUT = 0x10003304,
    ALIVC_FRAMEWORK_AUDIO_DECODER_ERROR_NO_BUFFER_AVAILABLE = 0x10003305,

    ALIVC_FRAMEWORK_RENDER_ERROR_START = 0x10004000,
    ALIVC_FRAMEWORK_RENDER_FIRST_FRAME_PREVIEWED = 0x10004001,
    ALIVC_FRAMEWORK_RENDER_ERROR_EGL = 0x10004002,
    ALIVC_FRAMEWORK_RENDER_ERROR_GL = 0x10004003,
    ALIVC_FRAMEWORK_RENDER_ERROR_INVALID_DATA = 0x10004004,
    ALIVC_FRAMEWORK_RENDER_ERROR_INVALID_OPERATION = 0x10004005,
    ALIVC_FRAMEWORK_RENDER_ERROR_EDITORLAYOUT_INVALID_SIZE = 0x10004006,
    ALIVC_FRAMEWORK_RENDER_ERROR_SCENE_INVALID = 0x10004007,
    ALIVC_FRAMEWORK_RENDER_ERROR_INVALID_OPTION = 0x10004008,
    ALIVC_FRAMEWORK_RENDER_ERROR_LAYOUT_NOT_INIT = 0x10004009,
    ALIVC_FRAMEWORK_RENDER_ERROR_INVALID_ANIMATION = 0x1000400A,
    ALIVC_FRAMEWORK_RENDER_ERROR_GL_CONTEXT_INIT_FAILED = 0x1000400B,
    ALIVC_FRAMEWORK_RENDER_ERROR_LOAD_LIBRARY_FAILED = 0x1000400C,
    ALIVC_FRAMEWORK_RENDER_ERROR_GL_SWAP_BUFFER_FAILED = 0x1000400D,
    ALIVC_FRAMEWORK_RENDER_ERROR_GL_SWAP_DEFAULT_BUFFER = 0x1000400E,

    ALIVC_PUSHER_ERROR_SDK_CAPTURE_START = 0x10005000,
    ALIVC_PUSHER_ERROR_SDK_CAPTURE_INVALID_STATE = 0x10005001,
    ALIVC_PUSHER_ERROR_SDK_CAPTURE_INIT_FAILED = 0x10005002,
    ALIVC_PUSHER_ERROR_SDK_CAPTURE_CAMERA_OPEN_FAILED = 0x10005003,
    ALIVC_PUSHER_ERROR_SDK_CAPTURE_MIC_OPEN_FAILED = 0x10005004,
    ALIVC_PUSHER_ERROR_SDK_CAPTURE_AUDIO_START_FAIL = 0x10005005,
    ALIVC_PUSHER_ERROR_SDK_CAPTURE_VIDEO_START_FAIL = 0x10005006,
    ALIVC_PUSHER_ERROR_SDK_CAPTURE_ENUMERATION_FAILED = 0x10005007,

    ALIVC_PUSHER_EVENT_CAPTURE_START = 0x10005500,
    ALIVC_PUSHER_EVENT_CAPTURE_OPEN_CAMERA_SUCCESS = 0x10005501,
    ALIVC_PUSHER_EVENT_CAPTURE_OPEN_MIC_SUCCESS = 0x10005502,
    ALIVC_PUSHER_EVENT_CAPTURE_CLOSE_CAMERA_SUCCESS = 0x10005503,

    ALIVC_FRAMEWORK_MUXER_ERROR_CREAT_OUTPUT = 0x10006000,
    ALIVC_FRAMEWORK_MUXER_ERROR_CREATE_ACTX = 0x10006001,
    ALIVC_FRAMEWORK_MUXER_ERROR_CREATE_STREAM = 0x10006002,
    ALIVC_FRAMEWORK_MUXER_ERROR_CREATE_VCTX = 0x10006003,
    ALIVC_FRAMEWORK_MUXER_ERROR_INPUT_PACKET = 0x10006004,
    ALIVC_FRAMEWORK_MUXER_ERROR_VIDEO_AUDIO_UNSET = 0x10006005,
    ALIVC_FRAMEWORK_MUXER_ERROR_STATE = 0x10006006,
    ALIVC_FRAMEWORK_MUXER_ERROR_WRITE_HEADER = 0x10006007,
    ALIVC_FRAMEWORK_MUXER_ERROR_WRITE_TRAILER = 0x10006008,
    ALIVC_FRAMEWORK_MUXER_ERROR_INVALIDATE_PARAM = 0x10006009,
    ALIVC_FRAMEWORK_MUXER_ERROR_FIND_ENCODER = 0x1000600A,
    ALIVC_FRAMEWORK_MUXER_ERROR_NEW_STREAM = 0x1000600B,
    ALIVC_FRAMEWORK_MUXER_ERROR_NEW_ALLOC_OUTPUT_CONTEXT = 0x1000600C,
    ALIVC_FRAMEWORK_MUXER_ERROR_AVIO_OPEN = 0x1000600D,

    ALIVC_FRAMEWORK_DEMUXER_ERROR_IN_END = 0x10007000,
    ALIVC_FRAMEWORK_DEMUXER_ERROR_INPUT_FILE = 0x10007001,

    ALIVC_FRAMEWORK_MEDIA_POOL_WRONG_STATE = 0x10008000,
    ALIVC_FRAMEWORK_MEDIA_POOL_PROCESS_FAILED = 0x10008001,
    ALIVC_FRAMEWORK_MEDIA_POOL_NO_FREE_DISK_SPACE = 0x10008002,
    ALIVC_FRAMEWORK_MEDIA_POOL_CREATE_DECODE_GOP_TASK_FAILED = 0x10008003,
    ALIVC_FRAMEWORK_MEDIA_POOL_AUDIO_STREAM_DECODER_INIT_FAILED = 0x10008004,
    ALIVC_FRAMEWORK_MEDIA_POOL_VIDEO_STREAM_DECODER_INIT_FAILED = 0x10008005,
    ALIVC_FRAMEWORK_MEDIA_POOL_CACHE_DATA_SIZE_OVERFLOW = 0x10008006,
    ALIVC_FRAMEWORK_MEDIA_POOL_STREAM_NOT_EXISTS = 0x10008007,

    ALIVC_FRAMEWORK_AUDIO_PROCESS_START = 0x10009000,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_CREATE_FAILED = 0x10009001,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_RE_CREATE = 0x10009002,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_DESTROY_FAILED = 0x10009003,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_RE_DESTROY = 0x10009004,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_FILE_STREAM_LIST_FAILED = 0x10009005,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_OPTION_LIST_FAILED = 0x10009006,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_ADD_FRAME_INPUT_FAILED = 0x10009007,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_ADD_FRAME_BUFFER_FULL = 0x10009008,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_CTL_INPUT_ERROR = 0x10009009,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_SEEK_FAILED = 0x10009010,
    ALIVC_FRAMEWORK_AUDIO_PROCESS_CONTROL_UNKNOWN = 0x10009011,

    ALIVC_FRAMEWORK_AUDIO_RENDER_START = 0x1000A000,
    ALIVC_FRAMEWORK_AUDIO_RENDER_INIT_SPEAKER_FAILED = 0x1000A001,
    ALIVC_FRAMEWORK_AUDIO_RENDER_ALLOC_SPEAKER_FAILED = 0x1000A002,
    ALIVC_FRAMEWORK_AUDIO_RENDER_SETMUTE_FAILED = 0x1000A003,

    ALIVC_PLAYER_ERROR_START = 0x20000000,

    ALIVC_LIVE_ERROR_START = 0x30000000,

    ALIVC_SVIDEO_ERROR_START = 0x40000000,

    ALIVC_FRAMEWORK_EVENT_START = 0xF0010000,

    ALIVC_PLAYER_EVENT_START = 0xF0020000,

    ALIVC_LIVE_EVENT_START = 0xF0030000,

    ALIVC_SVIDEO_EVENT_START = 0xF0040000,

    ALIVC_RESERVE_ERROR_START = 0xF0F00000,

    ALIVC_RESERVE_END_TAG = 0xFFFFFF00,
};

// 可处理错误
enum AliyunVideoError {
    // license校验失败
    ALIV_LICENSE_CHECK_FAILED = ERROR_LICENSE_FAILED,
    // 文件错误
    ALIV_FRAMEWORK_DEMUXER_ERROR_INPUT_FILE = ALIVC_FRAMEWORK_DEMUXER_ERROR_INPUT_FILE,
    // 磁盘空间不足
    ALIV_FRAMEWORK_MEDIA_POOL_NO_FREE_DISK_SPACE = ALIVC_FRAMEWORK_MEDIA_POOL_NO_FREE_DISK_SPACE,
    // 缓存已满
    ALIV_FRAMEWORK_MEDIA_POOL_CACHE_DATA_SIZE_OVERFLOW = ALIVC_FRAMEWORK_MEDIA_POOL_CACHE_DATA_SIZE_OVERFLOW,
};

@interface AliyunErrorCode : NSObject

+ (AliyunIErrorCode)code:(int)err;

@end
