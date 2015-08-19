//
//  ViewController.h
//  AnimationLogingView
//
//  Created by 余盛褚 on 15/8/18.
//  Copyright (c) 2015年 sands.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LogingAnimationType) {
    LogingAnimationType_NONE,
    LogingAnimationType_USER,
    LogingAnimationType_PWD
};


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *UserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;

@property (weak, nonatomic) IBOutlet UIView *loginView;

@property (weak, nonatomic) IBOutlet UIImageView *left_hidden;
@property (weak, nonatomic) IBOutlet UIImageView *right_hidden;

@property (weak, nonatomic) IBOutlet UIImageView *left_look;
@property (weak, nonatomic) IBOutlet UIImageView *right_look;

@property (weak, nonatomic) IBOutlet UIButton *LoginButton;

@end

