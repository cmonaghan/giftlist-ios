//
//  GLFirstViewController.m
//  GiftList
//
//  Created by Gregory Lee on 6/12/14.
//  Copyright (c) 2014 Gregory Lee. All rights reserved.
//

#import "GLBrowseVC.h"

#define DEFAULT_PRICE @"$29.92"
#define DEFAULT_IMAGE_URL = @"http://ecx.images-amazon.com/images/I/41juCzD8qWL.jpg"
#define DEFAULT_DESCRIPTION @"Perfectly prepares 2 to 8 cups of cooked rice. Steams meat and vegetables while rice cooks below.  Easy-to-use digital controls with white rice, brown rice, steam and warm functions.  Programmable 15-hour delay timer for flexible meal planning.  Great for soups, stews, chili and more"

@interface GLBrowseVC ()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;

@end

@implementation GLBrowseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setPrice:nil];
    [self setImage:nil];
    [self setDescription:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)yesButton:(id)sender {
}

- (IBAction)noButton:(id)sender {
}

- (void) setPrice:(NSString *) price {
    if (price) {
        self.priceLabel.text = price;
    } else {
        self.priceLabel.text = DEFAULT_PRICE;
    }
}

- (void) setImage:(UIImage *) image {
    if (! image) {
        NSURL *url = [NSURL URLWithString: @"http://ecx.images-amazon.com/images/I/41juCzD8qWL.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        image = [[UIImage alloc] initWithData:data];
    }
    self.imageView.image = image;
}

- (void) setDescription:(NSString *) description {
    if (description) {
        self.descriptionText.text = description;
    } else {
        self.descriptionText.text = DEFAULT_DESCRIPTION;
    }
    
}
@end
