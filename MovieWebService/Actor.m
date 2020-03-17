//
//  Actor.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Actor.h"

@implementation Actor

- (id)initWithData:(NSDictionary *)data withFilm:(Film *) film {
    self = [super initWithData:data withFilm:film];
    if (self) {
        _screenName = [data objectForKey:@"screenName"];
    }
    return self;
}

@end
