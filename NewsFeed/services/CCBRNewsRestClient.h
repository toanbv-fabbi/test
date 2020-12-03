//
//  CCBRNewsRestClient.h
//  NewsFeed
//
//  Created by tungngo on 10/14/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CCBRNewsFeedRestClientCallback)(NSData*_Nullable, NSError*_Nullable);

@interface CCBRNewsRestClient : NSObject

- (void)loadArticlesWithSessionId:(NSString*)sessionId
                             page:(NSUInteger)page
                             size:(NSUInteger)size
                       newSession:(BOOL)newSession
                            block:(CCBRNewsFeedRestClientCallback)block;

@end

NS_ASSUME_NONNULL_END
