//
//  SnowFallView.h
//  Pods
//
//  Created by Josh Ha-Nyung Chung on 1/21/16.
//
//

#import <UIKit/UIKit.h>

@interface SnowFallView : UIView

@property (nonatomic, assign) float density;

- (void)start;

- (void)stop;

@end
