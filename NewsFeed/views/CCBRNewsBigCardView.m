//
//  CCBRBigCollectionViewCell.m
//  NewsFeed
//
//  Created by tungngo on 10/15/20.
//

#import "CCBRNewsBigCardView.h"

#import "CCBRNewsCardViewModel.h"
#import <SDWebImage/SDWebImage.h>
#import "UIView+CocCoc.h"

@interface CCBRNewsBigCardView ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UIImageView *faviconView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end

@implementation CCBRNewsBigCardView

- (void)setViewModel:(CCBRNewsCardViewModel *)viewModel {
    _viewModel = viewModel;
    
    [self updateUI];
}

- (void)updateUI {
    [self.thumbnailView sd_setImageWithURL:self.viewModel.thumbnailURL
                          placeholderImage:[UIImage imageNamed:@"ccbr_news_article_light"]];
    
    self.faviconView.image = self.viewModel.favicon;
    
    self.sourceLabel.text = self.viewModel.sourceText;
    self.titleLabel.text = self.viewModel.titleText;
    self.timeLabel.text = self.viewModel.timeText;
    self.descriptionLabel.text = self.viewModel.descriptionText;
    
    self.backgroundColor = self.titleLabel.backgroundColor = self.descriptionLabel.backgroundColor = self.sourceLabel.backgroundColor = self.timeLabel.backgroundColor = UIColor.whiteColor;
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithRed:0.892 green:0.892 blue:0.892 alpha:1].CGColor;
    self.layer.cornerRadius = 8;
}

@end
