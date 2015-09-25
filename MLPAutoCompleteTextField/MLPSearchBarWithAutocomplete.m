//
//  MLPSearchBarWithAutocomplete.m
//  Pods
//
//  Created by Andy Geers on 25/09/2015.
//
//

#import "MLPSearchBarWithAutocomplete.h"
#import "MLPAutoCompleteTextFieldManager.h"

@implementation MLPSearchBarWithAutocomplete

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[self.gestureRecognizers firstObject] setCancelsTouchesInView:NO];
    }
    return self;
}

- (UITextField*)textField {
    for (UIView* subView in self.subviews) {
        for (UIView* ndLeveSubView in subView.subviews) {
            if ([ndLeveSubView isKindOfClass:[UITextField class]]) {
                return (UITextField *)ndLeveSubView;
            }
        }
    }
    return nil;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // We override this method so that taps outside of the search bar's view can be handled - i.e. taps on the autocomplete results table
    UIView* hit = [super hitTest:point withEvent:event];
    if (hit != nil) {
        // Give priority to the search bar itself
        NSLog(@"Super hit");
        return hit;
    }
    
    // If they didn't tap the search bar, did they tap the autocomplete table?
    if ((self.autocompleter.autoCompleteTableView) && (self.autocompleter.autoCompleteTableView.superview) && (!self.autocompleter.autoCompleteTableView.hidden)) {
        // Convert the point to the target view's coordinate system.
        // The target view isn't necessarily the immediate subview
        CGPoint pointForTargetView = [self.autocompleter.autoCompleteTableView convertPoint:point fromView:self];
        
        if (CGRectContainsPoint(self.autocompleter.autoCompleteTableView.bounds, pointForTargetView)) {
            
            // The target view may have its view hierarchy,
            // so call its hitTest method to return the right hit-test view
            return [self.autocompleter.autoCompleteTableView hitTest:pointForTargetView withEvent:event];
        }
    }
    
    return nil;
}

@end
