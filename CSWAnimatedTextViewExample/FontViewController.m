//
//  FontViewController.m
//  CSWAnimatedTextView
//
//  Created by Christopher Worley on 10/30/15.
//  Copyright © 2015 Christopher Worley. All rights reserved.
//

#import "FontViewController.h"

@interface FontViewController ()
{
	NSArray *fontsArray;
	NSString *local_file;
}

@end

@implementation FontViewController


- (void)viewDidLoad {
    [super viewDidLoad];

	self.tableView.rowHeight = 44.0;
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self loadFontNames];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [fontsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
	
	cell.textLabel.text = [fontsArray objectAtIndex:[indexPath row]];
	cell.textLabel.font = [UIFont fontWithName:cell.textLabel.text size:18.0];
	cell.textLabel.textColor = [UIColor blackColor];
	cell.backgroundColor = [UIColor whiteColor];
	
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];

	local_file = cell.textLabel.text;
	
	UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:nil
													  message:@"Use selected Font?"
													 delegate:self
											cancelButtonTitle:@"No"
											otherButtonTitles:@"Yes", nil] ;
	alertView.tag = 11;
	[alertView show];
	
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if( alertView.tag == 11 && buttonIndex == 1 )
	{
		[self.delegate selectedFont:local_file];
		
		
	}
	[self dismissViewControllerAnimated:NO completion:nil];
}

- (void)loadFontNames {
	fontsArray = @[ @"AcademyEngravedLetPlain",
							 @"AlNile-Bold",
							 @"AlNile",
							 @"AmericanTypewriter",
							 @"AmericanTypewriter-Bold",
							 @"AmericanTypewriter-Condensed",
							 @"AmericanTypewriter-CondensedBold",
							 @"AmericanTypewriter-CondensedLight",
							 @"AmericanTypewriter-Light",
							 @"AppleColorEmoji",
							 @"AppleSDGothicNeo-Thin",
							 @"AppleSDGothicNeo-Light",
							 @"AppleSDGothicNeo-Regular",
							 @"AppleSDGothicNeo-Medium",
							 @"AppleSDGothicNeo-SemiBold",
							 @"AppleSDGothicNeo-Bold",
							 @"AppleSDGothicNeo-Medium",
							 @"ArialMT",
							 @"Arial-BoldItalicMT",
							 @"Arial-BoldMT",
							 @"Arial-ItalicMT",
							 @"ArialHebrew",
							 @"ArialHebrew-Bold",
							 @"ArialHebrew-Light",
							 @"ArialRoundedMTBold",
							 @"Avenir-Black",
							 @"Avenir-BlackOblique",
							 @"Avenir-Book",
							 @"Avenir-BookOblique",
							 @"Avenir-Heavy",
							 @"Avenir-HeavyOblique",
							 @"Avenir-Light",
							 @"Avenir-LightOblique",
							 @"Avenir-Medium",
							 @"Avenir-MediumOblique",
							 @"Avenir-Oblique",
							 @"Avenir-Roman",
							 @"AvenirNext-Bold",
							 @"AvenirNext-BoldItalic",
							 @"AvenirNext-DemiBold",
							 @"AvenirNext-DemiBoldItalic",
							 @"AvenirNext-Heavy",
							 @"AvenirNext-HeavyItalic",
							 @"AvenirNext-Italic",
							 @"AvenirNext-Medium",
							 @"AvenirNext-MediumItalic",
							 @"AvenirNext-Regular",
							 @"AvenirNext-UltraLight",
							 @"AvenirNext-UltraLightItalic",
							 @"AvenirNextCondensed-Bold",
							 @"AvenirNextCondensed-BoldItalic",
							 @"AvenirNextCondensed-DemiBold",
							 @"AvenirNextCondensed-DemiBoldItalic",
							 @"AvenirNextCondensed-Heavy",
							 @"AvenirNextCondensed-HeavyItalic",
							 @"AvenirNextCondensed-Italic",
							 @"AvenirNextCondensed-Medium",
							 @"AvenirNextCondensed-MediumItalic",
							 @"AvenirNextCondensed-Regular",
							 @"AvenirNextCondensed-UltraLight",
							 @"AvenirNextCondensed-UltraLightItalic",
							 @"BanglaSangamMN",
							 @"BanglaSangamMN-Bold",
							 @"Baskerville",
							 @"Baskerville-Bold",
							 @"Baskerville-BoldItalic",
							 @"Baskerville-Italic",
							 @"Baskerville-SemiBold",
							 @"Baskerville-SemiBoldItalic",
							 @"BodoniOrnamentsITCTT",
							 @"BodoniSvtyTwoITCTT-Bold",
							 @"BodoniSvtyTwoITCTT-Book",
							 @"BodoniSvtyTwoITCTT-BookIta",
							 @"BodoniSvtyTwoOSITCTT-Bold",
							 @"BodoniSvtyTwoOSITCTT-Book",
							 @"BodoniSvtyTwoOSITCTT-BookIt",
							 @"BodoniSvtyTwoSCITCTT-Book",
							 @"BradleyHandITCTT-Bold",
							 @"ChalkboardSE-Bold",
							 @"ChalkboardSE-Light",
							 @"ChalkboardSE-Regular",
							 @"Chalkduster",
							 @"Cochin",
							 @"Cochin-Bold",
							 @"Cochin-BoldItalic",
							 @"Cochin-Italic",
							 @"Copperplate",
							 @"Copperplate-Bold",
							 @"Copperplate-Light",
							 @"Courier",
							 @"Courier-Bold",
							 @"Courier-BoldOblique",
							 @"Courier-Oblique",
							 @"CourierNewPS-BoldItalicMT",
							 @"CourierNewPS-BoldMT",
							 @"CourierNewPS-ItalicMT",
							 @"CourierNewPSMT",
							 @"DBLCDTempBlack",
							 @"DINAlternate-Bold",
							 @"DINCondensed-Bold",
							 @"DamascusBold",
							 @"Damascus",
							 @"DamascusLight",
							 @"DamascusMedium",
							 @"DamascusSemiBold",
							 @"DevanagariSangamMN",
							 @"DevanagariSangamMN-Bold",
							 @"Didot",
							 @"Didot-Bold",
							 @"Didot-Italic",
							 @"DiwanMishafi",
							 @"EuphemiaUCAS",
							 @"EuphemiaUCAS-Bold",
							 @"EuphemiaUCAS-Italic",
							 @"Farah",
							 @"Futura-CondensedExtraBold",
							 @"Futura-CondensedMedium",
							 @"Futura-Medium",
							 @"Futura-MediumItalic",
							 @"GeezaPro",
							 @"GeezaPro-Bold",
							 @"Georgia",
							 @"Georgia-Bold",
							 @"Georgia-BoldItalic",
							 @"Georgia-Italic",
							 @"GillSans",
							 @"GillSans-Bold",
							 @"GillSans-BoldItalic",
							 @"GillSans-Italic",
							 @"GillSans-Light",
							 @"GillSans-LightItalic",
							 @"GujaratiSangamMN",
							 @"GujaratiSangamMN-Bold",
							 @"GurmukhiMN",
							 @"GurmukhiMN-Bold",
							 @"STHeitiSC-Light",
							 @"STHeitiSC-Medium",
							 @"STHeitiTC-Light",
							 @"STHeitiTC-Medium",
							 @"Helvetica",
							 @"Helvetica-Bold",
							 @"Helvetica-BoldOblique",
							 @"Helvetica-Light",
							 @"Helvetica-LightOblique",
							 @"Helvetica-Oblique",
							 @"HelveticaNeue",
							 @"HelveticaNeue-Bold",
							 @"HelveticaNeue-BoldItalic",
							 @"HelveticaNeue-CondensedBlack",
							 @"HelveticaNeue-CondensedBold",
							 @"HelveticaNeue-Italic",
							 @"HelveticaNeue-Light",
							 @"HelveticaNeue-LightItalic",
							 @"HelveticaNeue-Medium",
							 @"HelveticaNeue-MediumItalic",
							 @"HelveticaNeue-UltraLight",
							 @"HelveticaNeue-UltraLightItalic",
							 @"HelveticaNeue-Thin",
							 @"HelveticaNeue-ThinItalic",
							 @"HiraKakuProN-W3",
							 @"HiraKakuProN-W6",
							 @"HiraMinProN-W3",
							 @"HiraMinProN-W6",
							 @"HoeflerText-Black",
							 @"HoeflerText-BlackItalic",
							 @"HoeflerText-Italic",
							 @"HoeflerText-Regular",
							 @"IowanOldStyle-Bold",
							 @"IowanOldStyle-BoldItalic",
							 @"IowanOldStyle-Italic",
							 @"IowanOldStyle-Roman",
							 @"Kailasa",
							 @"Kailasa-Bold",
							 @"KannadaSangamMN",
							 @"KannadaSangamMN-Bold",
							 @"KhmerSangamMN",
							 @"KohinoorDevanagari-Book",
							 @"KohinoorDevanagari-Light",
							 @"KohinoorDevanagari-Medium",
							 @"LaoSangamMN",
							 @"MalayalamSangamMN",
							 @"MalayalamSangamMN-Bold",
							 @"Marion-Bold",
							 @"Marion-Italic",
							 @"Marion-Regular",
							 @"Menlo-BoldItalic",
							 @"Menlo-Regular",
							 @"Menlo-Bold",
							 @"Menlo-Italic",
							 @"MarkerFelt-Thin",
							 @"MarkerFelt-Wide",
							 @"Noteworthy-Bold",
							 @"Noteworthy-Light",
							 @"Optima-Bold",
							 @"Optima-BoldItalic",
							 @"Optima-ExtraBlack",
							 @"Optima-Italic",
							 @"Optima-Regular",
							 @"OriyaSangamMN",
							 @"OriyaSangamMN-Bold",
							 @"Palatino-Bold",
							 @"Palatino-BoldItalic",
							 @"Palatino-Italic",
							 @"Palatino-Roman",
							 @"Papyrus",
							 @"Papyrus-Condensed",
							 @"PartyLetPlain",
							 @"SanFranciscoDisplay-Black",
							 @"SanFranciscoDisplay-Bold",
							 @"SanFranciscoDisplay-Heavy",
							 @"SanFranciscoDisplay-Light",
							 @"SanFranciscoDisplay-Medium",
							 @"SanFranciscoDisplay-Regular",
							 @"SanFranciscoDisplay-Semibold",
							 @"SanFranciscoDisplay-Thin",
							 @"SanFranciscoDisplay-Ultralight",
							 @"SanFranciscoRounded-Black",
							 @"SanFranciscoRounded-Bold",
							 @"SanFranciscoRounded-Heavy",
							 @"SanFranciscoRounded-Light",
							 @"SanFranciscoRounded-Medium",
							 @"SanFranciscoRounded-Regular",
							 @"SanFranciscoRounded-Semibold",
							 @"SanFranciscoRounded-Thin",
							 @"SanFranciscoRounded-Ultralight",
							 @"SanFranciscoText-Bold",
							 @"SanFranciscoText-BoldG1",
							 @"SanFranciscoText-BoldG2",
							 @"SanFranciscoText-BoldG3",
							 @"SanFranciscoText-BoldItalic",
							 @"SanFranciscoText-BoldItalicG1",
							 @"SanFranciscoText-BoldItalicG2",
							 @"SanFranciscoText-BoldItalicG3",
							 @"SanFranciscoText-Heavy",
							 @"SanFranciscoText-HeavyItalic",
							 @"SanFranciscoText-Light",
							 @"SanFranciscoText-LightItalic",
							 @"SanFranciscoText-Medium",
							 @"SanFranciscoText-MediumItalic",
							 @"SanFranciscoText-Regular",
							 @"SanFranciscoText-RegularG1",
							 @"SanFranciscoText-RegularG2",
							 @"SanFranciscoText-RegularG3",
							 @"SanFranciscoText-RegularItalic",
							 @"SanFranciscoText-RegularItalicG1",
							 @"SanFranciscoText-RegularItalicG2",
							 @"SanFranciscoText-RegularItalicG3",
							 @"SanFranciscoText-Semibold",
							 @"SanFranciscoText-SemiboldItalic",
							 @"SanFranciscoText-Thin",
							 @"SanFranciscoText-ThinItalic",
							 @"SavoyeLetPlain",
							 @"SinhalaSangamMN",
							 @"SinhalaSangamMN-Bold",
							 @"SnellRoundhand",
							 @"SnellRoundhand-Black",
							 @"SnellRoundhand-Bold",
							 @"Superclarendon-Regular",
							 @"Superclarendon-BoldItalic",
							 @"Superclarendon-Light",
							 @"Superclarendon-BlackItalic",
							 @"Superclarendon-Italic",
							 @"Superclarendon-LightItalic",
							 @"Superclarendon-Bold",
							 @"Superclarendon-Black",
							 @"Symbol",
							 @"TamilSangamMN",
							 @"TamilSangamMN-Bold",
							 @"TeluguSangamMN",
							 @"TeluguSangamMN-Bold",
							 @"Thonburi",
							 @"Thonburi-Bold",
							 @"Thonburi-Light",
							 @"TimesNewRomanPS-BoldItalicMT",
							 @"TimesNewRomanPS-BoldMT",
							 @"TimesNewRomanPS-ItalicMT",
							 @"TimesNewRomanPSMT",
							 @"Trebuchet-BoldItalic",
							 @"TrebuchetMS",
							 @"TrebuchetMS-Bold",
							 @"TrebuchetMS-Italic",
							 @"Verdana",
							 @"Verdana-Bold",
							 @"Verdana-BoldItalic",
							 @"Verdana-Italic",
							 @"ZapfDingbatsITC",
							 @"Zapfino"];
}

+ (NSString *)getFontFromIndex:(NSInteger)index {
	NSArray *fontsArray = @[ @"AcademyEngravedLetPlain",
							 @"AlNile-Bold",
							 @"AlNile",
							 @"AmericanTypewriter",
							 @"AmericanTypewriter-Bold",
							 @"AmericanTypewriter-Condensed",
							 @"AmericanTypewriter-CondensedBold",
							 @"AmericanTypewriter-CondensedLight",
							 @"AmericanTypewriter-Light",
							 @"AppleColorEmoji",
							 @"AppleSDGothicNeo-Thin",
							 @"AppleSDGothicNeo-Light",
							 @"AppleSDGothicNeo-Regular",
							 @"AppleSDGothicNeo-Medium",
							 @"AppleSDGothicNeo-SemiBold",
							 @"AppleSDGothicNeo-Bold",
							 @"AppleSDGothicNeo-Medium",
							 @"ArialMT",
							 @"Arial-BoldItalicMT",
							 @"Arial-BoldMT",
							 @"Arial-ItalicMT",
							 @"ArialHebrew",
							 @"ArialHebrew-Bold",
							 @"ArialHebrew-Light",
							 @"ArialRoundedMTBold",
							 @"Avenir-Black",
							 @"Avenir-BlackOblique",
							 @"Avenir-Book",
							 @"Avenir-BookOblique",
							 @"Avenir-Heavy",
							 @"Avenir-HeavyOblique",
							 @"Avenir-Light",
							 @"Avenir-LightOblique",
							 @"Avenir-Medium",
							 @"Avenir-MediumOblique",
							 @"Avenir-Oblique",
							 @"Avenir-Roman",
							 @"AvenirNext-Bold",
							 @"AvenirNext-BoldItalic",
							 @"AvenirNext-DemiBold",
							 @"AvenirNext-DemiBoldItalic",
							 @"AvenirNext-Heavy",
							 @"AvenirNext-HeavyItalic",
							 @"AvenirNext-Italic",
							 @"AvenirNext-Medium",
							 @"AvenirNext-MediumItalic",
							 @"AvenirNext-Regular",
							 @"AvenirNext-UltraLight",
							 @"AvenirNext-UltraLightItalic",
							 @"AvenirNextCondensed-Bold",
							 @"AvenirNextCondensed-BoldItalic",
							 @"AvenirNextCondensed-DemiBold",
							 @"AvenirNextCondensed-DemiBoldItalic",
							 @"AvenirNextCondensed-Heavy",
							 @"AvenirNextCondensed-HeavyItalic",
							 @"AvenirNextCondensed-Italic",
							 @"AvenirNextCondensed-Medium",
							 @"AvenirNextCondensed-MediumItalic",
							 @"AvenirNextCondensed-Regular",
							 @"AvenirNextCondensed-UltraLight",
							 @"AvenirNextCondensed-UltraLightItalic",
							 @"BanglaSangamMN",
							 @"BanglaSangamMN-Bold",
							 @"Baskerville",
							 @"Baskerville-Bold",
							 @"Baskerville-BoldItalic",
							 @"Baskerville-Italic",
							 @"Baskerville-SemiBold",
							 @"Baskerville-SemiBoldItalic",
							 @"BodoniOrnamentsITCTT",
							 @"BodoniSvtyTwoITCTT-Bold",
							 @"BodoniSvtyTwoITCTT-Book",
							 @"BodoniSvtyTwoITCTT-BookIta",
							 @"BodoniSvtyTwoOSITCTT-Bold",
							 @"BodoniSvtyTwoOSITCTT-Book",
							 @"BodoniSvtyTwoOSITCTT-BookIt",
							 @"BodoniSvtyTwoSCITCTT-Book",
							 @"BradleyHandITCTT-Bold",
							 @"ChalkboardSE-Bold",
							 @"ChalkboardSE-Light",
							 @"ChalkboardSE-Regular",
							 @"Chalkduster",
							 @"Cochin",
							 @"Cochin-Bold",
							 @"Cochin-BoldItalic",
							 @"Cochin-Italic",
							 @"Copperplate",
							 @"Copperplate-Bold",
							 @"Copperplate-Light",
							 @"Courier",
							 @"Courier-Bold",
							 @"Courier-BoldOblique",
							 @"Courier-Oblique",
							 @"CourierNewPS-BoldItalicMT",
							 @"CourierNewPS-BoldMT",
							 @"CourierNewPS-ItalicMT",
							 @"CourierNewPSMT",
							 @"DBLCDTempBlack",
							 @"DINAlternate-Bold",
							 @"DINCondensed-Bold",
							 @"DamascusBold",
							 @"Damascus",
							 @"DamascusLight",
							 @"DamascusMedium",
							 @"DamascusSemiBold",
							 @"DevanagariSangamMN",
							 @"DevanagariSangamMN-Bold",
							 @"Didot",
							 @"Didot-Bold",
							 @"Didot-Italic",
							 @"DiwanMishafi",
							 @"EuphemiaUCAS",
							 @"EuphemiaUCAS-Bold",
							 @"EuphemiaUCAS-Italic",
							 @"Farah",
							 @"Futura-CondensedExtraBold",
							 @"Futura-CondensedMedium",
							 @"Futura-Medium",
							 @"Futura-MediumItalic",
							 @"GeezaPro",
							 @"GeezaPro-Bold",
							 @"Georgia",
							 @"Georgia-Bold",
							 @"Georgia-BoldItalic",
							 @"Georgia-Italic",
							 @"GillSans",
							 @"GillSans-Bold",
							 @"GillSans-BoldItalic",
							 @"GillSans-Italic",
							 @"GillSans-Light",
							 @"GillSans-LightItalic",
							 @"GujaratiSangamMN",
							 @"GujaratiSangamMN-Bold",
							 @"GurmukhiMN",
							 @"GurmukhiMN-Bold",
							 @"STHeitiSC-Light",
							 @"STHeitiSC-Medium",
							 @"STHeitiTC-Light",
							 @"STHeitiTC-Medium",
							 @"Helvetica",
							 @"Helvetica-Bold",
							 @"Helvetica-BoldOblique",
							 @"Helvetica-Light",
							 @"Helvetica-LightOblique",
							 @"Helvetica-Oblique",
							 @"HelveticaNeue",
							 @"HelveticaNeue-Bold",
							 @"HelveticaNeue-BoldItalic",
							 @"HelveticaNeue-CondensedBlack",
							 @"HelveticaNeue-CondensedBold",
							 @"HelveticaNeue-Italic",
							 @"HelveticaNeue-Light",
							 @"HelveticaNeue-LightItalic",
							 @"HelveticaNeue-Medium",
							 @"HelveticaNeue-MediumItalic",
							 @"HelveticaNeue-UltraLight",
							 @"HelveticaNeue-UltraLightItalic",
							 @"HelveticaNeue-Thin",
							 @"HelveticaNeue-ThinItalic",
							 @"HiraKakuProN-W3",
							 @"HiraKakuProN-W6",
							 @"HiraMinProN-W3",
							 @"HiraMinProN-W6",
							 @"HoeflerText-Black",
							 @"HoeflerText-BlackItalic",
							 @"HoeflerText-Italic",
							 @"HoeflerText-Regular",
							 @"IowanOldStyle-Bold",
							 @"IowanOldStyle-BoldItalic",
							 @"IowanOldStyle-Italic",
							 @"IowanOldStyle-Roman",
							 @"Kailasa",
							 @"Kailasa-Bold",
							 @"KannadaSangamMN",
							 @"KannadaSangamMN-Bold",
							 @"KhmerSangamMN",
							 @"KohinoorDevanagari-Book",
							 @"KohinoorDevanagari-Light",
							 @"KohinoorDevanagari-Medium",
							 @"LaoSangamMN",
							 @"MalayalamSangamMN",
							 @"MalayalamSangamMN-Bold",
							 @"Marion-Bold",
							 @"Marion-Italic",
							 @"Marion-Regular",
							 @"Menlo-BoldItalic",
							 @"Menlo-Regular",
							 @"Menlo-Bold",
							 @"Menlo-Italic",
							 @"MarkerFelt-Thin",
							 @"MarkerFelt-Wide",
							 @"Noteworthy-Bold",
							 @"Noteworthy-Light",
							 @"Optima-Bold",
							 @"Optima-BoldItalic",
							 @"Optima-ExtraBlack",
							 @"Optima-Italic",
							 @"Optima-Regular",
							 @"OriyaSangamMN",
							 @"OriyaSangamMN-Bold",
							 @"Palatino-Bold",
							 @"Palatino-BoldItalic",
							 @"Palatino-Italic",
							 @"Palatino-Roman",
							 @"Papyrus",
							 @"Papyrus-Condensed",
							 @"PartyLetPlain",
							 @"SanFranciscoDisplay-Black",
							 @"SanFranciscoDisplay-Bold",
							 @"SanFranciscoDisplay-Heavy",
							 @"SanFranciscoDisplay-Light",
							 @"SanFranciscoDisplay-Medium",
							 @"SanFranciscoDisplay-Regular",
							 @"SanFranciscoDisplay-Semibold",
							 @"SanFranciscoDisplay-Thin",
							 @"SanFranciscoDisplay-Ultralight",
							 @"SanFranciscoRounded-Black",
							 @"SanFranciscoRounded-Bold",
							 @"SanFranciscoRounded-Heavy",
							 @"SanFranciscoRounded-Light",
							 @"SanFranciscoRounded-Medium",
							 @"SanFranciscoRounded-Regular",
							 @"SanFranciscoRounded-Semibold",
							 @"SanFranciscoRounded-Thin",
							 @"SanFranciscoRounded-Ultralight",
							 @"SanFranciscoText-Bold",
							 @"SanFranciscoText-BoldG1",
							 @"SanFranciscoText-BoldG2",
							 @"SanFranciscoText-BoldG3",
							 @"SanFranciscoText-BoldItalic",
							 @"SanFranciscoText-BoldItalicG1",
							 @"SanFranciscoText-BoldItalicG2",
							 @"SanFranciscoText-BoldItalicG3",
							 @"SanFranciscoText-Heavy",
							 @"SanFranciscoText-HeavyItalic",
							 @"SanFranciscoText-Light",
							 @"SanFranciscoText-LightItalic",
							 @"SanFranciscoText-Medium",
							 @"SanFranciscoText-MediumItalic",
							 @"SanFranciscoText-Regular",
							 @"SanFranciscoText-RegularG1",
							 @"SanFranciscoText-RegularG2",
							 @"SanFranciscoText-RegularG3",
							 @"SanFranciscoText-RegularItalic",
							 @"SanFranciscoText-RegularItalicG1",
							 @"SanFranciscoText-RegularItalicG2",
							 @"SanFranciscoText-RegularItalicG3",
							 @"SanFranciscoText-Semibold",
							 @"SanFranciscoText-SemiboldItalic",
							 @"SanFranciscoText-Thin",
							 @"SanFranciscoText-ThinItalic",
							 @"SavoyeLetPlain",
							 @"SinhalaSangamMN",
							 @"SinhalaSangamMN-Bold",
							 @"SnellRoundhand",
							 @"SnellRoundhand-Black",
							 @"SnellRoundhand-Bold",
							 @"Superclarendon-Regular",
							 @"Superclarendon-BoldItalic",
							 @"Superclarendon-Light",
							 @"Superclarendon-BlackItalic",
							 @"Superclarendon-Italic",
							 @"Superclarendon-LightItalic",
							 @"Superclarendon-Bold",
							 @"Superclarendon-Black",
							 @"Symbol",
							 @"TamilSangamMN",
							 @"TamilSangamMN-Bold",
							 @"TeluguSangamMN",
							 @"TeluguSangamMN-Bold",
							 @"Thonburi",
							 @"Thonburi-Bold",
							 @"Thonburi-Light",
							 @"TimesNewRomanPS-BoldItalicMT",
							 @"TimesNewRomanPS-BoldMT",
							 @"TimesNewRomanPS-ItalicMT",
							 @"TimesNewRomanPSMT",
							 @"Trebuchet-BoldItalic",
							 @"TrebuchetMS",
							 @"TrebuchetMS-Bold",
							 @"TrebuchetMS-Italic",
							 @"Verdana",
							 @"Verdana-Bold",
							 @"Verdana-BoldItalic",
							 @"Verdana-Italic",
							 @"ZapfDingbatsITC",
							 @"Zapfino"];
	
	
	NSInteger count = [fontsArray count];
	
	index = index % count;
	
	NSString *retFont = [fontsArray objectAtIndex:index];
	
	return retFont;
}

@end

