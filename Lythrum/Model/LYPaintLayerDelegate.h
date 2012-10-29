//
//  LYPaintLayerDelegate.h
//  Lythrum
//
//  Created by DmitriyShamaev on 29.10.12.
//  Copyright (c) 2012 DmitriyShamaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYPaintLayerDelegate : NSObject{
    CGMutablePathRef signPath;
    CGMutablePathRef tmp;
}
@property(nonatomic) CGMutablePathRef signPath;
@property (nonatomic,strong) UIColor* currentColor;
@property (nonatomic,assign) int currDrawSize;
@end
