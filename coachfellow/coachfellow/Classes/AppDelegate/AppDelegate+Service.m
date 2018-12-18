//
//  AppDelegate+Service.m
//  coachfellow
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018 theHaft. All rights reserved.
//

#import "AppDelegate+Service.h"
#import <UMCommon/UMCommon.h>
#import <UMShare/UMShare.h>



#define UM_KEY  @"5b9cce8ef43e4858460002f3"
#define UM_WX_KEY @"wx34ad04b90532e44c"
#define UM_WX_SER @"cbffb6f98f1c19391ce2e1a7faece99b"
#define UM_WB_KEY @"2472332550"
#define UM_WB_SER @"644c870f723f551e284620d40ce29112"
#define UM_QQ_KEY @"1107794755"


@implementation AppDelegate (Service)

#pragma mark - 友盟
/// 注册友盟
- (void)app_registUmeng
{
    // 三方分享、登录
    [self Umeng_confitUShareSettings];
    [self Umeng_configUSharePlatforms];
    
    // 友盟统计
    [self Umeng_configAnalyticsPlatforms];
}

- (void)Umeng_configAnalyticsPlatforms
{
    [UMConfigure initWithAppkey:UM_KEY channel:@"App Store"];
}

- (void)Umeng_configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:UM_WX_KEY appSecret:UM_WX_SER redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    /*设置QQ平台的appID*/
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:UM_QQ_KEY  appSecret:@"KAOFNBSWrb2wKDaZ" redirectURL:@"http://mobile.umeng.com/social"];// 3NKle44axynkGeHR
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:UM_WB_KEY  appSecret:UM_WB_SER redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}

- (void)Umeng_confitUShareSettings
{
    [[UMSocialManager defaultManager] openLog:NO];
    [[UMSocialManager defaultManager] setUmSocialAppkey:UM_KEY];
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}
@end
