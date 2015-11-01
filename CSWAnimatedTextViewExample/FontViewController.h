//
//  FontViewController.h
//  CSWAnimatedTextView
//
//  Created by Christopher Worley on 10/30/15.
//  Copyright © 2015 Christopher Worley. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol FontPickerDelegate <NSObject>

- (void)selectedFont:(NSString *)fontName;

@end


@interface FontViewController : UITableViewController

@property (nonatomic, assign) id<FontPickerDelegate> delegate;

+ (NSString *)getFontFromIndex:(NSInteger)index;

@end
