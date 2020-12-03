//
//  CCBRArticleListViewModel.m
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import "CCBRNewsPageViewModel.h"

#import "CCBRNewsDataSource.h"
#import "CCBRNewsQuickViewModel.h"

NSString * const kCCBRNewsWeShowedSwipeHint = @"CCBRNewsWeShowedSwipeHint";
NSString * const kCCBRNewsUserSwiped = @"CCBRNewsUserSwiped";

@interface CCBRNewsPageViewModel ()

@property(nonatomic, assign) id<CCBRArticleDataSource> dataSource;
@property(nonatomic, assign) NSUInteger startIndex;

@end

@implementation CCBRNewsPageViewModel

- (instancetype)initWithDataSource:(id<CCBRArticleDataSource>)dataSource
                        startIndex:(NSUInteger)startIndex {
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
        self.startIndex = startIndex;
        
        self.weShowedSwipeHint = !![NSUserDefaults.standardUserDefaults objectForKey:kCCBRNewsWeShowedSwipeHint];
        self.userSwiped = !![NSUserDefaults.standardUserDefaults objectForKey:kCCBRNewsUserSwiped];
    }
    return self;
}

- (void)setWeShowedSwipeHint:(BOOL)weShowedSwipeHint {
    if (_weShowedSwipeHint == weShowedSwipeHint) {
        return;
    }
    
    _weShowedSwipeHint = weShowedSwipeHint;
    
    [NSUserDefaults.standardUserDefaults setBool:YES forKey:kCCBRNewsWeShowedSwipeHint];
}

- (void)setUserSwiped:(BOOL)userSwiped {
    if (_userSwiped == userSwiped) {
        return;
    }
    
    _userSwiped = userSwiped;
    
    [NSUserDefaults.standardUserDefaults setBool:YES forKey:kCCBRNewsUserSwiped];
}

- (CCBRNewsQuickViewModel*)startArticleViewModel {
    CCBRNewsArticleModel *article = [self.dataSource articleAtIndex:self.startIndex];
    if (article) {
        return [[CCBRNewsQuickViewModel alloc] initWithModel:article];
    }
    return nil;
}

- (CCBRNewsQuickViewModel *)articleViewModelBeforeViewModel:(CCBRNewsQuickViewModel *)viewModel {
    CCBRNewsArticleModel *article = [self.dataSource articleBeforeArticle:viewModel.model];
    if (article) {
        return [[CCBRNewsQuickViewModel alloc] initWithModel:article];
    }
    return nil;
}

- (CCBRNewsQuickViewModel *)articleViewModelAfterViewModel:(CCBRNewsQuickViewModel *)viewModel {
    CCBRNewsArticleModel *article = [self.dataSource articleAfterArticle:viewModel.model];
    if (article) {
        return [[CCBRNewsQuickViewModel alloc] initWithModel:article];
    }
    return nil;
}

- (BOOL)shouldShowSwipeHint {
    return !(self.weShowedSwipeHint || self.userSwiped);
}

@end
