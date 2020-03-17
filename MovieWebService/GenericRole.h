//
//  GenericRole.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;

@interface GenericRole : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *biography;
@property (nonatomic, strong, readonly) NSDate *dateOfBirth;
@property (nonatomic, readonly) BOOL nominated;

@property (atomic, weak, readonly) Film *film;

- (id)initWithData:(NSDictionary *)data withFilm:(Film *)film;

@end
