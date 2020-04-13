//
//  TreeNode.m
//  RSSchool_T4
//
//  Created by Tsimafei Zykau on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = @"0";
        _left = [[TreeNode alloc] initAsNull];
        _right = [[TreeNode alloc] initAsNull];
    }
    return self;
}

- (instancetype)initAsNull
{
    self = [super init];
    if (self) {
        _value = @"null";
    }
    return self;
}
@end
