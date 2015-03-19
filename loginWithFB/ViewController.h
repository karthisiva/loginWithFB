//
//  ViewController.h
//  loginWithFB
//
//  Created by Subramani B R on 1/3/15.
//  Copyright (c) 2015 Subramani B R. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface ViewController : UIViewController<FBLoginViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)login:(id)sender;
@property(nonatomic,strong)FBLoginView *loginView;
- (IBAction)share:(id)sender;

@end

