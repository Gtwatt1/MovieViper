//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewController.h"

#import "MoviesListViewOutput.h"
#import "Film.h"
#import "CellTableViewCell.h"
#import "MovieWebService-Swift.h"


@implementation MoviesListViewController{

    UITableView *tableView;
    NSArray *filmList;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
	[super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  filmList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellTableViewCell";
    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellTableViewCell" owner:self options:nil] firstObject];
    }
    DisplayFilm *film = [filmList objectAtIndex:indexPath.row];
    cell.name.text = film.name;
    cell.date.text = film.date;
    cell.filmRating.text = film.ratingString;
    cell.rating.text = film.rating;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.output showFilmDetails:indexPath.row];
}



#pragma mark - MoviesListViewInput

- (void)setupInitialState {
    self.navigationItem.title = @"RootViewController";
    
    tableView = [UITableView new];
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor whiteColor];

    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 100.0;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.translatesAutoresizingMaskIntoConstraints = false;
    
    [tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;


}


-(void)showFilms:(NSArray *)films{
    dispatch_async(dispatch_get_main_queue(), ^{
        filmList = films;
       [tableView reloadData];
    });
}
@end
