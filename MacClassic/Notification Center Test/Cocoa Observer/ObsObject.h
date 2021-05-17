/* ObsObject */

#import <Cocoa/Cocoa.h>

@interface ObsObject : NSObject
{
    IBOutlet id myOutlet;
    
}
- (IBAction)buttonPush:(id)sender;
- (void)receivedMessage:(id)sender;
@end
