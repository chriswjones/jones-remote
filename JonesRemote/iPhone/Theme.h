//
// Created by chris on 2/6/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Theme : NSObject

+ (void)setupNavBarAppearance;

+ (UIFont *)fontForSize:(CGFloat)size;

+ (UIColor *)grayColor;

+ (UIColor *)lightGrayColor;

+ (UIColor *)faintGrayColor;

@end