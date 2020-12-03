//
//  CCBRArticleModel.m
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import "CCBRNewsArticleModel.h"

@implementation CCBRNewsArticleModel

+ (JSONKeyMapper*)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
    @"newsFeedId" : @"id",
    @"title" : @"title",
    @"desc" : @"description",
    @"imageUrl" : @"image_url",
    @"colorBackground" : @"color_background",
    @"colorText" : @"color_text",
    @"domain" : @"domain",
    @"url" : @"url",
    @"eventTime": @"event_time",
    @"category" : @"category",
    @"source" : @"source"
  }];
}

- (NSUInteger)hash {
  return [self.newsFeedId hash];
}

- (BOOL)isEqual:(id)object {
  if (object == self) {
    return YES;
  }

    CCBRNewsArticleModel *otherItem = (CCBRNewsArticleModel*)object;
    if (![otherItem isKindOfClass:CCBRNewsArticleModel.class]) {
    return NO;
  }

  return [self.newsFeedId isEqualToString:otherItem.newsFeedId];
}

@end
