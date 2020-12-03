//
//  CCBRModalViewController.h
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CCBRNewsPageViewModel;
@protocol CCBRCommands;

@interface CCBRNewsPageViewController : UIViewController

- (instancetype)initWithViewModel:(CCBRNewsPageViewModel*)viewModel;

@property(nonatomic, strong)CCBRNewsPageViewModel*viewModel;
@property(nonatomic, assign) id<CCBRCommands> dispatcher;

@end

NS_ASSUME_NONNULL_END
