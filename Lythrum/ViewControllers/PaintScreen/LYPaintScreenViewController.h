//
//  LYPaintScreenViewController.h
//  Lythrum
//
//  Created by DmitriyShamaev on 09.10.12.
//  Copyright (c) 2012 DmitriyShamaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYPaintLayerView;

@interface LYPaintScreenViewController : UIViewController<UITextFieldDelegate>{
    float redComp;
    float blueComp;
    float greenComp;
}
@property (strong, nonatomic) IBOutlet UITextField *brSizeTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *redColorTextField;
@property (strong, nonatomic) IBOutlet UITextField *greenColorTextField;
@property (strong, nonatomic) IBOutlet UITextField *blueColorTextField;
@property (strong, nonatomic) IBOutlet LYPaintLayerView *paintView;

@end
