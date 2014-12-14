//
//  FirstViewController.m
//  CustomTabbarNavigationTransition
//
//  Created by qinyihui on 12/14/14.
//  Copyright (c) 2014 qinyihui. All rights reserved.
//

#import "FirstViewController.h"
#import "AnimatorFade.h"

@interface FirstViewController ()
@property(nonatomic,retain)AnimatorFade *animatorFade;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animatorFade=[[AnimatorFade alloc]init];
    self.navigationController.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  
#pragma mark    Navigationdelegate
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return self.animatorFade;
}

#pragma mark    -
#pragma mark    IBAction
-(IBAction)selector:(id)sender{
    UIViewController *vc=[[UIViewController alloc]init];
    vc.hidesBottomBarWhenPushed=YES;
    vc.view.frame=self.view.frame;
    vc.view.backgroundColor=[UIColor grayColor];
    vc.navigationItem.title=@"page2";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
