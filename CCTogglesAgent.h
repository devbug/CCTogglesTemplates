#import <Foundation/Foundation.h>


typedef enum {
	CCToggleStateDisabled = -1,
	CCToggleStateOff = 0,
	CCToggleStateOn = 1
} CCToggleState;


@protocol CCTogglesDataSource <NSObject>
@required
- (CCToggleState)getState;
- (void)setState:(BOOL)newState;

@optional
- (UIImage *)glyphImage;
- (UIImage *)selectedGlyphImage;
- (void)toggleLongPressed;
- (void)toggleDoubleTapped;
@end

@interface CCTogglesAgent : NSObject
+ (CCTogglesAgent *)sharedInstance;
- (void)updateToggleStatusForIdentifier:(NSString *)identifier;
- (void)updateStatusText:(NSString *)text forIdentifier:(NSString *)identifier;
@end
