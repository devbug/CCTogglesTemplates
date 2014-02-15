#import "CCTogglesAgent.h"



@interface SBPrototypeController : NSObject
+ (id)sharedInstance;
+ (void)reloadDefaults;
- (void)_hideSettings;
- (void)_showSettings;
- (void)showOrHide;
@end


@interface InternalSettingsCCToggle : NSObject <CCTogglesDataSource>
@end

@implementation InternalSettingsCCToggle

- (CCToggleState)getState {
	return CCToggleStateOff;
}

- (void)setState:(BOOL)newState {
	[(SBPrototypeController *)[%c(SBPrototypeController) sharedInstance] showOrHide];
}

@end

