//
//  GenericRole.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "GenericRole.h"

@implementation GenericRole

- (id)initWithData:(NSDictionary *)data withFilm:(Film *)film{
    if (self) {
        _name = [data objectForKey:@"name"];
        _biography = [data objectForKey:@"biography"];
        _dateOfBirth = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"dateOfBirth"] doubleValue]];
        _nominated = [[data objectForKey:@"nominated"] boolValue];
        _film = film;
    }
    return self;
}

@end
