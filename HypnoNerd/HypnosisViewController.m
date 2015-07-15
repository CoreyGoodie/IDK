//
//  HypnosisViewController.m
//  
//
//  Created by Corey Goodermote on 7/14/15.
//
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (void)loadView
{
    //Create a view
    HypnosisView *backgroundView = [[HypnosisView alloc] init];
    //Set it as *the* view of the controller
    self.view = backgroundView; 
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    
    return self;
}

@end
