//
//  GiftListItem+GL.h
//  GiftList
//
//  Created by Gregory Lee on 6/12/14.
//  Copyright (c) 2014 Gregory Lee. All rights reserved.
//

#import "GiftListItem.h"
#import <Parse/Parse.h>

@interface GiftListItem (GL)
+ (GiftListItem *) itemWithId:(NSString *) itemId usingManagedContext:(NSManagedObjectContext *) context;
+ (GiftListItem *) itemFromPF:(PFObject *) pfObject withContext:(NSManagedObjectContext *) context;
@end
