//
//  CCBRNewsSourceModel.m
//  NewsFeed
//
//  Created by tungngo on 12/2/20.
//

#import "CCBRNewsSourceModel.h"

@implementation CCBRNewsSourceModel

+ (JSONKeyMapper*)keyMapper {
  return [JSONKeyMapper mapperForSnakeCase];
}

@end
