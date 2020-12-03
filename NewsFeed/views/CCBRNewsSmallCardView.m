//
//  CCBRSmallArticleCollectionViewCell.m
//  NewsFeed
//
//  Created by tungngo on 10/15/20.
//

#import "CCBRNewsSmallCardView.h"

#import "CCBRNewsCardViewModel.h"
#import <SDWebImage/SDWebImage.h>
#import "UIView+CocCoc.h"

@interface CCBRNewsSmallCardView ()

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UIImageView *faviconView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property(weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CCBRNewsSmallCardView

- (void)setViewModel:(CCBRNewsCardViewModel *)viewModel {
    _viewModel = viewModel;
    
    [self updateUI];
}

- (void)updateUI {
    [self.thumbnailView sd_setImageWithURL:self.viewModel.thumbnailURL
                          placeholderImage:[UIImage imageNamed:@"ccbr_news_article_light"]];
    self.faviconView.image = self.viewModel.favicon;
    
    self.sourceLabel.text = self.viewModel.sourceText;
    self.timeLabel.text = self.viewModel.timeText;
    self.titleLabel.text = self.viewModel.titleText;
    
    [self.thumbnailView roundCornersWithRadius:4];
    [self.faviconView roundCornersWithRadius:2];
    
    self.contentView.layer.borderColor = UIColor.blackColor.CGColor;
    self.contentView.layer.borderWidth = 1;
    self.contentView.layer.cornerRadius = 8;
}

@end
