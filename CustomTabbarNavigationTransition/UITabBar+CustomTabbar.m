//
//  UITabBar+CustomTabbar.m
//  CustomTabbarNavigationTransition
//
//  Created by qinyihui on 12/14/14.
//  Copyright (c) 2014 qinyihui. All rights reserved.
//

#import "UITabBar+CustomTabbar.h"
#import "CommonDefine.h"

@implementation UITabBar (CustomTabbar)
-(id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    if ([event isEqualToString:@"position"]) {
        if(layer.position.x<0){
            //show tabbar
            CATransition *pushFromTop = [[CATransition alloc] init];
            pushFromTop.duration = Default_Duration;
            pushFromTop.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            pushFromTop.type = kCATransitionPush;
            pushFromTop.subtype = kCATransitionFromTop;
            return pushFromTop;
        }else if (layer.position.x>0&&(layer.position.y>layer.bounds.size.height)&&(layer.position.y<[UIScreen mainScreen].bounds.size.height)){
            //hide tabbar
            CATransition *pushFromBottom = [[CATransition alloc] init];
            pushFromBottom.duration = Default_Duration;
            pushFromBottom.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            pushFromBottom.type = kCATransitionPush;
            pushFromBottom.subtype = kCATransitionFromBottom;
            return pushFromBottom;
        }
    }
    return (id<CAAction>)[NSNull null];
}

-(void)runActionForKey:(NSString *)event object:(id)anObject arguments:(NSDictionary *)dict{
    
}
@end
