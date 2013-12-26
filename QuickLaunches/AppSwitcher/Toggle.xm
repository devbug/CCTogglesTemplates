#import "CCTogglesAgent.h"


@interface SBUIController : NSObject
+ (id)sharedInstance;
- (BOOL)isAppSwitcherShowing;
- (void)_toggleSwitcher;
@end


@interface AppSwitcherCCToggle : NSObject <CCTogglesDataSource>
@end

@implementation AppSwitcherCCToggle

- (CCToggleState)getState {
	return (CCToggleState)[(SBUIController *)[%c(SBUIController) sharedInstance] isAppSwitcherShowing];
}

- (void)setState:(BOOL)newState {
	[(SBUIController *)[%c(SBUIController) sharedInstance] _toggleSwitcher];
}

@end

