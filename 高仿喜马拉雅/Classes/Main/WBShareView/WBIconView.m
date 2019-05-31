//
//  WBIconView.m
//  -WBShareViewCopy-
//
//  Created by lifesea on 2018/9/4.
//  Copyright © 2018年 lifesea. All rights reserved.
//

#import "WBIconView.h"

@implementation WBIconView
@synthesize yellowImageView;
@synthesize yellowLable;

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        [self addGestureRecognizer:tapGesturRecognizer];
        
        [self AutoresizingMask];
    }
    return self;
}

- (void)AutoresizingMask{
    yellowImageView = [[UIImageView alloc]init];
    [self addSubview:yellowImageView];

    yellowImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *yellowImageViewTop = [NSLayoutConstraint constraintWithItem:yellowImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraint:yellowImageViewTop];
    
    NSLayoutConstraint *yellowImageViewLeft = [NSLayoutConstraint constraintWithItem:yellowImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    
    [self addConstraint:yellowImageViewLeft];
    
    NSLayoutConstraint *yellowImageViewBottom = [NSLayoutConstraint constraintWithItem:yellowImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    
    [self addConstraint:yellowImageViewBottom];
    
    NSLayoutConstraint *yellowImageViewRight = [NSLayoutConstraint constraintWithItem:yellowImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    
    [self addConstraint:yellowImageViewRight];
    
    yellowLable = [[UILabel alloc]init];
    yellowLable.text = @"111";
    yellowLable.textAlignment = NSTextAlignmentCenter;
    yellowLable.font = [UIFont systemFontOfSize:14];
    [self addSubview:yellowLable];
    yellowLable.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *yellowLableTop = [NSLayoutConstraint constraintWithItem:yellowLable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:yellowImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self addConstraint:yellowLableTop];
    
    NSLayoutConstraint *yellowLableLeft = [NSLayoutConstraint constraintWithItem:yellowLable attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    [self addConstraint:yellowLableLeft];
    
    NSLayoutConstraint *yellowLableBottom = [NSLayoutConstraint constraintWithItem:yellowLable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    [self addConstraint:yellowLableBottom];
    
    NSLayoutConstraint *yellowLableRight = [NSLayoutConstraint constraintWithItem:yellowLable attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    [self addConstraint:yellowLableRight];
    

}
-(void)tapAction:(id)tap

{
    if (self.wbIconViewClickViewBlock) {
        self.wbIconViewClickViewBlock();
    }
}


@end
