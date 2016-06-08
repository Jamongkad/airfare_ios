//
//  Common.h
//  Promo Pod
//
//  Created by Mathew Wong on 15/10/2015.
//  Copyright © 2015 YidgetSoft. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define API_URL @"http://promopod.gearfish.com/"
#define DEVICEUUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define TIGERAIR @"http://www.tigerair.com/ph/en"
#define CEBUPAC @"http://www.cebupacificair.com"
#define JETSTAR @"http://www.jetstar.com/ph/en/home"
#define AIRASIA @"http://www.airasia.com/ph/en/home.page?cid=1"
#define FLIGHT_FETCH_MSG @"Fetching Flights..."
#define generousTipID @"GenerousTip"
#define massiveTipID @"MassiveTip"


#endif /* Common_h */
