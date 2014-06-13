//
//  GLFirstViewController.m
//  GiftList
//
//  Created by Gregory Lee on 6/12/14.
//  Copyright (c) 2014 Gregory Lee. All rights reserved.
//

#import "GLBrowseVC.h"
#import "GiftListItem+GL.h"
#import "GLAppDelegate.h"

#define DEFAULT_PRICE @"$29.92"
#define DEFAULT_IMAGE_URL = @"http://ecx.images-amazon.com/images/I/41juCzD8qWL.jpg"
#define DEFAULT_DESCRIPTION @"Perfectly prepares 2 to 8 cups of cooked rice. Steams meat and vegetables while rice cooks below.  Easy-to-use digital controls with white rice, brown rice, steam and warm functions.  Programmable 15-hour delay timer for flexible meal planning.  Great for soups, stews, chili and more"

@interface GLBrowseVC ()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (nonatomic) NSUInteger counter;
@property (strong, nonatomic) GiftListItem *currentItem;

@end

@implementation GLBrowseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.counter = 0;
    
    [self nextItem];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext *) managedObjectContext {
    if(!_managedObjectContext) {
        _managedObjectContext = [(GLAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    }
    return _managedObjectContext;
}

- (IBAction)yesButton:(id)sender {
    [self nextItem];
}

- (IBAction)noButton:(id)sender {
    [self.managedObjectContext deleteObject:self.currentItem];
    [self.managedObjectContext save:nil];
    [self nextItem];
}

- (void) setPrice:(NSNumber *) price {
    if (price) {
        self.priceLabel.text = [NSString stringWithFormat:@"$%@", price];
    } else {
        self.priceLabel.text = DEFAULT_PRICE;
    }
}

- (void) setImage:(NSString *) imageURL {
    NSURL *url;
    if (! imageURL) {
        url = [NSURL URLWithString: @"http://ecx.images-amazon.com/images/I/41juCzD8qWL.jpg"];
    } else {
        url = [NSURL URLWithString: imageURL];
    }
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc] initWithData:data];
    self.imageView.image = image;
}

- (void) setDescription:(NSString *) description {
    if (description) {
        self.descriptionText.text = description;
    } else {
        self.descriptionText.text = DEFAULT_DESCRIPTION;
    }
}

- (void) nextItem {
    PFQuery *query = [PFQuery queryWithClassName:@"Items"];
    query.skip = self.counter;
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *item, NSError *error) {
        NSLog(@"%@", item);
        self.currentItem = [self itemFromPF:item];
        [self.managedObjectContext save:nil];
        self.counter++;
        
        [self display:self.currentItem];
    }];
}

- (GiftListItem *) itemFromPF:(PFObject *) pfObject {
    GiftListItem* item = [GiftListItem itemWithId:pfObject.objectId usingManagedContext:self.managedObjectContext];
    NSNumber * thisPrice = pfObject[@"price"];
    if(thisPrice == (id)[NSNull null]) {
        thisPrice = 0;
    }
    item.price = thisPrice;
    item.title = pfObject[@"title"];
    item.imageUrl = pfObject[@"productImage"];
    item.descriptionText = pfObject[@"title"];
    return item;
}

- (void) display:(GiftListItem *) item {
    [self setPrice:item.price];
    [self setImage:item.imageUrl];
    [self setDescription:item.descriptionText];
}
@end
