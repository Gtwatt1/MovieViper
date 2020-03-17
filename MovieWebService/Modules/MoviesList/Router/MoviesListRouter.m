//
//  MoviesListRouter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListRouter.h"
#import <UIKit/UIKit.h>
#import "MovieWebService-Swift.h"


@implementation MoviesListRouter

#pragma mark - MoviesListRouterInput

- (void)showFilmDetail:(Film *)film {
    DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
    UIViewController *detailViewController = [builder buildWith:film];

    [self.viewController.navigationController pushViewController:detailViewController animated:YES];
}

@end
