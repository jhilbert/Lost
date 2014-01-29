//
//  DetailViewController.h
//  Lost
//
//  Created by Josef Hilbert on 28.01.14.
//  Copyright (c) 2014 Josef Hilbert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Character *editedCharacter;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

-(Character*)newCharacter;

@end
