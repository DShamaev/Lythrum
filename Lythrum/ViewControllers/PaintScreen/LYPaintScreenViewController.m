//
//  LYPaintScreenViewController.m
//  Lythrum
//
//  Created by DmitriyShamaev on 09.10.12.
//  Copyright (c) 2012 DmitriyShamaev. All rights reserved.
//

#import "LYPaintScreenViewController.h"
#import "LYPaintLayerView.h"

@interface LYPaintScreenViewController ()

@end

@implementation LYPaintScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    redComp = 0;
    _redColorTextField.text = [NSString stringWithFormat:@"%f",redComp];
    blueComp = 0;
    _blueColorTextField.text = [NSString stringWithFormat:@"%f",blueComp];
    greenComp = 0;
    _greenColorTextField.text = [NSString stringWithFormat:@"%f",greenComp];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBrSizeTextFiled:nil];
    [self setRedColorTextField:nil];
    [self setGreenColorTextField:nil];
    [self setBlueColorTextField:nil];
    [self setPaintView:nil];
    [super viewDidUnload];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField == _brSizeTextFiled){
        _paintView.currDrawSize = [[NSString stringWithFormat:@"%@%@",[textField text],string] intValue];
    }
    if(textField == _redColorTextField){
        redComp = [[NSString stringWithFormat:@"%@%@",[textField text],string] intValue];
        if(redComp>255){
            redComp = 255;
            textField.text = [NSString stringWithFormat:@"255"];
            return false;
        }
        _paintView.currentColor = [UIColor colorWithRed:redComp/255. green:greenComp/255. blue:blueComp/255. alpha:1.0];
        [_paintView needNewPath];
    }
    if(textField == _blueColorTextField){
        blueComp = [[NSString stringWithFormat:@"%@%@",[textField text],string] intValue];
        if(blueComp>255){
            blueComp = 255;
            textField.text = [NSString stringWithFormat:@"255"];
            return false;
        }
        _paintView.currentColor = [UIColor colorWithRed:redComp/255. green:greenComp/255. blue:blueComp/255. alpha:1.0];
        [_paintView needNewPath];
    }
    if(textField == _greenColorTextField){
        greenComp = [[NSString stringWithFormat:@"%@%@",[textField text],string] intValue];
        if(greenComp>255){
            greenComp = 255;
            textField.text = [NSString stringWithFormat:@"255"];
            return false;
        }
        _paintView.currentColor = [UIColor colorWithRed:redComp/255. green:greenComp/255. blue:blueComp/255. alpha:1.0];
        [_paintView needNewPath];
    }
    return true;
}
- (IBAction)scalingLayer:(id)sender {
    UISlider* scaler = (UISlider*)sender;
    [_paintView scaleWithNewScaleCoef:scaler.value/100.];
}
@end
