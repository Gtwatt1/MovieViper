//
//  Film.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Film.h"
#import "Actor.h"
#import "Director.h"

@implementation Film

- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _filmRating = [[data objectForKey:@"filmRating"] doubleValue];
        _languages = [data objectForKey:@"languages"];
        _nominated = [[data objectForKey:@"nominated"] boolValue];
        _releaseDate = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"releaseDate"] doubleValue]];
        _name = [data objectForKey:@"name"];
        _rating = [[data objectForKey:@"rating"] doubleValue];
        _director = [[Director alloc] initWithData:[data objectForKey:@"director"] withFilm:self];
        NSMutableArray *castsList = [[NSMutableArray alloc]init];
        NSArray *castsData = [data objectForKey:@"cast"];
        for (NSDictionary *castData in castsData) {
            Actor *actor = [[Actor alloc] initWithData:castData withFilm:self];
            [castsList addObject:actor];
        }
        _cast = [castsList copy];
        [castsList removeAllObjects];
    }
    return self;
}



@end
