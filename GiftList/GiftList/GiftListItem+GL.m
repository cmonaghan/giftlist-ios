//
//  GiftListItem+GL.m
//  GiftList
//
//  Created by Gregory Lee on 6/12/14.
//  Copyright (c) 2014 Gregory Lee. All rights reserved.
//

#import "GiftListItem+GL.h"

@implementation GiftListItem (GL)

+ (GiftListItem *) itemWithId:(NSString *) itemId usingManagedContext:(NSManagedObjectContext *) context {
    GiftListItem * g = nil;
    
    //Make sure gage doesn't exist in context
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"GiftListItem"];
    request.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"itemId" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"itemId = %@", itemId];
    
    NSArray * matches = [context executeFetchRequest:request error:nil];
    //Make sure that there's only 1
    if(!matches || [matches count] > 1) {
        //Error
        NSLog(@"In %@ %@, error finding item %@",NSStringFromClass([self class]), NSStringFromSelector(_cmd), matches);
    } else if ([matches count] == 1) {
        g = [matches lastObject];
    } else {
        g = [NSEntityDescription insertNewObjectForEntityForName:@"GiftListItem" inManagedObjectContext:context];
        g.itemId = itemId;
    }
    
    return g;
}

@end
