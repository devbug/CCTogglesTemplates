#import <stdlib.h>
#import "CCTogglesAgent.h"


@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
@end


static BOOL toggleValue		= NO;


void exit_handler(void) {
	system("killall -9 backboardd");
}


@interface RespringCCToggle : NSObject <CCTogglesDataSource>
@end

@implementation RespringCCToggle

- (CCToggleState)getState {
	return (CCToggleState)toggleValue;
}

- (void)setState:(BOOL)newState {
	NSBundle *selfBundle = [NSBundle bundleForClass:[RespringCCToggle class]];
	
	[[%c(CCTogglesAgent) sharedInstance] updateStatusText:NSLocalizedStringWithDefaultValue(@"WAIT_MSG", @"Toggle", selfBundle, @"Waiting to confirm Respring...", @"Waiting to confirm Respring...")
														 forIdentifier:selfBundle.bundleIdentifier];
	
	if (newState == NO && toggleValue == YES) {
		toggleValue = newState;
		
		atexit(exit_handler);
		
		SpringBoard *sb = (SpringBoard *)[UIApplication sharedApplication];
		[sb _relaunchSpringBoardNow];
	}
	else {
		toggleValue = newState;
		
		dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
		dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC));
		dispatch_after(time, globalQueue, ^(void){
			toggleValue = !toggleValue;
			
			[[%c(CCTogglesAgent) sharedInstance] updateStatusText:NSLocalizedStringWithDefaultValue(@"CANCEL_MSG", @"Toggle", selfBundle, @"Respring Cancelled...", @"Respring Cancelled...")
																 forIdentifier:selfBundle.bundleIdentifier];
			
			[[%c(CCTogglesAgent) sharedInstance] updateToggleStatusForIdentifier:selfBundle.bundleIdentifier];
		});
	}
}

@end


