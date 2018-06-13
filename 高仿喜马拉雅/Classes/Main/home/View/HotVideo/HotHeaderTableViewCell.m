//
//  HotHeaderTableViewCell.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/28.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "HotHeaderTableViewCell.h"

@implementation HotHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
     _imageArray= [[NSMutableArray alloc]init];
    _IconTitleArray= [[NSMutableArray alloc]init];
    _IconImageArray= [[NSMutableArray alloc]init];

    _cycleScrollerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HeightScale(180))
                                                            delegate:self
                                                    placeholderImage:[UIImage imageNamed:@"天气背景"]];

    
    _cycleScrollerView.autoScrollTimeInterval = 2.;// 自动滚动时间间隔
    _cycleScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;// 翻页 右下角
    _cycleScrollerView.titleLabelBackgroundColor = [UIColor clearColor];// 图片对应的标题的 背景色。（因为没有设标题）
    [self addSubview:_cycleScrollerView];
    
    CGRect bounds = CGRectMake(0, HeightScale(180), SCREEN_WIDTH, HeightScale(105)) ;
    _scrollView = [ [UIScrollView alloc ] initWithFrame:bounds ];
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    [self addSubview:_scrollView];
    
    UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, _scrollView.y +_scrollView.height, SCREEN_WIDTH, 10)];
    viewLine.backgroundColor = kBSColorSeparatorLine;
    [self addSubview:viewLine];
}
-(void)setImageArray:(NSMutableArray *)imageArray{
    //_imageArray =imageArray;
    for (WXRecommendIMGModel *dic in imageArray) {
        [_imageArray addObject:dic.pic];
    }
    _cycleScrollerView.imageURLStringsGroup  = _imageArray;

}
-(void)setIconTitleArray:(NSMutableArray *)IconArray{
    for (WXRecommendICONModel *dic in IconArray) {
        [_IconTitleArray addObject:dic.title];
        [_IconImageArray addObject:dic.coverPath];

    }
    _scrollView.contentSize = CGSizeMake(HeightScale(80) *_IconTitleArray.count +55, HeightScale(105));
    for (NSUInteger i = 0; i < _IconTitleArray.count; i++)  {
        
        CGFloat originX = (i+(5 *i))+(i *  HeightScale(80) );
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(originX, 0, HeightScale(80), HeightScale(105))];
        [_scrollView addSubview:view];
        
        UIButton *singleRecognizer = [[UIButton alloc] initWithFrame:CGRectMake(originX, 0, HeightScale(80), HeightScale(105))];
        [singleRecognizer addTarget:self action:@selector(singleViewRecognizerTap:) forControlEvents:(UIControlEventTouchUpInside)];
        singleRecognizer.tag = i+10;
        [_scrollView addSubview:singleRecognizer];
        
        UIImageView *imageViewScroll = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, HeightScale(50), HeightScale(50))];
        imageViewScroll.layer.cornerRadius = HeightScale(25);
        imageViewScroll.layer.masksToBounds = YES;
        [imageViewScroll sd_setImageWithURL:URL(_IconImageArray[i]) placeholderImage:IMG(@"")];
        
        [view addSubview:imageViewScroll];
        UILabel *lableViewScroll = [[UILabel alloc]initWithFrame:CGRectMake(2.5, HeightScale(80), HeightScale(80), HeightScale(15))];
        lableViewScroll.centerX = imageViewScroll.centerX;
        lableViewScroll.font = [UIFont systemFontOfSize:13];
        lableViewScroll.text = _IconTitleArray[i];
        lableViewScroll.textColor = [UIColor blackColor];
        lableViewScroll.textAlignment = NSTextAlignmentCenter;
        [view addSubview:lableViewScroll];
    }

}
-(void)setImageScr:(WXRecommendIMGModel *)imageScr{
    _imageScr = imageScr;
    [_imageArray addObject:imageScr.pic];
    MHLog(@"%@",_imageArray);
}
- (void)singleViewRecognizerTap:(UIButton *)sender{
    if (self.IconDetailClickActionBlock) {
        self.IconDetailClickActionBlock(sender.tag);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
