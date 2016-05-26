//
//  addViewController.h
//  segue_delegate_block
//
//  Created by zijia on 5/25/.
//  Copyright (c) 2016 zijia. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGContact, addViewController;

@protocol addViewControllerDelegate <NSObject>

@optional
- (void)addViewDelegatecontact:(XMGContact *)contact;

@end



typedef void(^addViewControllerBlock) (XMGContact *contact);

@interface addViewController : UIViewController

@property (nonatomic, weak) id<addViewControllerDelegate> delegate;


@end
