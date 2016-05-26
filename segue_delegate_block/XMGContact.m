//
//  XMGContact.m
//  小码哥通讯录
//
//  Created by xiaomage on 15/6/12.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGContact.h"
#import <MJExtension.h>

@implementation XMGContact


MJExtensionCodingImplementation
+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone
{
    XMGContact *c = [[self alloc] init];
    
    c.name = name;
    c.phone = phone;
    
    return c;
}
@end
