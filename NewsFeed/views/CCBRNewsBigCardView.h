//
//  CCBRBigCollectionViewCell.h
//  NewsFeed
//
//  Created by tungngo on 10/15/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CCBRNewsCardViewModel;

@interface CCBRNewsBigCardView : UICollectionViewCell

@property(nonatomic, strong) CCBRNewsCardViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
