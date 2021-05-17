#import "postObject.h"

@implementation postObject

- (IBAction)postAction:(id)sender
{
    NSDistributedNotificationCenter *myCenter = [NSDistributedNotificationCenter defaultCenter];
    [myCenter postNotificationName:@"DDDMessage" object:nil];
}

@end
