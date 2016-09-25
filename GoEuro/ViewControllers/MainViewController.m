//
//  MainViewController.m
//  GoEuro
//
//  Created by Konstantin on 24.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import "MainViewController.h"
#import "SelectView.h"
#import "TransportViewController.h"


@interface MainViewController () <SelectViewDelegate, UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (weak) IBOutlet SelectView *selectView;

@property (strong) NSArray *controllers;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (weak) UIPageViewController *pageViewController;

@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
    
    [self setupViewControllers];
    
    self.title = @"Berlin - Munich";
    
    _selectView.delegate = self;
    _selectView.viewIndicatorTrain.hidden = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"PageViewController"]) {
        self.pageViewController = segue.destinationViewController;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setupNavBar {
    
    UINavigationBar *navbar = self.navigationController.navigationBar;
    
    navbar.translucent = NO;
    navbar.barStyle = UIBarStyleBlack;
    navbar.barTintColor = [UIColor colorWithRed:0.01 green:0.36 blue:0.65 alpha:1.0];
    [navbar setShadowImage:[UIImage new]];
    [navbar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navbar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)setupViewControllers {
    
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    TransportViewController *trains = [TransportViewController getInstanceForType: TransportTypeTrain];
    TransportViewController *buses = [TransportViewController getInstanceForType: TransportTypeBus];
    TransportViewController *flights = [TransportViewController getInstanceForType: TransportTypeFlight];
    
    trains.index = 0;
    buses.index = 1;
    flights.index = 2;
    
    _selectedIndex = 0;
    _controllers = @[trains, buses, flights];
    
    [_pageViewController setViewControllers: @[trains] direction: UIPageViewControllerNavigationDirectionForward animated: YES completion:nil];
}


#pragma mark - SelectViewDelegate

- (void)selectViewDidSelectTrain {
    
    if (_selectedIndex != 0) {
        _selectedIndex = 0;
        [_pageViewController setViewControllers: @[_controllers[0]] direction: UIPageViewControllerNavigationDirectionReverse animated: YES completion:nil];
    }
}

- (void)selectViewDidSelectBus {
    
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    
    switch (_selectedIndex) {
        case 0: direction = UIPageViewControllerNavigationDirectionForward; break;
        case 1: return; break;
        case 2: direction = UIPageViewControllerNavigationDirectionReverse; break;
        default: break;
    }
    
    _selectedIndex = 1;
    [_pageViewController setViewControllers: @[_controllers[1]] direction: direction animated: YES completion:nil];
}

- (void)selectViewDidSelectFlight {
    
    if (_selectedIndex != 2) {
        _selectedIndex = 2;
        [_pageViewController setViewControllers: @[_controllers[2]] direction: UIPageViewControllerNavigationDirectionForward animated: YES completion:nil];
    }
}



#pragma mark - UIPageViewController

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    TransportViewController *TVC = (TransportViewController *)viewController;
    
    switch (TVC.index) {
        case 0: return nil; break;
        case 1: _selectedIndex = 0; break;
        case 2: _selectedIndex = 1; break;
        default: return nil; break;
    }
    
    return _controllers[_selectedIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    TransportViewController *TVC = (TransportViewController *)viewController;
    
    switch (TVC.index) {
        case 0: _selectedIndex = 1; break;
        case 1: _selectedIndex = 2; break;
        case 2: return nil; break;
        default: return nil; break;
    }
    
    return _controllers[_selectedIndex];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
    TransportViewController *TVC = (TransportViewController *)pendingViewControllers[0];
    _selectedIndex = TVC.index;
    [_selectView setIndicatorToIndex: _selectedIndex];
}

@end




