//
//  CCBRNewsCategoryModel.h
//  NewsFeed
//
//  Created by tungngo on 12/2/20.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCBRNewsCategoryModel : JSONModel

@property(nonatomic, assign) NSInteger categoryId;
@property(nonatomic, strong) NSString* name;

@end

NS_ASSUME_NONNULL_END
