//
//  DatabaseController.m
//  Promo Pod
//
//  Created by Mathew Wong on 6/24/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "DatabaseController.h"

@implementation DatabaseController

-(instancetype)init {
    if(self = [super init]) {
        _sharedDB = [Database sharedDatabase];
        [_sharedDB initDB];
        _db = [_sharedDB getDB];
    }
    return self;
}

-(void)createTablesAndSeed {
    _success = [_db tableExists:@"FlightsChosen"];
    
    if(!_success) {
        NSString *sql = @"CREATE TABLE FlightsChosen ("
             "id integer primary key autoincrement not null,"
             "airport varchar(250) not null,"
             "iata varchar(250) not null,"
             "icao varchar(250) not null,"
             "location varchar(250) not null,"
             "travelType varchar(250) not null,"
             "currentFlight integer(1) not null,"
             "timestamp DATE DEFAULT CURRENT_TIMESTAMP"
             ");";
        _success = [_db executeUpdate:sql];
        if(!_success) {
            NSLog(@"%s: executeQuery failed: %@", __FUNCTION__, [_db lastErrorMessage]);
        }
    }
}

- (void)saveFlight:(id)flightObj {
    
    NSString *creationSql = @"INSERT INTO FlightsChosen("
    "airport,"
    "iata,"
    "icao,"
    "location,"
    "travelType,"
    "currentFlight"
    ") VALUES (%@, %@, %@, %@, %@, %@);";
    
    _success = [_db executeUpdateWithFormat:creationSql,
                   flightObj[@"airport"],
                   flightObj[@"iata"],
                   flightObj[@"icao"],
                   flightObj[@"locations"],
                   flightObj[@"travelType"],
                   flightObj[@"currentFlight"]
               ];
    
    if(!_success) {
        NSLog(@"%s: executeQuery failed: %@", __FUNCTION__, [_db lastErrorMessage]);
    }
}

- (void)clearAllFlights {
    NSString *sql = @"UPDATE FlightsChosen SET currentFlight = 0";
    _success = [_db executeUpdate:sql];
    if(!_success) {
        NSLog(@"%s: executeQuery failed: %@", __FUNCTION__, [_db lastErrorMessage]);
    }
}

- (NSMutableArray *)getFlightData {
    NSString *sql = @"SELECT * FROM FlightsChosen WHERE (currentFlight = 1 OR currentFlight = 2) "
                     "AND timestamp >= date('now') ORDER BY timestamp DESC LIMIT 2";
    
    FMResultSet *rs = [_db executeQuery:sql];
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    if(!rs) {
        NSLog(@"%s: executeQuery failed: %@", __FUNCTION__, [_db lastErrorMessage]);
    }
    
    while([rs next]) {
        NSDictionary *currencyData = @{
            @"id": [rs stringForColumn:@"id"],
            @"airport": [rs stringForColumn:@"airport"],
            @"iata": [rs stringForColumn:@"iata"],
            @"icao": [rs stringForColumn:@"icao"],
            @"location": [rs stringForColumn:@"location"],
            @"travelType": [rs stringForColumn:@"travelType"],
            @"currentFlight": [rs stringForColumn:@"currentFlight"],
            @"timestamp": [rs stringForColumn:@"timestamp"],
        };
        
        [results addObject: currencyData];
    }
    
    return results;
}

@end