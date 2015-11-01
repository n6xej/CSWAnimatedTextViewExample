//
//  ViewController.h
//  CSWAnimatedTextView
//
//  Created by Christopher Worley on 10/29/15.
//  Copyright © 2015 Christopher Worley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSWAnimatedTextView.h"
#import "ColorViewController.h"
#import "FontViewController.h"


@interface ViewController : UIViewController <UITextFieldDelegate, ColorPickerDelegate, FontPickerDelegate>

@property (weak, nonatomic) IBOutlet CSWAnimatedTextView *textAnimate;
@property (weak, nonatomic) IBOutlet UIButton *innerColorButton;
@property (weak, nonatomic) IBOutlet UIButton *outerColorButton;
@property (weak, nonatomic) IBOutlet UIButton *fontSelectButton;

@end

