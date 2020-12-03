//
//  CCBRNewsRestResponse.h
//  NewsFeed
//
//  Created by tungngo on 10/14/20.
//

#import <JSONModel/JSONModel.h>

@protocol CCBRNewsArticleModel;

NS_ASSUME_NONNULL_BEGIN

@interface CCBRNewsRestResponse : JSONModel

@property(nonatomic, strong) NSArray<CCBRNewsArticleModel, Optional>* news;
@property(nonatomic, strong) NSNumber<Optional>* nextPage;
@property(nonatomic, strong) NSString<Optional>* layout;
@property(nonatomic, strong) NSNumber<Optional>* num;
@property(nonatomic, strong) NSNumber<Optional>* page;
@property(nonatomic, strong) NSString<Optional>* rid;
@property(nonatomic, strong) NSString<Optional>* sessionid;

@end

NS_ASSUME_NONNULL_END
