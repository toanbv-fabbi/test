//
//  CCBRNewsV2MediumCardView.m
//  NewsFeed
//
//  Created by tungngo on 10/16/20.
//

#import "CCBRNewsMediumCardView.h"

#import "CCBRNewsCardViewModel.h"
#import <SDWebImage/SDWebImage.h>

@interface CCBRNewsMediumCardView ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UIImageView *faviconView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property(weak, nonatomic) IBOutlet UIView* separatorView;

@end

@implementation CCBRNewsMediumCardView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setViewModel:(CCBRNewsCardViewModel *)viewModel {
    _viewModel = viewModel;
    
    [self updateUI];
}

- (void)updateUI {
    [self.thumbnailView sd_setImageWithURL:self.viewModel.thumbnailURL];
    self.faviconView.image = self.viewModel.favicon;
    
    self.sourceLabel.text = self.viewModel.sourceText;
    self.titleLabel.text = self.viewModel.titleText;
    self.timeLabel.text = self.viewModel.timeText;
    self.descriptionLabel.text = self.viewModel.descriptionText;
}

@end
