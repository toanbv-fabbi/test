//
//  CCBRArticleStore.m
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import "CCBRArticleDataStore.h"

#import "CCBRNewsFeedModel.h"
#import "CCBRNewsRestClient.h"
#import "CCBRNewsRestResponse.h"

@interface CCBRArticleDataStore ()

@property(nonatomic, strong) NSMutableArray *articles;
@property(nonatomic, strong) CCBRNewsRestClient*newsRestClient;

@end

@implementation CCBRArticleDataStore

- (void)start {
    self.articles = [[NSMutableArray alloc] init];
    self.newsRestClient = [[CCBRNewsRestClient alloc] init];
    
    [self.newsRestClient loadArticlesWithSessionId:@"3C9BBC6A-1C55-4527-B75D-434EEA10072D" page:0 size:10 newSession:YES block:^(NSData * _Nonnull data, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            CCBRNewsRestResponse *response = [[CCBRNewsRestResponse alloc] initWithData:data error:&error];
            if (error) {
                NSLog(@"%@", error);
            } else {
                [self.articles addObjectsFromArray:response.items.news];
            }
        }
    }];
}

- (CCBRNewsFeedModel*)firstArticle {
    return self.articles.firstObject;
}

- (CCBRNewsFeedModel *)articleBefore:(CCBRNewsFeedModel *)article {
    NSUInteger index = [self.articles indexOfObject:article];
    if (index == 0) {
        return nil;
    } else {
        return self.articles[index-1];
    }
}

- (CCBRNewsFeedModel *)articleAfter:(CCBRNewsFeedModel *)article {
    NSUInteger index = [self.articles indexOfObject:article];
    if (index >= self.articles.count - 1) {
        return nil;
    } else {
        return self.articles[index+1];
    }
}

- (NSUInteger)articleCount { 
    return self.articles.count;
}



@end
