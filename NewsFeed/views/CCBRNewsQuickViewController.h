//
//  CCBRArticleViewController.h
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CCBRNewsQuickViewModel;
@protocol CCBRCommands;

@interface CCBRNewsQuickViewController : UIViewController


@property(nonatomic, strong)CCBRNewsQuickViewModel*viewModel;
@property(nonatomic, assign) id<CCBRCommands> dispatcher;

@end

NS_ASSUME_NONNULL_END
