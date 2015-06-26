//
//  DatabaseController.h
//  Promo Pod
//
//  Created by Mathew Wong on 6/24/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Database.h"

@interface DatabaseController : NSObject
@property (nonatomic) BOOL success;
@property (nonatomic, strong) FMDatabase *db;
@property (nonatomic, strong) Database *sharedDB;
@property (nonatomic, strong) NSString *tableSql;

-(void)createTablesAndSeed;
-(void)saveFlight:(id)flightObj;
-(void)clearAllFlights;
-(NSMutableArray *)getFlightData;
@end