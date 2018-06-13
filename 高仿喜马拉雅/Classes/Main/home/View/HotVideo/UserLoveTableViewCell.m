//
//  UserLoveTableViewCell.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/28.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "UserLoveTableViewCell.h"

@implementation UserLoveTableViewCell{
    UIButton *_centerButton;
    UIView *_autoMarginViewsContainer;
}
@synthesize viewHeader;
@synthesize imageOne;
@synthesize lableOne;
- (void)setList:(NSArray *)list{
    if (_list != list) {
        _list = list;
    }
    [self setupAutoMarginViewsWithCount:6 itemWidth:SCREEN_WIDTH/3 -10];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    viewHeader = [UIView new];
    [self addSubview:viewHeader];
    viewHeader.sd_layout.topEqualToView(self.contentView).leftEqualToView(self.contentView).rightEqualToView(self.contentView).heightIs(HeightScale(60));
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        //使用一根手指双击时，才触发点按手势识别器
    recognizer.numberOfTouchesRequired = 1;
    [viewHeader addGestureRecognizer:recognizer];
    
    UIImageView *imageRight = [UIImageView new];
    imageRight.image = [UIImage imageNamed:@"右三角"];
    [viewHeader addSubview:imageRight];
    imageRight.sd_layout.leftSpaceToView(viewHeader,10).centerYEqualToView(viewHeader).widthIs(WidthScale(15)).heightIs(WidthScale(15));
    
    UILabel *lableRight = [UILabel new];
    lableRight.text = @"猜你喜欢";
    lableRight.font = [UIFont systemFontOfSize:14];
    [viewHeader addSubview:lableRight];
    lableRight.sd_layout.leftSpaceToView(imageRight,3).centerYEqualToView(viewHeader).widthIs(WidthScale(120)).heightIs(WidthScale(20));
    
    UILabel *lableLeft = [UILabel new];
    lableLeft.text = @"更多";
    lableLeft.font = [UIFont systemFontOfSize:14];
    [viewHeader addSubview:lableLeft];
    lableLeft.textColor = kBSColorSubTitle;
    lableLeft.textAlignment = NSTextAlignmentRight;
    
    lableLeft.sd_layout.rightSpaceToView(viewHeader,22).centerYEqualToView(viewHeader).widthIs(WidthScale(60)).heightIs(WidthScale(20));
    UIImageView *imageLeft = [UIImageView new];
    [viewHeader addSubview:imageLeft];
    imageLeft.image = IMG(@"cell_arrow");
    imageLeft.sd_layout.rightSpaceToView(viewHeader,12).centerYEqualToView(viewHeader).widthIs(WidthScale(13)).heightIs(WidthScale(13));

}
// 设置一排固定宽度自动间距子view
- (void)setupAutoMarginViewsWithCount:(NSInteger)count itemWidth:(CGFloat)itemWidth
{
    _autoMarginViewsContainer = [UIView new];
    [self addSubview:_autoMarginViewsContainer];
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < count; i++) {
        NSDictionary *dic = _list[i];
        WXRecommendYouLikeModel *infor = [WXRecommendYouLikeModel mj_objectWithKeyValues:dic];

        UIView *viewCover = [UIView new];
        [self addSubview:viewCover];
        [_autoMarginViewsContainer addSubview:viewCover];
        viewCover.sd_layout.autoHeightRatio(1.4); // 设置高度约束
        [temp addObject:viewCover];
        UIButton *ButtonCover = [UIButton new];
        [viewCover addSubview:ButtonCover];
        ButtonCover.sd_layout.leftSpaceToView(viewCover,0).topSpaceToView(viewCover,0).widthRatioToView(viewCover,1).heightRatioToView(viewCover,1);
        [ButtonCover addTarget:self action:@selector(coverViewRecognizerTap:) forControlEvents:(UIControlEventTouchUpInside)];
        ButtonCover.tag = i + 100;
        imageOne = [UIImageView new];
        [viewCover addSubview:imageOne];
        imageOne.sd_layout.leftSpaceToView(viewCover,0).topSpaceToView(viewCover,0).widthRatioToView(viewCover,1).heightIs(WidthScale((SCREEN_WIDTH-0)/3));
        UIImageView *imagePay = [UIImageView new];
        imagePay.image = [UIImage imageNamed:@"付费"];
        [imageOne addSubview:imagePay];
        imagePay.sd_layout.leftSpaceToView(imageOne,0).topSpaceToView(imageOne,0).widthIs(22).heightIs(22);
        
        UIImageView *imageNew = [UIImageView new];
        imageNew.image = [UIImage imageNamed:@"icon-NEW-右上角"];
        [imageOne addSubview:imageNew];
        imageNew.sd_layout.rightSpaceToView(imageOne,0).topSpaceToView(imageOne,0).widthIs(22).heightIs(22);
        
        

        lableOne = [UILabel new];
        lableOne.font = [UIFont systemFontOfSize:13];
        [viewCover addSubview:lableOne];
        lableOne.numberOfLines = 2;
        lableOne.sd_layout.leftSpaceToView(viewCover,0).topSpaceToView(imageOne,2).widthRatioToView(viewCover,1).heightIs(WidthScale(40));
        lableOne.textAlignment = NSTextAlignmentCenter;
        NSString *st = [NSString stringWithFormat:@"%@",infor.pic];
        [imageOne sd_setImageWithURL:[NSURL URLWithString:st] placeholderImage:[UIImage imageNamed:@"shopping2"]];
        lableOne.text = infor.title;
        
        if ([infor.isPaid integerValue] == 0) {
            imagePay.hidden = YES;
        }
        if ([infor.isVipFree integerValue] == 0) {
            imageNew.hidden = YES;
        }

    }
    
    // 此步设置之后_autoMarginViewsContainer的高度可以根据子view自适应
    [_autoMarginViewsContainer setupAutoMarginFlowItems:[temp copy] withPerRowItemsCount:3 itemWidth:itemWidth verticalMargin:5 verticalEdgeInset:0 horizontalEdgeInset:7.5];
    _autoMarginViewsContainer.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(viewHeader, 0);
    
    UIView *viewLine = [[UIView alloc]init];
    viewLine.backgroundColor = kBSColorSeparatorLine;
    [self addSubview:viewLine];
    viewLine.sd_layout.topSpaceToView(_autoMarginViewsContainer,10).leftSpaceToView(self, 12).rightSpaceToView(self, 12).heightIs(1);
    UIButton *buttonChange = [[UIButton alloc]init];
    [self addSubview:buttonChange];
    buttonChange.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [buttonChange setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [buttonChange setTitle:@"换一换" forState:UIControlStateNormal];
    buttonChange.sd_layout.topSpaceToView(viewLine,0).leftSpaceToView(self, 12).rightSpaceToView(self, 12).heightIs(42);
    [buttonChange addTarget:self action:@selector(buttonChangeTap:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)coverViewRecognizerTap:(UIButton *)sender{
    
    WXRecommendYouLikeModel *mode = self.list[sender.tag-100];
    if (self.coverDetailClickActionBlock) {
        self.coverDetailClickActionBlock(mode);
    }
}
 - (void)handleTap:(UITapGestureRecognizer *)recognizer {
     if (self.moreDetailClickActionBlock) {
         self.moreDetailClickActionBlock();
     }
 }
-(void)buttonChangeTap:(UIButton *)sender{
    
}
@end
