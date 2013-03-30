//
//  AHCarouselViewController.m
//  Carousel
//
//  Created by Ahmed Omer on 21/03/2013.
//
//

#import "AHCarouselViewController.h"
#import "AHCarouselItem.h"

@implementation AHCarouselViewController

- (id)initWithCarouselItems:(NSArray*)carouselItems
{
    self = [super initWithNibName:@"AHCarouselViewController"
                           bundle:nil];
    
    if (self)
    {
        _arrCarouselItems = [[NSArray alloc] initWithArray:carouselItems];
    }
    
    return self;
}

- (void)dealloc
{
    if (_arrCarouselItems)
    {
        [_arrCarouselItems release], _arrCarouselItems = nil;
    }
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int index = 0; index < [_arrCarouselItems count]; index++)
    {
        AHCarouselItem *item = [_arrCarouselItems objectAtIndex:index];
        
        CGFloat x =     (SIZE * index);
        CGFloat side =  (index == 0) ? SIZE : (SIZE * 0.68);
        
        item.frame =    CGRectMake(x, 0, side, side);
        item.center =   CGPointMake((x + (SIZE/2)), (SIZE/2));
        
        [_scrollView addSubview:item];
    }
    
    [_scrollView setFrame:CGRectMake(0, 0, SIZE, SIZE)];
    [_scrollView setContentSize:CGSizeMake(SIZE * [_arrCarouselItems count], SIZE)];
    [_scrollView setCenter:_vCarousel.center];
    [_scrollView setDelegate:self];
    
    [self setTitle];
}

- (void)setTitle
{
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if (page >= 0 && page < [_arrCarouselItems count])
    {
        AHCarouselItem *item = [_arrCarouselItems objectAtIndex:page];
        [_lblTitle setText:item.itemTitle];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for (int index = 0; index < [_arrCarouselItems count]; index++)
    {
        UIButton *button = [_arrCarouselItems objectAtIndex:index];
        
        if (scrollView.contentOffset.x > (SIZE * (index + 1)) ||
            scrollView.contentOffset.x < (SIZE * (index - 1)))
        {// if offset is before / after the page bounds of current button, skip and move to the next page
            
            continue;
        }
        
        // adjust size of buttons to the LEFT of UIScrollView
        
        if (scrollView.contentOffset.x > (index * SIZE))
        {
            CGRect frame = button.frame;
            
            frame.size.width = SIZE - ((scrollView.contentOffset.x - (index * SIZE)) * 0.32);
            frame.size.height = SIZE - ((scrollView.contentOffset.x - (index * SIZE)) * 0.32);
            
            button.frame = frame;
            button.center = CGPointMake(((SIZE * index) + (SIZE/2)), (SIZE/2));
            
            continue;
        }
        
        // adjust size of buttons to the RIGHT of UIScrollView
        
        if (scrollView.contentOffset.x < (index * SIZE))
        {
            CGRect frame = button.frame;
            
            frame.size.width = SIZE + ((scrollView.contentOffset.x - (index * SIZE)) * 0.32);
            frame.size.height = SIZE + ((scrollView.contentOffset.x - (index * SIZE)) * 0.32);
            
            button.frame = frame;
            button.center = CGPointMake(((SIZE * index) + (SIZE/2)), (SIZE/2));
        }
    }
    
    [self setTitle];
}

@end
