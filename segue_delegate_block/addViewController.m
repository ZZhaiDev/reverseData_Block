//
//  addViewController.m
//  segue_delegate_block
//
//  Created by zijia on 5/25/.
//  Copyright (c) 2016 zijia. All rights reserved.
//

#import "addViewController.h"
#import "XMGContact.h"

@interface addViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstTextF;


@property (weak, nonatomic) IBOutlet UITextField *secondTextF;

- (IBAction)addOkButton;

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}






- (IBAction)addOkButton {
    
    XMGContact *c = [XMGContact contactWithName:_firstTextF.text phone:_secondTextF.text];
    
    if (_block) {
        _block(c);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
