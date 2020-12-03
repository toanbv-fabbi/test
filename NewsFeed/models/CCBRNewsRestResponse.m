//
//  CCBRNewsRestResponse.m
//  NewsFeed
//
//  Created by tungngo on 10/14/20.
//

#import "CCBRNewsRestResponse.h"

@implementation CCBRNewsRestResponse

+ (JSONKeyMapper*)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
    @"news" : @"items.news",
    @"nextPage" : @"items.next_page",
    @"layout": @"layout",
    @"num": @"num",
    @"page": @"page",
    @"rid": @"rid",
    @"sessionid": @"sessionid"
  }];
}

@end
