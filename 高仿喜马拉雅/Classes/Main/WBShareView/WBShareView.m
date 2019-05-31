//
//  WBShareView.m
//  -WBShareViewCopy-
//
//  Created by lifesea on 2018/9/4.
//  Copyright © 2018年 lifesea. All rights reserved.
//

#import "WBShareView.h"
#import "WBIconView.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define WBBounceViewHight 300
#define Tool_Height ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 64.0 : 44.0)

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface WBShareView()

@property (nonatomic,assign) float shareViewHigh;

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIButton *cancelBtn;
@end

@implementation WBShareView

- (instancetype)initWithHigh:(float)high{
    self = [super init];
    if (self) {
        _shareViewHigh = high;
        [self setupContent];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _shareViewHigh = WBBounceViewHight;
        [self setupContent];
    }
    return self;
}
- (void)setContentCor:(UIColor *)contentCor{
    self.backgroundColor = contentCor;
}
- (void)setCancelCor:(UIColor *)cancelCor{
    _cancelBtn.backgroundColor = cancelCor;

}

- (void)setCancelTextCor:(UIColor *)cancelTextCor{
    
    [_cancelBtn setTitleColor:cancelTextCor forState:UIControlStateNormal];
}

-(void)setCancelTextFont:(UIFont *)cancelTextFont{
    _cancelBtn.titleLabel.font = cancelTextFont;
    

}

- (void)setupContent {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    self.lineNumber = self.lineIconText.count;

    if (_contentView == nil) {
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];

        _cancelBtn = [[UIButton alloc]init];
        [_contentView addSubview:_cancelBtn];
        [_cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
        [_cancelBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];

        [_cancelBtn addTarget:self action:@selector(disMissView) forControlEvents:(UIControlEventTouchUpInside)];
        _cancelBtn.backgroundColor = [UIColor grayColor];
    }
}

- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [self.contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - self.shareViewHigh, SCREEN_WIDTH, self.shareViewHigh)];
        [self.cancelBtn setFrame:CGRectMake(0, self.contentView.frame.size.height - Tool_Height, SCREEN_WIDTH, Tool_Height)];
        [self setupAccordingContent];
    } completion:nil];
}
- (void)disMissView {
    
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - _shareViewHigh, SCREEN_WIDTH, _shareViewHigh)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [self.contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.shareViewHigh)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [self.contentView removeFromSuperview];
                         
                     }];
    
}

- (void)setupAccordingContent{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsInWBShareView:)]) {
        float lineHigh;
        NSInteger numberCount  =  [self.dataSource numberOfSectionsInWBShareView:self];

        if (_rowAdaption) {
            lineHigh = (self.contentView.frame.size.height - Tool_Height)/numberCount;
            
        }else{
            lineHigh = [self.dataSource wbShareView:_contentView];
            
        }

        UIScrollView *scrollUnderlyView = [[UIScrollView alloc] init];
        scrollUnderlyView.frame = CGRectMake(0, 0,_contentView.frame.size.width, _contentView.frame.size.height - Tool_Height);
        scrollUnderlyView.backgroundColor = [UIColor blackColor];
        
        scrollUnderlyView.showsHorizontalScrollIndicator = NO;
        scrollUnderlyView.showsVerticalScrollIndicator = NO;
        scrollUnderlyView.contentSize = CGSizeMake(self.frame.size.width,lineHigh*numberCount);

        [self.contentView addSubview:scrollUnderlyView];
        
        for (int i = 0; i < numberCount; i++) {
        
            UIScrollView *scrollView = [[UIScrollView alloc] init];
            scrollView.frame = CGRectMake(0, i * lineHigh,_contentView.frame.size.width, lineHigh);
            scrollView.backgroundColor = randomColor;
            scrollView.tag = i;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.showsVerticalScrollIndicator = NO;

            UILabel *lableTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 16)];
            lableTitle.text = @"Title";
            lableTitle.textColor = [UIColor whiteColor];
            [scrollView addSubview:lableTitle];
            
            UIView *lineView = [[UIView alloc]init];
            lineView.backgroundColor = [UIColor blackColor];
            [scrollView addSubview:lineView];
            
            
            [scrollUnderlyView addSubview:scrollView];

            
            if ([self.dataSource respondsToSelector:@selector(wbShareViewLable:hideCaptionForRowAtIndexPath:)]) {
                lableTitle.hidden = [self.dataSource wbShareViewLable:lableTitle hideCaptionForRowAtIndexPath:i];
            }
            if ([self.dataSource respondsToSelector:@selector(wbShareViewlineView:hideCaptionForRowAtIndexPath:)]) {
                lineView.hidden = [self.dataSource wbShareViewlineView:lineView hideCaptionForRowAtIndexPath:i];
            }
            if ([self.dataSource respondsToSelector:@selector(wbShareViewContentView:colorForRowAtIndexPath:)]) {
                scrollView.backgroundColor = [self.dataSource wbShareViewContentView:scrollView colorForRowAtIndexPath:i];
            }
            if ([self.dataSource respondsToSelector:@selector(wbShareViewLableTitle:titleForRowAtIndexPath:)]) {
                lableTitle.text = [self.dataSource wbShareViewLableTitle:lableTitle titleForRowAtIndexPath:i];
            }
            
            
            NSArray *arrayTitle = self.lineIconText[i];
            NSArray *arrayImage = self.lineIconImg[i];
            if (arrayTitle.count * (lineHigh*0.8+15) > SCREEN_WIDTH) {
                lineView.frame  = CGRectMake(-200, scrollView.frame.size.height-1, arrayTitle.count * (lineHigh*0.8+15)+200, 1);

            }else{
                lineView.frame  = CGRectMake(-200, scrollView.frame.size.height-1, SCREEN_WIDTH+200, 1);

            }

            
            
            for (int j = 0; j < arrayTitle.count; j++) {
                WBIconView *imageView = [[WBIconView alloc] init];
                imageView.yellowLable.text = arrayTitle[j];
                imageView.yellowImageView.image = arrayImage[j];
                CGFloat imgW;
                CGFloat imgH;
                if (self.imgUnderlySize.width == 0) {
                    imgW = lineHigh*0.6; // 图片的宽度
                    imgH = lineHigh*0.6; // 图片的高度
                    scrollView.contentSize = CGSizeMake(arrayTitle.count * (lineHigh*0.8+15), lineHigh);
                    
                }else{
                    imgW = self.imgUnderlySize.width; // 图片的宽度
                    imgH = self.imgUnderlySize.height; // 图片的高度
                    scrollView.contentSize = CGSizeMake(arrayTitle.count * (self.imgUnderlySize.width+15), lineHigh);
                    
                }
                
                imageView.tag = j;
                imageView.frame = CGRectMake(j *imgW +15*(j+1), 10, imgW, imgH);
                imageView.center = CGPointMake(j *imgW +15*(j+1) + 10, scrollView.frame.size.height/2+6);
                [scrollView addSubview:imageView];
                long imgTag = j;
                imageView.wbIconViewClickViewBlock = ^{
                    if ([self.delegate respondsToSelector:@selector(wbShareView:didSelectRowAtIndexPath:ColumnAtIndexPath:)]) {
                        [self.delegate wbShareView:self didSelectRowAtIndexPath:scrollView.tag ColumnAtIndexPath:imgTag];
                    }
                };
            }
            
            
        }
    
    

    
    }
    else {
        float lineHigh = (self.contentView.frame.size.height - Tool_Height)/self.lineNumber;
        for (int i = 0; i < self.lineIconText.count; i++) {
            UIScrollView *scrollView = [[UIScrollView alloc] init];
            scrollView.frame = CGRectMake(0, i * lineHigh,_contentView.frame.size.width, lineHigh);
            NSArray *array = @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor]];
            scrollView.backgroundColor = array[i];
            scrollView.tag = i;
            NSArray *arrayTitle = self.lineIconText[i];
            NSArray *arrayImage = self.lineIconImg[i];
            
            //标题
            UILabel *lableTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 16)];
            lableTitle.text = @"Title";
            [scrollView addSubview:lableTitle];
            
            
            
            
            NSLog(@"%@",arrayTitle);
            [self.contentView addSubview:scrollView];
            
            // 2.创建UIImageView（图片）
            for (int j = 0; j < arrayTitle.count; j++) {
                WBIconView *imageView = [[WBIconView alloc] init];
                imageView.yellowLable.text = arrayTitle[j];
                imageView.yellowImageView.image = arrayImage[j];
                CGFloat imgW;
                CGFloat imgH;
                if (self.imgUnderlySize.width == 0) {
                    imgW = lineHigh*0.6; // 图片的宽度
                    imgH = lineHigh*0.6; // 图片的高度
                    scrollView.contentSize = CGSizeMake(arrayTitle.count * (lineHigh*0.8+15), lineHigh);
                    
                }else{
                    imgW = self.imgUnderlySize.width; // 图片的宽度
                    imgH = self.imgUnderlySize.height; // 图片的高度
                    scrollView.contentSize = CGSizeMake(arrayTitle.count * (self.imgUnderlySize.width+15), lineHigh);
                    
                }
                
                imageView.tag = j;
                imageView.frame = CGRectMake(j *imgW +15*(j+1), 10, imgW, imgH);
                imageView.center = CGPointMake(j *imgW +15*(j+1) + 10, scrollView.frame.size.height/2+6);
                [scrollView addSubview:imageView];
                long imgTag = j;
                imageView.wbIconViewClickViewBlock = ^{
                    if ([self.delegate respondsToSelector:@selector(wbShareView:didSelectRowAtIndexPath:ColumnAtIndexPath:)]) {
                        [self.delegate wbShareView:self didSelectRowAtIndexPath:scrollView.tag ColumnAtIndexPath:imgTag];
                    }
                };
            }
            
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.showsVerticalScrollIndicator = NO;
            //        scrollView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
            
        }
    }
  
}


@end
