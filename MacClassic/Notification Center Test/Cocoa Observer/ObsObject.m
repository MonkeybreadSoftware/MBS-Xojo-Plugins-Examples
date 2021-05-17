#import "ObsObject.h"

@implementation ObsObject

-(void)awakeFromNib
{
    NSDistributedNotificationCenter *myCenter = [NSDistributedNotificationCenter defaultCenter];
    [myCenter addObserver:self selector:@selector(receivedMessage:) name:@"DDDMessage" object:nil];
    [myOutlet setString:@"Waiting for Message"];
}

- (void)receivedMessage:(id)sender
{
    NSCalendarDate *nowDate = [NSCalendarDate calendarDate];
    [nowDate setCalendarFormat:@"%m/%d/%Y %H:%M:%S"];
    [myOutlet setString:[NSString stringWithFormat:@"Received Message - %@",nowDate]];
}

- (IBAction)buttonPush:(id)sender
{
    [myOutlet setString:@"Test"];
}

@end
