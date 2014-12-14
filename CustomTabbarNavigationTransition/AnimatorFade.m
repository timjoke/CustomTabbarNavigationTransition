//
//  AnimatorFade.m
//  CustomTabbarNavigationTransition
//
//  Created by qinyihui on 12/14/14.
//  Copyright (c) 2014 qinyihui. All rights reserved.
//

#import "AnimatorFade.h"
#import "CommonDefine.h"

@implementation AnimatorFade
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return Default_Duration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView=[transitionContext containerView];
    [containerView addSubview:toVC.view];
    toVC.view.alpha=0.0f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.alpha=1.0f;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
