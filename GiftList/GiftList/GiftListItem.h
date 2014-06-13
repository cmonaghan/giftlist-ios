//
//  GiftListItem.h
//  GiftList
//
//  Created by Gregory Lee on 6/12/14.
//  Copyright (c) 2014 Gregory Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GiftListItem : NSManagedObject

@property (nonatomic, retain) NSString * descriptionText;
@property (nonatomic, retain) NSNumber * itemId;
@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * title;

@end
