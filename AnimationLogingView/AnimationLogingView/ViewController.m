//
//  ViewController.m
//  AnimationLogingView
//
//  Created by 余盛褚 on 15/8/18.
//  Copyright (c) 2015年 sands.yu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView* imgLeftHand;
    UIImageView* imgRightHand;
    
    UIImageView* imgLeftHandGone;
    UIImageView* imgRightHandGone;
    
    LogingAnimationType AnimationType;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UISetting];
}

-(void)UISetting{
    
    AnimationType = LogingAnimationType_NONE;
    
    UIColor* boColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:100];
    
    _UserNameTextField.layer.borderColor = boColor.CGColor;
    _UserNameTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    _UserNameTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgUser.image = [UIImage imageNamed:@"iconfont-user"];
    [_UserNameTextField.leftView addSubview:imgUser];
    
    _PasswordTextField.layer.borderColor = boColor.CGColor;
    _PasswordTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    _PasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgPwd.image = [UIImage imageNamed:@"iconfont-password"];
    [_PasswordTextField.leftView addSubview:imgPwd];
    
    _loginView.layer.borderColor = boColor.CGColor;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:_PasswordTextField]) {
        AnimationType = LogingAnimationType_PWD;
        [self AnimationUserToPassword];
        
    }else{
        
        if (AnimationType == LogingAnimationType_NONE) {
            AnimationType = LogingAnimationType_USER;
            return;
        }
        AnimationType = LogingAnimationType_USER;
        [self AnimationPasswordToUser];
        
    }
    
}

#pragma mark 移开手动画
-(void)AnimationPasswordToUser{
    
    [UIView animateWithDuration:0.5f animations:^{
        
        self.left_look.frame = CGRectMake(self.left_look.frame.origin.x - 80, self.left_look.frame.origin.y, 40, 40);
        self.right_look.frame = CGRectMake(self.right_look.frame.origin.x + 40, self.right_look.frame.origin.y, 40, 40);
        
        self.right_hidden.frame = CGRectMake(self.right_hidden.frame.origin.x+55, self.right_hidden.frame.origin.y+40, 40, 66);
        self.left_hidden.frame = CGRectMake(self.left_hidden.frame.origin.x-60, self.left_hidden.frame.origin.y+40, 40, 66);
        
    } completion:^(BOOL finished) {
        
    }];

}

#pragma mark 捂眼
-(void)AnimationUserToPassword{
    [UIView animateWithDuration:0.5f animations:^{
        
        self.left_look.frame = CGRectMake(self.left_look.frame.origin.x + 80, self.left_look.frame.origin.y, 0, 0);
        self.right_look.frame = CGRectMake(self.right_look.frame.origin.x - 40, self.right_look.frame.origin.y, 0, 0);
        
        self.right_hidden.frame = CGRectMake(self.right_hidden.frame.origin.x-55, self.right_hidden.frame.origin.y-40, 40, 66);
        self.left_hidden.frame = CGRectMake(self.left_hidden.frame.origin.x+60, self.left_hidden.frame.origin.y-40, 40, 66);
        
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)EndEDitTap:(id)sender {
    if (AnimationType == LogingAnimationType_PWD) {
        [self AnimationPasswordToUser];
    }
    AnimationType = LogingAnimationType_NONE;
    [self.view endEditing:YES];
}
@end
