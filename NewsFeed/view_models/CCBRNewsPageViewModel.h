//
//  CCBRArticleListViewModel.h
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CCBRArticleDataSource;
@class CCBRNewsQuickViewModel;

@interface CCBRNewsPageViewModel : NSObject

@property(nonatomic, assign) BOOL weShowedSwipeHint;
@property(nonatomic, assign) BOOL userSwiped;
@property(nonatomic, readonly) BOOL shouldShowSwipeHint;

- (instancetype)initWithDataSource:(id<CCBRArticleDataSource>)dataSource
                        startIndex:(NSUInteger)startIndex;

- (CCBRNewsQuickViewModel*)startArticleViewModel;
- (CCBRNewsQuickViewModel*)articleViewModelAfterViewModel:(CCBRNewsQuickViewModel*)viewModel;
- (CCBRNewsQuickViewModel*)articleViewModelBeforeViewModel:(CCBRNewsQuickViewModel*)viewModel;

@end

NS_ASSUME_NONNULL_END
