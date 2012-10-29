//
//  LYPaintLayerDelegate.m
//  Lythrum
//
//  Created by DmitriyShamaev on 29.10.12.
//  Copyright (c) 2012 DmitriyShamaev. All rights reserved.
//

#import "LYPaintLayerDelegate.h"

@implementation LYPaintLayerDelegate
@synthesize signPath;
@synthesize currentColor,currDrawSize;

-(void)drawLayer:(CALayer*)l inContext:(CGContextRef)context
{
    tmp = CGPathCreateMutableCopy(signPath);
    CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    CGContextSetLineWidth(context, currDrawSize);
    CGContextAddPath(context, tmp);
    CGContextStrokePath(context);

}

@end
