//
//  CCBRArticleModel.h
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCBRNewsFeedCategoryModel : JSONModel

@property(nonatomic, assign) NSInteger categoryId;
@property(nonatomic, strong) NSString* name;

@end

@interface CCBRNewsFeedSourceModel : JSONModel

@property(nonatomic, assign) NSInteger domain;
@property(nonatomic, strong) NSString* title;

@end

@interface CCBRNewsFeedModel : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *url;

@end

NS_ASSUME_NONNULL_END
