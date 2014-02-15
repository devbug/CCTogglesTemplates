#import "CCTogglesAgent.h"
#import <UIKit/UIKit.h>


static BOOL toggleValue		= NO;


@interface SpringBoard : UIApplication
- (void)reboot;
- (void)_rebootNow;
@end


@interface RebootCCToggle : NSObject <CCTogglesDataSource>
@end

@implementation RebootCCToggle

- (CCToggleState)getState {
	return (CCToggleState)toggleValue;
}

- (void)setState:(BOOL)newState {
	NSBundle *selfBundle = [NSBundle bundleForClass:[RebootCCToggle class]];
	
	[[%c(CCTogglesAgent) sharedInstance] updateStatusText:NSLocalizedStringWithDefaultValue(@"WAIT_MSG", @"Toggle", selfBundle, @"Waiting to confirm Rebooting...", @"Waiting to confirm Rebooting...")
														 forIdentifier:selfBundle.bundleIdentifier];
	
	if (newState == NO && toggleValue == YES) {
		toggleValue = newState;
		
		[(SpringBoard *)[UIApplication sharedApplication] reboot];
	}
	else {
		toggleValue = newState;
		
		dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
		dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC));
		dispatch_after(time, globalQueue, ^(void){
			toggleValue = !toggleValue;
			
			[[%c(CCTogglesAgent) sharedInstance] updateStatusText:NSLocalizedStringWithDefaultValue(@"CANCEL_MSG", @"Toggle", selfBundle, @"Rebooting Cancelled...", @"Rebooting Cancelled...")
																 forIdentifier:selfBundle.bundleIdentifier];
			
			[[%c(CCTogglesAgent) sharedInstance] updateToggleStatusForIdentifier:selfBundle.bundleIdentifier];
		});
	}
}

@end

