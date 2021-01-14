//
//  CCBRArticleCollectionView.h
//  NewsFeed
//
//  Created by tungngo on 10/14/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CCBRArticleDataSource;
@class CCBRNewsCardViewModel;

@interface CCBRNewsViewModel : NSObject

@property(nonatomic, weak) id<CCBRArticleDataSource> dataSource;
@property(nonatomic, copy) void (^updateCallback)(void);

- (instancetype)initWithDataSource:(id<CCBRArticleDataSource>)dataSource;
@property(nonatomic) BOOL collectionViewHidden;
@property(nonatomic) BOOL errorMessageLabelHidden;
- (NSUInteger)itemCount;
- (CCBRNewsCardViewModel *)itemViewModelAtIndex:(NSUInteger)index;
- (void)loadMore;
@property(nonatomic, strong) NSString *errorMessage;
@end

NS_ASSUME_NONNULL_END
