//
//  MovieFile.h
//  MovieWebService
//
//  Created by Godwin Olorunshola on 15/03/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

#import "Film.h"

@interface MovieFile : NSObject

- (void)getFilmWithCallback:(void (^)(Film *film))callback;

@end
