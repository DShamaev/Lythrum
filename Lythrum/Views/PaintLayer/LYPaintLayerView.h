//
//  LYPaintLayerView.h
//  Lythrum
//
//  Created by DmitriyShamaev on 09.10.12.
//  Copyright (c) 2012 DmitriyShamaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYPaintLayerView : UIView{
}

@property (nonatomic,strong) UIColor* currentColor;
@property (nonatomic,assign) int currDrawSize;
@property(nonatomic, readonly) CALayer *player;
- (void)clean;
- (void)needNewPath;
- (void)scaleWithNewScaleCoef:(float)coef;

@end
