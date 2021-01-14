//
//  CCBRArticleCollectionView.m
//  NewsFeed
//
//  Created by tungngo on 10/14/20.
//

#import "CCBRNewsViewModel.h"

#import "CCBRNewsDataSource.h"
#import "CCBRNewsArticleModel.h"
#import "CCBRNewsCardViewModel.h"

@implementation CCBRNewsViewModel

- (instancetype)initWithDataSource:(id<CCBRArticleDataSource>)dataSource {
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
        
        __weak CCBRNewsViewModel *weakSelf = self;
        self.dataSource.nextArticlesCallback = ^(NSUInteger startIndex, NSUInteger endIndex) {
            weakSelf.collectionViewHidden = false;
            weakSelf.errorMessageLabelHidden = true;
            if (weakSelf.updateCallback) {
                weakSelf.updateCallback();
            }
        };
        self.dataSource.errorCallBack = ^(NSError* error) {
            
            weakSelf.collectionViewHidden = true;
            weakSelf.errorMessageLabelHidden = false;
            if (error.localizedDescription != nil) {
                weakSelf.errorMessage = error.localizedDescription;
            }
            else {
                weakSelf.errorMessage = @"Have error";
            }
            if (weakSelf.updateCallback) {
                weakSelf.updateCallback();
            }
        };
    }
    return self;
}

- (NSUInteger)itemCount {
    return self.dataSource.articleCount;
}

- (CCBRNewsCardViewModel *)itemViewModelAtIndex:(NSUInteger)index {
    CCBRNewsArticleModel *article = [self.dataSource articleAtIndex:index];
    if (article) {
        return [[CCBRNewsCardViewModel alloc] initWithModel:article];
    }
    return nil;
}
- (void)loadMore {
    [self.dataSource loadNextArticles];
}

@end
