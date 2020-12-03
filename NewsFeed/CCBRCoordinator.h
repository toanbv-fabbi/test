//
//  CCBRCoordinator.h
//  NewsFeed
//
//  Created by tungngo on 12/2/20.
//

#import <UIKit/UIKit.h>

#import "CCBRCommands.h"
#import "CCBRNewsDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCBRCoordinator : NSObject <CCBRCommands>

- (instancetype)initWithBaseViewController:(UIViewController*)viewController;

@end

NS_ASSUME_NONNULL_END
