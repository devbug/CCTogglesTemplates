#import "CCTogglesAgent.h"


@interface @@PROJECTNAME@@CCToggle : NSObject <CCTogglesDataSource>
@end

@implementation @@PROJECTNAME@@CCToggle

- (CCToggleState)getState {
	return CCToggleStateOff;
}

- (void)setState:(BOOL)newState {
	// do something
}

@end

