//
//  GiftListItem+GL.h
//  GiftList
//
//  Created by Gregory Lee on 6/12/14.
//  Copyright (c) 2014 Gregory Lee. All rights reserved.
//

#import "GiftListItem.h"

@interface GiftListItem (GL)
+ (GiftListItem *) itemWithId:(NSUInteger) itemId usingManagedContext:(NSManagedObjectContext *) context;
@end
