//
//  XMGContact.h
//  小码哥通讯录
//
//  Created by xiaomage on 15/6/12.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGContact : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *phone;


+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;


@end
