//
//  CCBRModalViewController.m
//  NewsFeed
//
//  Created by tungngo on 10/13/20.
//

#import "CCBRNewsPageViewController.h"

#import "CCBRNewsQuickViewController.h"
#import "CCBRNewsPageViewModel.h"
#import "CCBRNewsQuickViewModel.h"
#import "CCBRCommands.h"

@interface CCBRNewsPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *pageContainerView;
@property(nonatomic, strong) UIPageViewController *pageViewController;
@property(nonatomic, strong) NSMutableArray*contentViewControllers;
@property(weak, nonatomic) IBOutlet UIView *hintView;
@property(weak, nonatomic) IBOutlet UIView *iconView;

@end

@implementation CCBRNewsPageViewController

- (instancetype)initWithViewModel:(CCBRNewsPageViewModel*)viewModel {
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
    self.contentViewControllers = [[NSMutableArray alloc] initWithCapacity:pageContentBufferCount];
    for (int i = 0; i < pageContentBufferCount; i++) {
        CCBRNewsQuickViewController *vc = [[CCBRNewsQuickViewController alloc] init];
        vc.dispatcher = self.dispatcher;
        [self.contentViewControllers addObject:vc];
    }
    
    CCBRNewsQuickViewController *contentViewController = self.contentViewControllers.firstObject;
    contentViewController.viewModel = [self.viewModel startArticleViewModel];
    [self.pageViewController setViewControllers:@[contentViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    if (self.viewModel.shouldShowSwipeHint) {
        dispatch_after(
                  dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)),
                  dispatch_get_main_queue(), ^{
            [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.hintView.transform = CGAffineTransformMakeTranslation(-222, 0);
            } completion:^(UIViewAnimatingPosition finalPosition) {
                self.viewModel.weShowedSwipeHint = YES;
            }];
            
            [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:0.3 delay:0.7+0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.iconView.transform = CGAffineTransformMakeTranslation(-8, 0);
            } completion:nil];
            
            [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:0.3 delay:0.7+0.8+0.3+0.001 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionAutoreverse animations:^{
                self.iconView.transform = CGAffineTransformMakeTranslation(0, 0);
            } completion:nil];
            
            [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:0.7 delay:0.7+0.8+0.3+0.001+0.3+5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.hintView.transform = CGAffineTransformMakeTranslation(0, 0);
            } completion:nil];
            
                  });
    }
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
    CCBRNewsQuickViewController *vc = (CCBRNewsQuickViewController *)viewController;
    
    CCBRNewsQuickViewModel *viewModel = [self.viewModel articleViewModelAfterViewModel:vc.viewModel];
    if (viewModel) {
        NSUInteger index = [self.contentViewControllers indexOfObject:viewController];
        if (index == self.contentViewControllers.count - 1) {
            index = 0;
        } else {
            index += 1;
        }
        CCBRNewsQuickViewController *articleViewController = self.contentViewControllers[index];
        articleViewController.viewModel = viewModel;
        return articleViewController;
    } else {
        return nil;
    }
}

- (nullable UIViewController *)pageViewController:(nonnull UIPageViewController *)pageViewController viewControllerBeforeViewController:(nonnull UIViewController *)viewController {
    CCBRNewsQuickViewController *vc = (CCBRNewsQuickViewController *)viewController;
    
    CCBRNewsQuickViewModel *viewModel = [self.viewModel articleViewModelBeforeViewModel:vc.viewModel];
    if (viewModel) {
        NSUInteger index = [self.contentViewControllers indexOfObject:viewController];
        if (index == 0) {
            index = self.contentViewControllers.count - 1;
        } else {
            index -= 1;
        }
        CCBRNewsQuickViewController *articleViewController = self.contentViewControllers[index];
        articleViewController.viewModel = viewModel;
        return articleViewController;
    } else {
        return nil;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        self.viewModel.userSwiped = YES;
        
        CCBRNewsQuickViewController *vc = (CCBRNewsQuickViewController *)pageViewController.viewControllers.firstObject;
        if ([vc isKindOfClass:CCBRNewsQuickViewController.class]) {
            
        }
    }
}

@end
