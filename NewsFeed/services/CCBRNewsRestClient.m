//
//  CCBRNewsRestClient.m
//  NewsFeed
//
//  Created by tungngo on 10/14/20.
//

#import "CCBRNewsRestClient.h"

#import "NSString+CocCoc.h"

const NSTimeInterval kRequestTimeout  = 30;

@interface CCBRNewsRestClient ()

@property(nonatomic, strong) NSURLSession* sharedSession;

@end

@implementation CCBRNewsRestClient


- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration* configuration =
                NSURLSessionConfiguration.defaultSessionConfiguration;
            configuration.timeoutIntervalForRequest = kRequestTimeout;
            configuration.timeoutIntervalForResource = kRequestTimeout;
            configuration.requestCachePolicy =
                NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
            self.sharedSession = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (NSURL*)URLForPath:(NSString*)path {
  NSString* baseUrl = @"https://coccoc.com/composer/feed/v1/";

  return
      [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", baseUrl, path]];
}

- (void)loadArticlesWithSessionId:(NSString*)sessionId
                            page:(NSUInteger)page
                            size:(NSUInteger)size
                      newSession:(BOOL)newSession
                           block:(CCBRNewsFeedRestClientCallback)block {
  NSString* path = [@"nre" ccbr_stringByAddingQueryItems:@{
    @"sessionId" : sessionId,
    @"page" : [@(page) stringValue],
    @"size" : [@(size) stringValue],
    @"newsession" : (newSession ? @"1" : @"0"),
  }];
  [self loadResourcesFromPath:path block:block];
}

- (void)loadResourcesFromPath:(NSString*)path
                        block:(CCBRNewsFeedRestClientCallback)block {
  if (!block) {
    return;
  }

  NSMutableURLRequest* request =
      [NSMutableURLRequest requestWithURL:[self URLForPath:path]];

  NSString* cookieValue = @"D3M9oJJC1UUMS1o9y51S9Qb1b3JTbbbTQ73TWuslzgzkNTRtjAtkUeE5gGYWW";
  NSDictionary* cookieProperties = [NSDictionary
      dictionaryWithObjectsAndKeys:@"coccoc.com", NSHTTPCookieDomain, @"/",
                                   NSHTTPCookiePath, @"vid", NSHTTPCookieName,
                                   cookieValue, NSHTTPCookieValue, nil];
  NSHTTPCookie* cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
  NSArray* cookieArray = [NSArray arrayWithObject:cookie];
  NSDictionary* headers =
      [NSHTTPCookie requestHeaderFieldsWithCookies:cookieArray];
  [request setAllHTTPHeaderFields:headers];

  [[self.sharedSession
      dataTaskWithRequest:request
        completionHandler:^(NSData* _Nullable data,
                            NSURLResponse* _Nullable response,
                            NSError* _Nullable error) {
          if (error) {
            block(nil, error);
            return;
          }

          NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
          if ([httpResponse isKindOfClass:NSHTTPURLResponse.class]) {
              if (httpResponse.statusCode != 200) {
                  error = [NSError errorWithDomain:@"" code:0 userInfo:nil];
                    block(nil, error);
                    return;
              }
          }

          block(data, error);
        }] resume];
}

@end
