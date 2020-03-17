//
//  Film.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Actor.h"
#import "Director.h"

typedef enum {
    G = 0,
    PG,
    PG13,
    R,
    NC17
} FilmRating;

NS_ASSUME_NONNULL_BEGIN

@interface Film : NSObject

@property (nonatomic, readonly) FilmRating filmRating;
@property (nonatomic, readonly) NSArray *languages;
@property (nonatomic, readonly) NSDate *releaseDate;
@property (nonatomic, readonly) NSArray<Actor*> *cast;

- (id)initWithData:(NSDictionary *)data;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic,  readonly) double rating;
@property (nonatomic, strong , readonly) Director *director;
@property (nonatomic, readonly) BOOL nominated;


@end

NS_ASSUME_NONNULL_END
