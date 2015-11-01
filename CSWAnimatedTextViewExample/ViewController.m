//
//  ViewController.m
//  CSWAnimatedTextView
//
//  Created by Christopher Worley on 10/29/15.
//  Copyright © 2015 Christopher Worley. All rights reserved.
//

#import "ViewController.h"

#define LOAD_FROM_OBJECT 1

@interface ViewController ()
{
	UIColor *firstColor;
	UIColor *secondColor;
	int colorNum;
}

@property (weak, nonatomic) IBOutlet UITextField *titleString;
@property (nonatomic, weak) IBOutlet UISlider *fontSizeSlider;
@property (nonatomic, weak) IBOutlet UISlider *durationSlider;
@property (nonatomic, weak) IBOutlet UISlider *startPointxSlider;
@property (nonatomic, weak) IBOutlet UISlider *startPointySlider;
@property (nonatomic, weak) IBOutlet UISlider *endPointxSlider;
@property (nonatomic, weak) IBOutlet UISlider *endPointySlider;
@property (nonatomic, weak) IBOutlet UILabel *fontSizeLabel;
@property (nonatomic, weak) IBOutlet UILabel *durationLabel;
@property (nonatomic, weak) IBOutlet UILabel *startPointxLabel;
@property (nonatomic, weak) IBOutlet UILabel *startPointyLabel;
@property (nonatomic, weak) IBOutlet UILabel *endPointxLabel;
@property (nonatomic, weak) IBOutlet UILabel *endPointyLabel;
@property (nonatomic, weak) IBOutlet UISwitch *bAutoReverse;
@property (nonatomic, strong) NSString *fontName;
@property (nonatomic, strong) CSWAnimatedTextObject *animatedTextObject;

@end

@implementation ViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	
	if ([segue.identifier isEqualToString:@"colorPickerSegue0"])
	{
		colorNum = 0;
		ColorViewController *vc = segue.destinationViewController;
		vc.delegate = self;
		
		[vc putInColor:firstColor];
	}
	else if ([segue.identifier isEqualToString:@"colorPickerSegue1"])
	{
		colorNum = 1;
		ColorViewController *vc = segue.destinationViewController;
		vc.delegate = self;
		
		[vc putInColor:secondColor];
	}
	else if ([segue.identifier isEqualToString:@"fontPickerSegue"])
	{
		FontViewController *vc = segue.destinationViewController;
		vc.delegate = self;
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_titleString.delegate = self;
	_innerColorButton.layer.cornerRadius = 6;
	_outerColorButton.layer.cornerRadius = 6;
	
	_animatedTextObject = [[CSWAnimatedTextObject alloc] init];
	
	if (LOAD_FROM_OBJECT) {
		[self setDisplayValuesFromAnimationObject];
	}
	else {
		[self setDefaultValuesFromViewController];
	}
}

- (void)setDefaultValuesFromViewController {
	
	NSInteger fontIndex = [[NSDate date] timeIntervalSince1970];
	
	_animatedTextObject.colorOuter = [UIColor blackColor];
	_animatedTextObject.colorInner = [UIColor lightGrayColor];
	_animatedTextObject.startPoint = CGPointMake(0.0, 0.5);
	_animatedTextObject.endPoint = CGPointMake(1.0, 0.5);
	_animatedTextObject.duration = 2.0;
	_animatedTextObject.fontSize = 38.0;
	_animatedTextObject.fontName = [FontViewController getFontFromIndex:fontIndex];
	_animatedTextObject.titleString = @"View Controller";
	_animatedTextObject.reverse = YES;
	
	[self setDisplayValues];
	
	[_textAnimate setAnimatedTextObject:_animatedTextObject];
}

- (void)setDisplayValuesFromAnimationObject {
	
	_animatedTextObject = _textAnimate.animatedTextObject;
	
	[self setDisplayValues];
}

- (void)setDisplayValues {
	_bAutoReverse.on = _animatedTextObject.reverse;
	
	firstColor = _animatedTextObject.colorOuter;
	secondColor = _animatedTextObject.colorInner;
	
	_innerColorButton.backgroundColor = firstColor;
	_outerColorButton.backgroundColor = secondColor;
	
	_titleString.text = _animatedTextObject.titleString;
	_fontName = _animatedTextObject.fontName;
	
	[self.fontSelectButton setTitle:_fontName forState:UIControlStateNormal];
	
	self.startPointxSlider.value = _animatedTextObject.startPoint.x;
	self.startPointySlider.value = _animatedTextObject.startPoint.y;
	
	self.endPointxSlider.value = _animatedTextObject.endPoint.x;
	self.endPointySlider.value = _animatedTextObject.endPoint.y;
	
	self.durationSlider.value = _animatedTextObject.duration;
	self.fontSizeSlider.value = _animatedTextObject.fontSize;
	
	self.startPointxLabel.text = [NSString stringWithFormat:@"%.2f", self.startPointxSlider.value];
	self.startPointyLabel.text = [NSString stringWithFormat:@"%.2f", self.startPointySlider.value];
	self.endPointxLabel.text = [NSString stringWithFormat:@"%.2f", self.endPointxSlider.value];
	self.endPointyLabel.text = [NSString stringWithFormat:@"%.2f", self.endPointySlider.value];
	self.durationLabel.text = [NSString stringWithFormat:@"%.2f", self.durationSlider.value];
	self.fontSizeLabel.text = [NSString stringWithFormat:@"%.1f", self.fontSizeSlider.value];
	
	_textAnimate.titleString = _animatedTextObject.titleString;
}

- (IBAction)updateTitle:(id)sender {
	
	_textAnimate.titleString = _titleString.text;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.view endEditing:YES];
}

- (IBAction)pointsChanged:(id)sender {
	[_titleString resignFirstResponder];
	CGPoint startPoint;
	CGPoint endPoint;
	
	startPoint.x = _startPointxSlider.value;
	startPoint.y = _startPointySlider.value;
	
	endPoint.x = _endPointxSlider.value;
	endPoint.y = _endPointySlider.value;
	
	self.startPointxLabel.text = [NSString stringWithFormat:@"%.2f", self.startPointxSlider.value];
	self.startPointyLabel.text = [NSString stringWithFormat:@"%.2f", self.startPointySlider.value];
	self.endPointxLabel.text = [NSString stringWithFormat:@"%.2f", self.endPointxSlider.value];
	self.endPointyLabel.text = [NSString stringWithFormat:@"%.2f", self.endPointySlider.value];
	
	_textAnimate.startPoint = startPoint;
	_textAnimate.endPoint = endPoint;
}

- (IBAction)autoReverse:(id)sender {
	[_titleString resignFirstResponder];
	_textAnimate.reverse = _bAutoReverse.on;
}

- (IBAction)durationChanged:(UISlider *)sender {
	[_titleString resignFirstResponder];
	_textAnimate.duration = self.durationSlider.value;
	self.durationLabel.text = [NSString stringWithFormat:@"%.2f", self.durationSlider.value];
}

- (IBAction)fontSizeChanged:(UISlider *)sender {
	[_titleString resignFirstResponder];
	_textAnimate.fontSize = self.fontSizeSlider.value;
	self.fontSizeLabel.text = [NSString stringWithFormat:@"%.1f", self.fontSizeSlider.value];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark ColorPickerDelegate

- (void)selectedColor:(UIColor *)color {
	
	if (!colorNum) {
		firstColor = color;
		_innerColorButton.backgroundColor = firstColor;
		_textAnimate.colorOuter = firstColor;
		_animatedTextObject.colorOuter = firstColor;
	} else {
		secondColor = color;
		_outerColorButton.backgroundColor = secondColor;
		_textAnimate.colorInner = secondColor;
		_animatedTextObject.colorInner = secondColor;
	}
}

#pragma mark FontPickerDelegate

- (void)selectedFont:(NSString *)fontName {
	_fontName = fontName;
	_animatedTextObject.fontName = _fontName;
	
	_textAnimate.fontName = fontName;
	[self.fontSelectButton setTitle:_fontName forState:UIControlStateNormal];
}

@end
