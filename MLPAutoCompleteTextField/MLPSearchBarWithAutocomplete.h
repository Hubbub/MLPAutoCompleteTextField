//
//  MLPSearchBarWithAutocomplete.h
//  Pods
//
//  Created by Andy Geers on 25/09/2015.
//
//

#import <UIKit/UIKit.h>

@class MLPAutoCompleteTextFieldManager;

@interface MLPSearchBarWithAutocomplete : UISearchBar

@property (nonatomic, weak, readonly) UITextField* textField;
@property (nonatomic, strong) MLPAutoCompleteTextFieldManager* autocompleter;

@end
