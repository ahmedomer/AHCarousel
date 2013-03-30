//
//  AHAppDelegate.m
//  Carousel
//
//  Created by Ahmed Omer on 21/03/2013.
//
//

#import "AHAppDelegate.h"
#import "AHCarouselItem.h"
#import "AHCarouselViewController.h"

@implementation AHAppDelegate

- (NSArray*)carouselItems
{
    return [NSArray arrayWithObjects:
            
            [AHCarouselItem itemWithTitle:@"Basketball"
                                    image:[UIImage imageNamed:@"btn-basketball.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Black Cat"
                                    image:[UIImage imageNamed:@"btn-black-cat.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Bluetooth"
                                    image:[UIImage imageNamed:@"btn-bluetooth.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Compass"
                                    image:[UIImage imageNamed:@"btn-compass.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Flag"
                                    image:[UIImage imageNamed:@"btn-flag.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Glasses"
                                    image:[UIImage imageNamed:@"btn-glasses.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Seat"
                                    image:[UIImage imageNamed:@"btn-seat.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Truck"
                                    image:[UIImage imageNamed:@"btn-truck.png"]
                                   target:nil
                                   action:nil],
            nil];
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    AHCarouselViewController *oAHCarouselViewController = [[AHCarouselViewController alloc] initWithCarouselItems:[self carouselItems]];
    
    [self.window setRootViewController:oAHCarouselViewController];
    
    [oAHCarouselViewController release];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
