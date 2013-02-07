#import <QuartzCore/QuartzCore.h>
#import "Theme.h"

@implementation Theme

+ (void)setupNavBarAppearance {
    // remove shadow
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    // nav bar bg
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    bgView.backgroundColor = [Theme grayColor];
    UIGraphicsBeginImageContextWithOptions(bgView.bounds.size, bgView.opaque, 0.0);
    [bgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *image = [img stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    // title
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
            [Theme grayColor],
            UITextAttributeTextShadowColor,
            [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
            UITextAttributeTextShadowOffset,
            [Theme fontForSize:24.0],
            UITextAttributeFont,
            nil];
    [[UINavigationBar appearance] setTitleTextAttributes:attrs];

    // Back bbi
    UIImage *backImage = [[UIImage imageNamed:@"back_bbi"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 10)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImage
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];

    UIImage *backImageHighlighted = [[UIImage imageNamed:@"back_bbi_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 10)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImageHighlighted
                                                      forState:UIControlStateHighlighted
                                                    barMetrics:UIBarMetricsDefault];

    NSDictionary *backTextAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
            [Theme grayColor],
            UITextAttributeTextShadowColor,
            [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
            UITextAttributeTextShadowOffset,
            [Theme fontForSize:14.0],
            UITextAttributeFont,
            nil];
    [[UIBarButtonItem appearance] setTitleTextAttributes:backTextAttrs forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:backTextAttrs forState:UIControlStateHighlighted];
}

+ (UIFont *)fontForSize:(CGFloat)size {
    return [UIFont fontWithName:@"Alternate-Gothic-No2" size:size];
}

+ (UIColor *)grayColor {
    return [UIColor colorWithRed:(95.0 / 255.0) green:(95.0 / 255.0) blue:(95.0 / 255.0) alpha:1.0];
}

+ (UIColor *)lightGrayColor {
    return [UIColor colorWithRed:(215.0 / 255.0) green:(215.0 / 255.0) blue:(215.0 / 255.0) alpha:1.0];
}

+ (UIColor *)faintGrayColor {
    CGFloat rgb = (245.0/255.0);
    return [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
}

@end