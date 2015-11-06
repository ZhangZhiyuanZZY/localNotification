//
//  ViewController.m
//  localNotification
//
//  Created by 章芝源 on 15/11/6.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    ///ios8之后之后需要给本地推送通知, 在注册的时候, 通知类型(声音,图标文字,文本) 信息
    ///位枚举
    /*
     UIUserNotificationTypeNone    = 0,
     UIUserNotificationTypeBadge   = 1 << 0, 包含图标文字  0001
     UIUserNotificationTypeSound   = 1 << 1, // 声音      0010
     UIUserNotificationTypeAlert   = 1 << 2, // 主题内容  0100
     */
    //0111
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
    
    ///注册用户推送设置
    [[UIApplication sharedApplication]registerUserNotificationSettings:setting];

}

//点击发送推送
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1. 创建一个本地通知
    UILocalNotification *local = [[UILocalNotification alloc]init];
    
    /*
     // timer-based scheduling 定制  特定的时间发出通知
     @property(nonatomic,copy) NSDate *fireDate; 触发 时间
     @property(nonatomic,copy) NSTimeZone *timeZone; 时区
     
     @property(nonatomic) NSCalendarUnit repeatInterval; 重复间隔     // 0 means don't repeat
     @property(nonatomic,copy) NSCalendar *repeatCalendar; 重复间隔
     
     @property(nonatomic,copy) CLRegion *region NS_AVAILABLE_IOS(8_0);//区域
     
     @property(nonatomic,assign) BOOL regionTriggersOnce NS_AVAILABLE_IOS(8_0); //决定区域的一个bool值
     
     // alerts
     @property(nonatomic,copy) NSString *alertBody;  提醒的主题
     @property(nonatomic) BOOL hasAction;                // NO 不显示滑动解锁的按钮 反之 显示
     @property(nonatomic,copy) NSString *alertAction;    //滑动解锁的文字
     @property(nonatomic,copy) NSString *alertLaunchImage;   //点击通知横幅的启动程序的 启动 图片
     @property(nonatomic,copy) NSString *alertTitle   提示的标题文字
     
     // sound 默认: UILocalNotificationDefaultSoundName
     @property(nonatomic,copy) NSString *soundName;
     // badge
     @property(nonatomic) NSInteger applicationIconBadgeNumber;  //图标文字
     // user info
     @property(nonatomic,copy) NSDictionary *userInfo;   // 用户指定的携带参数
     [UIUserNotificationSettings settingsForUserNotificationTypes:userNotificationActionSettings:]
     @property (nonatomic, copy) NSString *category NS_AVAILABLE_IOS(8_0);分类
     */

    //2. 设置本地推送通知属性
    local.alertBody = @"女神:你在吗?";
    local.fireDate = [NSDate dateWithTimeIntervalSinceNow:7.0];
    local.soundName = UILocalNotificationDefaultSoundName;//默认通知时间
    local.userInfo = @{@"name":@"女神",@"content":@"在吗?",@"time":@"20180815"};//包装一个字典设置用户自定的携带参数
    local.applicationIconBadgeNumber = 10000;
    local.alertAction = @"约炮, 来不来?";
    ///让应用定制, 本地通知
//    [[UIApplication sharedApplication]scheduledLocalNotifications];
     [[UIApplication sharedApplication]scheduleLocalNotification:local];
    
    
    //立即发出通知
    //[[UIApplication sharedApplication]presentLocalNotificationNow:local];
    
    //取消所有的本地通知
    //[[UIApplication sharedApplication]cancelAllLocalNotifications];

}






@end
