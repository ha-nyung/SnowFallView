//
//  SnowFallView.m
//  Pods
//
//  Created by Josh Ha-Nyung Chung on 1/21/16.
//
//

#import "SnowFallView.h"

@implementation SnowFallView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)start {
    int depth = 0;
    for (CAEmitterLayer *emitter in self.layer.sublayers) {
        emitter.birthRate = 15 + 5 * depth++;
    }
}

- (void)stop {
    for (CAEmitterLayer *emitter in self.layer.sublayers) {
        emitter.birthRate = 0;
    }
}

- (void)didMoveToSuperview {
    [self setUpEmitter];
}

- (void)setDensity:(float)density {
    _density = density;
    
    [self setUpEmitter];
}

- (void)setUpEmitter {
    if (self.superview == nil) {
        return;
    }
    
    self.layer.sublayers = nil;
    
    CAEmitterCell *snowFlake = [CAEmitterCell emitterCell];
    snowFlake.birthRate = self.density;
    snowFlake.lifetime = 15;
    snowFlake.lifetimeRange = 5;
    
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    UIImage *image = [UIImage imageNamed:@"snowflake" inBundle:bundle compatibleWithTraitCollection:nil];
    
    snowFlake.contents = (__bridge_transfer id)image.CGImage;
    snowFlake.contentsScale = [UIScreen mainScreen].scale;
    snowFlake.name = @"snowflake";
    snowFlake.velocity = 60;
    snowFlake.emissionLongitude = M_PI;
    snowFlake.emissionRange = M_PI_4 / 4.0;
    snowFlake.spin = 0.7;
    
    for (int i = 0; i < 3; i++) {
        CAEmitterLayer *emitter = [CAEmitterLayer layer];
        emitter.emitterPosition = CGPointMake(self.center.x, 0);
        emitter.emitterShape = kCAEmitterLayerLine;
        emitter.emitterSize = CGSizeMake(CGRectGetWidth(self.bounds) * 1.5, 1);
        
        float depth = i / 3.0;
        emitter.opacity = 1.0 - depth;
        emitter.scale = 1.0 - depth;
        emitter.velocity = 1.0 - depth;
        emitter.lifetime = 1.0 / (1.0 - depth);
        
        emitter.emitterCells = @[snowFlake];
        
        [self.layer addSublayer:emitter];
    }
}

- (void)setUp {
    self.density = 1;
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
}

@end
