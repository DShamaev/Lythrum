//
//  LYAppDelegate.h
//  Lythrum
//
//  Created by DmitriyShamaev on 09.10.12.
//  Copyright (c) 2012 DmitriyShamaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYPaintScreenViewController;

@interface LYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LYPaintScreenViewController *viewController;

@end
