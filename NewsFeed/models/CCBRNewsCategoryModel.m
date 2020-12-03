//
//  CCBRNewsCategoryModel.m
//  NewsFeed
//
//  Created by tungngo on 12/2/20.
//

#import "CCBRNewsCategoryModel.h"

@implementation CCBRNewsCategoryModel

+ (JSONKeyMapper*)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
    @"categoryId" : @"id",
    @"name" : @"name"
  }];
}

@end
