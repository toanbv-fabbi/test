//
//  CCBRModalViewController.m
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import "CCBRArticlePageViewController.h"

#import "CCBRArticleViewController.h"
#import "CCBRArticleListViewModel.h"
#import "CCBRArticleViewModel.h"

@interface CCBRArticlePageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *pageContainerView;
@property(nonatomic, strong) UIPageViewController *pageViewController;
@property(nonatomic, strong) NSMutableArray*pageContentViewControllers;
@property(nonatomic, assign) NSUInteger pageIndex;

@end

@implementation CCBRArticlePageViewController

- (instancetype)initWithViewModel:(CCBRArticleListViewModel*)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    UIView *pageView = self.pageViewController.view;
    
    [self addChildViewController:self.pageViewController];
    [self.pageContainerView addSubview:pageView];
    [self.pageViewController didMoveToParentViewController:self];
    
    pageView.translatesAutoresizingMaskIntoConstraints = NO;
    [pageView.topAnchor constraintEqualToAnchor:_pageContainerView.topAnchor].active = YES;
    [pageView.leftAnchor constraintEqualToAnchor:_pageContainerView.leftAnchor].active = YES;
    [pageView.bottomAnchor constraintEqualToAnchor:_pageContainerView.bottomAnchor].active = YES;
    [pageView.rightAnchor constraintEqualToAnchor:_pageContainerView.rightAnchor].active = YES;
    
    const int pageContentBufferCount = 5;
    self.pageContentViewControllers = [[NSMutableArray alloc] initWithCapacity:pageContentBufferCount];
    for (int i = 0; i < pageContentBufferCount; i++) {
        [self.pageContentViewControllers addObject:[[CCBRArticleViewController alloc] init]];
    }
    
    CCBRArticleViewController *firstArticleViewController = self.pageContentViewControllers.firstObject;
    firstArticleViewController.viewModel = [self.viewModel currentArticleViewModel];
    [self.pageViewController setViewControllers:@[firstArticleViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nullable UIViewController *)pageViewController:(nonnull UIPageViewController *)pageViewController viewControllerAfterViewController:(nonnull UIViewController *)viewController {
    NSUInteger index = [self.pageContentViewControllers indexOfObject:viewController];
    
    if (![self.viewModel hasPageAfter:index]) {
        return nil;
    }
    
    if (index == self.pageContentViewControllers.count - 1) {
        index = 0;
    } else {
        index += 1;
    }
    
    CCBRArticleViewController *articleViewController = self.pageContentViewControllers[index];
    articleViewController.viewModel = [self.viewModel articlePreviewViewModelAfterIndex:index];
    
    return articleViewController;
}

- (nullable UIViewController *)pageViewController:(nonnull UIPageViewController *)pageViewController viewControllerBeforeViewController:(nonnull UIViewController *)viewController {
    NSUInteger index = [self.pageContentViewControllers indexOfObject:viewController];
    
    if (![self.viewModel hasPageBefore:index]) {
        return nil;
    }
    
    if (index == 0) {
        index = self.pageContentViewControllers.count - 1;
    } else {
        index -= 1;
    }
    
    CCBRArticleViewController *articleViewController = self.pageContentViewControllers[index];
    articleViewController.viewModel = [self.viewModel articlePreviewViewModelBeforeIndex:index];
    
    return articleViewController;
}

//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    return CGSizeZero;
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    
//}
//
//- (void)setNeedsFocusUpdate {
//    
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    return NO;
//}
//
//- (void)updateFocusIfNeeded {
//    
//}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        NSLog(@"completed");
    } else {
        
    }
}

@end
