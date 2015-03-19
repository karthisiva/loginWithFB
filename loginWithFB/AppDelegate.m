//
//  AppDelegate.m
//  loginWithFB
//
//  Created by Subramani B R on 1/3/15.
//  Copyright (c) 2015 Subramani B R. All rights reserved.
//

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [FBLoginView class];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:180];
    for (int i = 0; i < 180; i ++) {
        NSString *string = [NSString stringWithFormat:@"%d",i+1];
        [array addObject:string];
    }
    NSLog(@"%@",[self Addarraydata:array]);
    NSMutableArray *outer = [[NSMutableArray alloc] init];
    NSMutableArray *inner = nil;
    int i = 0;
    
    for (id object in array)
    {
        if (inner == nil) {
            inner = [[NSMutableArray alloc] init];
        }
        [inner addObject:object];
        i ++;
        if (i % 5 == 0) {
            [outer addObject:inner];
            inner = nil;
            i = 0;
        }
    }
    NSLog(@"%@",outer);

    return YES;
}
- (NSArray *)Addarraydata : (NSMutableArray *) inputArray{
    
    NSMutableArray * arrNewArray = [NSMutableArray array];
    
    for(int i = 0; i < [inputArray count]; i = i + 5){
        if((i + 5) < [inputArray count]){
            [arrNewArray addObject:[inputArray subarrayWithRange:NSMakeRange(i, 5)]];
        }else{
            [arrNewArray addObject:[inputArray subarrayWithRange:NSMakeRange(i, ([inputArray count] - i))]];
        }
    }
    
    NSLog(@"arrNewArray = %@",arrNewArray);
    
    return arrNewArray;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
