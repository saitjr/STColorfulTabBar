//
//  TJRKit.m
//  TJRKit
//
//  Created by TangJR on 15/1/27.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import "TTools.h"
#import <CommonCrypto/CommonDigest.h>

UIColor * TColorWithRGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
    
    return color;
}

UIView * TLeftViewWithWidthHeight(CGFloat width, CGFloat height) {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    return view;
}

CGFloat TProportion(void) {
    
    return T_SCREEN_WIDTH / 320;
}

CGRect TRectWithProportant(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    
    return CGRectMake(x * TProportion(), y * TProportion(), width * TProportion(), height * TProportion());
}

UIFont * TFontWithSize(CGFloat size) {
    
    return [UIFont systemFontOfSize:size];
}

UIFont * TFontBoldWithSize(CGFloat size) {
    
    return [UIFont boldSystemFontOfSize:size];
}

UIFont * TFontProportantWithSize(CGFloat size) {
    
    return [UIFont systemFontOfSize:size * TProportion()];
}

UIFont * TFontBoldProportantWithSize(CGFloat size) {
    
    return [UIFont boldSystemFontOfSize:size * TProportion()];
}

UIViewController * TRootViewController(void) {
    
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

UIWindow *TWindow(void) {
    
    return [[[UIApplication sharedApplication] delegate] window];
}

NSString * TCurrentDateStringWithSeparatorType(TDateFormatterSeparatorType type) {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy/MM/dd"];
    return [dateFormat stringFromDate:[NSDate date]];
}

NSString * TCurrentTimeString(void) {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    return [dateFormat stringFromDate:[NSDate date]];
}

NSDate * TDateWithDateString(NSString *string, TDateFormatterSeparatorType type) {
    
    if (TIsStringNil(string)) {
        
        return nil;
    }
    NSString *formatter = @"yyyy/MM/dd";
    
    switch (type) {
        case TDateFormatterSeparatorDot:
            
            formatter = @"yyyy.MM.dd";
            break;
        case TDateFormatterSeparatorSlash:
            
            formatter = @"yyyy/MM/dd";
            break;
        case TDateFormatterSeparatorSpace:
            
            formatter = @"yyyy MM dd";
            break;
        case TDateFormatterSeparatorHyphen:
            
            formatter = @"yyyy-MM-dd";
            break;
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatter];
    return [dateFormat dateFromString:string];
}

NSDate * TTimeWithTimeString(NSString *string) {
    
    if (TIsStringNil(string)) {
        
        return nil;
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    return [dateFormat dateFromString:string];
}

NSDate *TDateTimeWithDateTimeString(NSString *string, TDateFormatterSeparatorType type) {
    
    if (TIsStringNil(string)) {
        
        return nil;
    }
    NSString *formatter = @"yyyy/MM/dd";
    
    switch (type) {
        case TDateFormatterSeparatorDot:
            
            formatter = @"yyyy.MM.dd";
            break;
        case TDateFormatterSeparatorSlash:
            
            formatter = @"yyyy/MM/dd";
            break;
        case TDateFormatterSeparatorSpace:
            
            formatter = @"yyyy MM dd";
            break;
        case TDateFormatterSeparatorHyphen:
            
            formatter = @"yyyy-MM-dd";
            break;
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:[NSString stringWithFormat:@"%@ HH:mm", formatter]];
    return [dateFormat dateFromString:string];
}

NSURL *TImageFullPath(NSString *imageName) {
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", TBaseIamgeURL, imageName]];
}

NSURL * TNetworkFullURL(NSString *suffix) {
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", TBaseURL, suffix]];
}

NSString * TNetworkFullString(NSString *suffix) {
    
    return [NSString stringWithFormat:@"%@/%@", TBaseURL, suffix];
}

NSString * TImageFullString(NSString *suffix) {
    
    return [NSString stringWithFormat:@"%@%@", TBaseIamgeURL, suffix];
}

NSString * TSandBoxPathWithFinderType(TSandBoxFinderType type) {
    
    switch (type) {
        case TSandBoxFinderDocument:
            return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        case TSandBoxFinderCaches:
            return [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"Caches"];
        case TSandBoxFinderCookies:
            return [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"Cookies"];
        case TSandBoxFinderPreferences:
            return [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"Preferences"];
        default:
            return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
    }
}

CGFloat TMaxHeightWithView(UIView *view) {
    
    return view.bounds.size.height + view.frame.origin.y;
}

CGFloat TMaxWidthWithView(UIView *view) {
    
    return view.bounds.size.width + view.frame.origin.x;
}

TDeviceScreenType TCurrentDeviceScreenType(void) {
    
    if (T_SCREEN_HEIGHT == 480) {
        
        return TDeviceScreenIPhone4;
    }
    if (T_SCREEN_HEIGHT == 568) {
        
        return TDeviceScreenIPhone5;
    }
    if (T_SCREEN_HEIGHT == 1134) {
        
        return TDeviceScreenIPhone6;
    }
    if (T_SCREEN_HEIGHT == 2208) {
        
        return TDeviceScreenIPhone6P;
    }
    
    return TDeviceScreenUnknown;
}

TSystemVersion TCurrentSystemVersion(void) {
    
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (systemVersion >= 6) {
        
        return TSystemVersion6;
    }
    if (systemVersion >= 7) {
        
        return TSystemVersion7;
    }
    if (systemVersion >= 8) {
        
        return TSystemVersion8;
    }
    if (systemVersion >= 8.1) {
        
        return TSystemVersion81;
    }
    return TSystemVersionUnknown;
}

TNetworkType TCurrentNetworkType(void) {
    
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    
    switch ([reachability currentReachabilityStatus]) {
            
        case NotReachable:
            return TNetworkNone;
            
        case ReachableViaWWAN:
            return TNetworkWWAN;
            
        case ReachableViaWiFi:
            return TNetworkWifi;
            
        default:
            return TNetworkNone;
    }
}

id TFileWithPathAndName(NSString *filePath, TFileType type) {
    
    if (!TIsFileExistWithPath(filePath)) {
        
        return nil;
    }
    
    switch (type) {
        case TFileTxt:
            return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
            
        case TFileImage:
            return [UIImage imageWithContentsOfFile:filePath];
            
        case TFilePListDic:
            return [[NSDictionary alloc] initWithContentsOfFile:filePath];
            
        case TFilePListArray:
            return [[NSArray alloc] initWithContentsOfFile:filePath];
            
        default:
            return nil;
    }
}

TSaveFileResultType TCopyFileWithPathToPath(NSString *filePath, NSString *toPath, BOOL shouldReplace) {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (shouldReplace == NO && TIsFileExistWithPath(toPath)) {
        
        return TSaveFileResultExist;
    }
    
    NSError *error = nil;
    [fileManager copyItemAtPath:filePath toPath:toPath error:&error];
    
    if (error != NULL) {
        
        return TSaveFileResultFail;
    }
    return TSaveFileResultSuccess;
}

TSaveFileResultType TSaveFileWithPathAndName(NSString *path, NSString *fileName, NSData *fileData, TFileType type, BOOL shouldReplace) {
    
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, fileName];
    
    // 如果不需要替换，则检查文件是否存在
    if (shouldReplace == NO && TIsFileExistWithPath(fullPath)) {
        
        return TSaveFileResultExist;
    }
    
    // 如果路径不存在，则创建路径
    if (TIsFileExistWithPath(fullPath) == NO) {
        
        NSError *error = nil;
        
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        
        if (error != NULL) {
            
            return TSaveFileResultNotFound;
        }
    }
    
    return [fileData writeToFile:fullPath atomically:YES];
}

NSString * TMD5(NSString *string) {
    
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

void TScheduleLocalNotification(NSDate *fireDate, NSString *alertBody, NSCalendarUnit repeatInterval, NSInteger badgeNumber, NSString *notificationId) {
    
    if (TIsObjectNil(fireDate) || TIsStringNil(alertBody) || TIsStringNil(notificationId)) {
        
        return;
    }
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = fireDate;
    localNotification.alertBody = alertBody;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.repeatInterval = repeatInterval;
    localNotification.applicationIconBadgeNumber = badgeNumber;
    localNotification.userInfo = @{@"id" : notificationId};
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

void TCancelLocalNotificationWithNotificationId(NSString *notificationId) {
    
    if (TIsStringNil(notificationId)) {
        
        return;
    }
    NSArray *notifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *localNotification in notifications) {
        
        if ([[localNotification.userInfo objectForKey:@"id"] isEqualToString:notificationId]) {
            
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
        }
    }
}

#pragma mark - 获取工程信息

NSString * TBundleId(void) {
    
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *identifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return identifier;
}

NSString * TBundleVersion(void) {
    
    return [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
}

NSString * TUUID(void) {
    
    CFUUIDRef uuid_ref = CFUUIDCreate(nil);
    CFStringRef uuid_string_ref= CFUUIDCreateString(nil, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge_transfer NSString*)uuid_string_ref];
    return uuid;
}

#pragma mark - 常用判断

BOOL TIsStringNil(NSString *string) {
    
    if ([string respondsToSelector:@selector(length)] && string.length > 0) {
        
        return NO;
    }
    return YES;
}

BOOL TIsArrayNil(NSArray *array) {
    
    if ([array respondsToSelector:@selector(count)] && array.count > 0) {
        
        return NO;
    }
    return YES;
}

BOOL TIsDictionaryNil(NSDictionary *dictionay) {
    
    if ([dictionay respondsToSelector:@selector(allKeys)] && [dictionay allKeys].count > 0) {
        
        return NO;
    }
    return YES;
}

BOOL TIsObjectNil(id object) {
    
    if (object == nil || [object isEqual:[NSNull null]]) {
        
        return YES;
    }
    return NO;
}

BOOL TIsFileExistWithPath(NSString *path) {
    
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

BOOL TIsDeleteFileWithPath(NSString *path) {
    
    if (TIsFileExistWithPath(path)) {
        
        return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
    return NO;
}

BOOL TIsRegexCorrectWithRegexType(NSString *string, TRegexType type) {
    
    if (TIsStringNil(string)) {
        
        return NO;
    }
    
    switch (type) {
        case TRegexEmail:
            return TIsRegexEmail(string);
            
        case TRegexCharacter:
            return TIsRegexEnglishCharacter(string);
            
        case TRegexNumber:
            return TIsRegexNumber(string);
            
        case TRegexPhone:
            return TIsRegexPhone(string);
            
        case TRegexSpecialCharacter:
            return TIsRegexSpecialCharacter(string);
            
        case TRegexMobilePhone:
            return TIsRegexMobilePhone(string);
            
        case TRegexIdCard:
            return TIsRegexIdCard(string);
            
        case TRegexChinieseAmount:
            return TIsRegexChinieseAmount(string);
            
        default:
            return NO;
    }
}

BOOL TIsRegexEmail(NSString *email) {
    
    if (TIsStringNil(email)) {
        
        return NO;
    }
    
    NSString *regexString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    
    return [predicate evaluateWithObject:email];
}

BOOL TIsRegexEnglishCharacter(NSString *character) {
    
    if (TIsStringNil(character)) {
        
        return NO;
    }
    
    NSString *regexString = @"^[A-Za-z]+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    
    return [predicate evaluateWithObject:character];
}

BOOL TIsRegexNumber(NSString *number) {
    
    if (TIsStringNil(number)) {
        
        return NO;
    }
    
    NSString *regexString = @"^-?\\d+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regexString];
    
    return [predicate evaluateWithObject:number];
}

BOOL TIsRegexPhone(NSString *phone) {
    
    if (TIsStringNil(phone)) {
        
        return NO;
    }
    
    NSString * MOBILE = @"^[1][34578]\\d{9}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSString * PHS=@"^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];//China Mobile
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];//China Unicom
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];//China Telecom
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];//PHS
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES)
        || ([regextestphs evaluateWithObject:phone] == YES))
    {
        return YES;
    }
    return NO;
}

BOOL TIsRegexSpecialCharacter(NSString *specialCharacter) {
    
    if (TIsStringNil(specialCharacter)) {
        
        return NO;
    }
    
    NSString *regexString = @"^[A-Za-z0-9\u4E00-\u9FA5_-]+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regexString];
    
    return ![predicate evaluateWithObject:specialCharacter];
}

BOOL TIsRegexMobilePhone(NSString *mobilePhone) {
    
    if (TIsStringNil(mobilePhone)) {
        
        return NO;
    }
    
    NSString * regexString = @"^[1][34578]\\d{9}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regexString];
    
    return [predicate evaluateWithObject:mobilePhone];
}

BOOL TIsRegexIdCard(NSString *idCard) {
    
    if (TIsStringNil(idCard)) {
        
        return NO;
    }
    
    NSString * regexString = @"(^\\d{15}$)|(^\\d{17}([0-9]|X)$)";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regexString];
    
    return [predicate evaluateWithObject:idCard];
}

BOOL TIsRegexChinieseAmount(NSString *chinieseString) {
    
    if (TIsStringNil(chinieseString)) {
        
        return NO;
    }
    
    NSInteger count = 0;
    for (int i = 0; i < chinieseString.length; i++) {
        unichar ch = [chinieseString characterAtIndex:i];
        if (0x4e00 < ch  && ch < 0x9fff)
        {
            count++;
        }
    }
    return count;
}

#pragma mark - 基础控件

CGSize TAutoLabelSize(NSString *string, CGSize maxSize, UIFont *font) {
    
    // 根据文字内容，自适应label大小
    UILabel *labelRight = [[UILabel alloc] init];
    labelRight.text = string;
    labelRight.font = font;
    // 计算文本占用大小（设置最大宽为150：即150就换行，最大高为300：即300就开始用...代替）
    CGSize constraintSize = maxSize;
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    // 文本属性（根据字号计算需要的空间大小）
    NSDictionary *attributes = @{NSFontAttributeName: font};
    // IOS7的方法  是NSString的方法
    CGRect rect = [labelRight.text boundingRectWithSize:constraintSize options:options attributes:attributes context:nil];
    // 配置最大显示行数 0为不限制行数
    labelRight.numberOfLines = 0;
    // 配置换行
    labelRight.lineBreakMode = NSLineBreakByWordWrapping;
    
    return rect.size;
}

#pragma mark - 断言