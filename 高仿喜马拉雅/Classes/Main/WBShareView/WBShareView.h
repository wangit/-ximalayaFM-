//
//  WBShareView.h
//  -WBShareViewCopy-
//
//  Created by lifesea on 2018/9/4.
//  Copyright © 2018年 lifesea. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WBShareViewDelegate <NSObject>

- (void)wbShareView:(UIView *)wbShareView didSelectRowAtIndexPath:(long)indexPath ColumnAtIndexPath:(long )indexColumn;;

@end

@protocol WBShareViewDataSource <NSObject>

- (NSInteger)numberOfSectionsInWBShareView:(UIView *)wbShareView;

/*
 *行高rowAdaption为NO生效
 */
- (CGFloat)wbShareView:(UIView *)wbShareViewheightForRow;

/*
 *是否隐藏标题
 */
- (BOOL)wbShareViewLable:(UILabel *)lable hideCaptionForRowAtIndexPath:(int)indexPath;

/*
 *是否隐藏标题
 */
- (NSString *)wbShareViewLableTitle:(UILabel *)lable titleForRowAtIndexPath:(int)indexPath;

/*
 *是否隐藏分割线
 */
- (BOOL)wbShareViewlineView:(UIView *)lineView hideCaptionForRowAtIndexPath:(int)indexPath;

/*
 *视图背景颜色
 */
- (UIColor *)wbShareViewContentView:(UIView *)contentView colorForRowAtIndexPath:(int)indexPath;

@end


@interface WBShareView : UIView
@property (nonatomic, weak)id<WBShareViewDelegate> delegate; //声明协议变量
@property (nonatomic, weak)id<WBShareViewDataSource> dataSource; //声明协议变量

- (instancetype)initWithHigh:(float)high;

- (void)showInView:(UIView *)view;

/*
 *行数，默认3行
 */
@property (nonatomic,assign) NSInteger lineNumber;
/*
 *默认自动布局，默认NO
 */
@property (nonatomic,assign) BOOL rowAdaption;


/*
 *内容数组
 */
@property (nonatomic,copy) NSArray *lineIconText;
@property (nonatomic,copy) NSArray *lineIconImg;
///属性

/*
 *背景颜色，默认黑色半透明
 */
@property (nonatomic,strong) UIColor *contentCor;
@property (nonatomic,strong) UIColor *cancelCor;
@property (nonatomic,strong) UIColor *cancelTextCor;
@property (nonatomic,strong) UIFont  *cancelTextFont;
@property (nonatomic,assign) CGSize imgUnderlySize;


//--------------------------------标题属性----------------------------//

@property (nonatomic,strong) UIColor *titleTextCor;
@property (nonatomic,strong) UIFont  *titleTextFont;

@end
