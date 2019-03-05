//
//  Constant.h
//  AIKang
//
//  Created by playable-iMac2 on 2018/4/18.
//  Copyright © 2018年 majin.missky. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#pragma mark - HttpService-Configure
#ifdef DEBUG
//#define kBASE_URL   @"http://192.168.0.164:8001"
#define kBASE_URL   @"http://jp-stg-trusty.playable.cn"
//http://192.168.0.164:8001/api
#else//Production
#define kBASE_URL   @"http://jp-stg-trusty.playable.cn"
#endif

//链接地址
#define kRULEURL    @"/api/v1/terms"

//字体
#define FONT_REGULAR @"PingFangSC-Regular"

//FBAPPKEY
#define FBAPPID     @"wxbc940b2f7b7b2917"
#define FBAPPKEY    @"53a45612be04480760ccd018624bb2de"


//通知名
#pragma mark - Notification

#define KLOGINOUT           @"kLoginOut"
#define KLOGIN              @"kLogin"
#define KDIDCHANGEPROFILE      @"kDidChangeProfile"
#define KDIDTAPONHOME @"kDidTapOnHome"
#define KUSERLISTUPDATE @"kUserListUpdate"
#define KUPLOADCHATIMAGEFILE @"KUPLOADCHATIMAGEFILE"   

//颜色
#define MainColor RGB(66, 130, 200)
#define MainBGColor RGB(242, 239, 237)
#define MainTabBarColor RGB(245, 245, 245)

//占位图
#define PlaceholderPic [UIImage imageNamed:@"chat_placeholderPic_icon"]

#pragma mark - Base
/** 弱引用*/
#define kWeakSelf(type)   __weak typeof(type) weak##type = type;
/** 强引用*/
#define kStrongSelf(type) __strong typeof(type) type = weak##type;
/** 由角度转换弧度*/
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
/** 由弧度转换角度*/
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)


#define kIOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define kCurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define COLOR_RGB(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define COLOR_RGBA(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]
#define kBACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]


#pragma mark - 屏幕适配
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//iPhoneX系列
#define HEI kSCREEN_WIDTH / 667
#define kSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define Height_StatusBar [UIApplication sharedApplication].statusBarFrame.size.height
#define Height_NavBar 44.f
#define Height_TopBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)

#define kIs_iPhoneX (kSCREEN_WIDTH == 375.f && kSCREEN_HEIGHT == 812.f)
#define kSTATUSBARHEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNAVBARHEIGHT 44.f
#define kTABBARHEIGHT ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? (49.f+34.f) : 49.f)
#define kStatusBarAndNavigationBarHeight ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.f : 64.f-20.f)






#pragma mark - 缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kImageNamed(img)    [UIImage imageNamed:img]
#define kPlaceHolderImage   [UIImage imageNamed:@"ph"]
#define kAvatarPlaceHolderImage   [UIImage imageNamed:@"common_avatar_icon"]
#define Text(key,comment)   NSLocalizedString(key,comment)

#pragma mark - Check
//非空
#define SafeString(string) string ? : @""
/** 字符串是否为空*/
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
/** 数组是否为空*/
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/** 字典是否为空*/
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/** 是否是空对象*/
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
/** 判断是否为iPhone*/
#define kISiPhone   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
/** 判断是否为iPad*/
#define kISiPad     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 判断是真机还是模拟器*/
#if TARGET_OS_IPHONE
//真机
#endif
#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif


//单列宏
#define SingletonH(name) + (instancetype)shared##name;
#define SingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

/** 获取沙盒 Document 路径*/
#define kDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
/** 获取沙盒 temp 路径(注:iPhone 重启会清空)*/
#define kTempPath           NSTemporaryDirectory()
/** 获取沙盒 Cache 路径*/
#define kCachePath          [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
/** 获取程序包中程序路径*/
#define kResource(f, t)     [[NSBundle mainBundle] pathForResource:(f) ofType:(t)];


#ifdef DEBUG

#define NSLog( s, ... ) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String] );

#else

#define NSLog( s, ... )

#endif

#endif /* Constant_h */

