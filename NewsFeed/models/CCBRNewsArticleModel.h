//
//  CCBRArticleModel.h
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@class CCBRNewsCategoryModel;
@class CCBRNewsSourceModel;

@interface CCBRNewsArticleModel : JSONModel

@property(nonatomic, strong) NSString* newsFeedId;
@property(nonatomic, strong) NSString<Optional>* title;
@property(nonatomic, strong) NSString<Optional>* desc;
@property(nonatomic, strong) NSString<Optional>* imageUrl;
@property(nonatomic, strong) NSString<Optional>* colorBackground;
@property(nonatomic, strong) NSString<Optional>* colorText;
@property(nonatomic, strong) NSString<Optional>* domain;
@property(nonatomic, strong) NSString<Optional>* url;
@property(nonatomic, strong) NSString<Optional>* eventTime;
@property(nonatomic, strong) CCBRNewsCategoryModel<Optional>* category;
@property(nonatomic, strong) CCBRNewsSourceModel<Optional>* source;

@end

NS_ASSUME_NONNULL_END
