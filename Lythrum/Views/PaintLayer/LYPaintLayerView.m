//
//  LYPaintLayerView.m
//  Lythrum
//
//  Created by DmitriyShamaev on 09.10.12.
//  Copyright (c) 2012 DmitriyShamaev. All rights reserved.
//

#import "LYPaintLayerView.h"
#import "LYPaintLayerDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface LYPaintLayerView (){
    CALayer* player;
    CGMutablePathRef signPath;
    LYPaintLayerDelegate* pld;
    float curr_scale;
}

- (void)initialization;
- (CGPoint)pointFromTouches:(NSSet*)touches;

@end

@implementation LYPaintLayerView

@synthesize currentColor,currDrawSize;
@synthesize player;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initialization];
    }
    return self;
}


- (id)init {
    self = [super init];
    if (self) {
        // Initialization code
        [self initialization];
    }
    return self;
}

- (void)initialization {
    if (!currentColor) {
        currentColor = [UIColor blackColor];
    }
    currDrawSize = 2.0f;
    player = [CALayer layer];
    player.opaque = YES;
    pld = [[LYPaintLayerDelegate alloc] init];
    player.delegate = pld;
    player.frame = self.bounds;
    [self.layer addSublayer:player];
    signPath = CGPathCreateMutable();
}

- (void) dealloc {
    CGPathRelease(signPath);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (CGPoint)pointFromTouches:(NSSet*)touches {
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    
    CGPoint p = [touch locationInView:self];
    return p;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint p = [self pointFromTouches:touches];
    //signPath = CGPathCreateMutable();
    CGPathMoveToPoint(signPath, NULL, p.x, p.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint p = [self pointFromTouches:touches];
    CGPathAddLineToPoint(signPath, NULL, p.x, p.y);
    pld.currDrawSize = currDrawSize;
    pld.currentColor = currentColor;
    pld.signPath = signPath;
    [player setNeedsDisplay];
}

- (void)needNewPath{
    signPath = CGPathCreateMutable();
    CALayer* nplayer = [CALayer layer];
    nplayer.delegate = pld;
    nplayer.frame = self.bounds;
    [self.layer insertSublayer:nplayer above:player];
    player = nplayer;
}

- (void)clean {
    [self initialization];
    [player setNeedsDisplay];
}

- (void)scaleWithNewScaleCoef:(float)coef{
    [self.layer setSublayerTransform:CATransform3DMakeScale(coef, coef, 1)];
}

@end
