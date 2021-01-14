//
//  CCBRArticleDataSource.h
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#ifndef CCBRArticleDataSource_h
#define CCBRArticleDataSource_h

@class CCBRNewsArticleModel;

@protocol CCBRArticleDataSource <NSObject>

@property (nonatomic, copy) void (^nextArticlesCallback)(NSUInteger startIndex, NSUInteger endIndex);
@property (nonatomic, copy) void (^errorCallBack)(NSError* error);
- (NSUInteger)articleCount;
- (CCBRNewsArticleModel*)articleBeforeArticle:(CCBRNewsArticleModel*)article;
- (CCBRNewsArticleModel*)articleAfterArticle:(CCBRNewsArticleModel*)article;
- (CCBRNewsArticleModel*)articleAtIndex:(NSInteger)index;
- (void)loadNextArticles;
@end

#endif /* CCBRArticleDataSource_h */
