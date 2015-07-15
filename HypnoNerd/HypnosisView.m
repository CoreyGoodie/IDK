//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Corey Goodermote on 7/5/15.
//  Copyright (c) 2015 Corey Goodermote. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()

@property (strong, nonatomic) UIColor *circleColor;


@end

@implementation HypnosisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    //Figure out center of bounds
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    //The circle will be as big as it fits in the view
    //float radius = (MIN(bounds.size.width, bounds.size.height)/2.0);
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius-=20){
        [path moveToPoint:CGPointMake(center.x+currentRadius,center.y)];
         [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0 endAngle:M_PI*2.0
                     clockwise:YES];
  
    }
    
    
    path.lineWidth = 10;
    //Set stroke of circle with circleColor
    [self.circleColor setStroke];

    [path stroke];
    
    UIImage *unscaledlogo = [UIImage imageNamed:@"dickbutt.png"];
    UIImage *logo = [UIImage imageWithCGImage:[unscaledlogo CGImage]
                        scale:(unscaledlogo.scale * 5.0)
                  orientation:(unscaledlogo.imageOrientation)];
    
    CGRect imageFrame = CGRectMake(center.x - (logo.size.width / 2.0),
                                   center.y - (logo.size.height / 2.0),
                                   logo.size.width,
                                   logo.size.height);
    //[logo drawInRect:imageFrame];
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //All views start with clear color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor grayColor]; //set circlecolor
    }
    return self;
}

//When a user touches the screen change color
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched", self);
    //Get three rando numbers between 0 and 1
    float red = (arc4random()%100)/100.0;
    float green = (arc4random()%100)/100.0;
    float blue = (arc4random()%100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
    
}

- (void)setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
