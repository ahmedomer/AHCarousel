//
//  AHCarouselViewController.h
//  Carousel
//
//  Created by Ahmed Omer on 21/03/2013.
//
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface AHCarouselViewController : UIViewController <UIScrollViewDelegate>
{
    NSArray                 *_arrCarouselItems;
    
    IBOutlet UILabel        *_lblTitle;
    IBOutlet UIScrollView   *_scrollView;
    IBOutlet UIView         *_vCarousel;
}

- (id)initWithCarouselItems:(NSArray*)carouselItems;

@end
