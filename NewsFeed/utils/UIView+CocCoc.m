//
//  UIView+CCBR.m
//  NewsFeed
//
//  Created by tungngo on 10/23/20.
//

#import "UIView+CocCoc.h"

@implementation UIView (CocCoc)

- (void)roundCornersWithRadius:(CGFloat)radius {
    if (self.layer.mask) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.path = path.CGPath;
    mask.frame = self.bounds;
    self.layer.mask = mask;
}

@end
