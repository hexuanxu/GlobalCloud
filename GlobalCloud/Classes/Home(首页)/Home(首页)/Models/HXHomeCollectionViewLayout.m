//
//  EPGCommunityCollectionViewLayout.m
//  EnterpriseParkII
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 集联. All rights reserved.
//

#import "HXHomeCollectionViewLayout.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface HXHomeCollectionViewLayout()
@property(assign,nonatomic) CGFloat scrollHeight;

@property(nonatomic,strong)NSArray *dataSource;

@end
@implementation HXHomeCollectionViewLayout


-(instancetype)init{
    
    if (self = [super init]) {
    
        _dataSource  = @[@"100",@"100",@"201",@"100",@"100"];
        
    }
    return self;
}

-(CGSize)collectionViewContentSize{
    
    CGFloat  SectionOneH=300;
    CGFloat  SectionTwoH;
    
    if ([self.collectionView numberOfSections]>1) {
        SectionTwoH=[self.collectionView numberOfItemsInSection:1]* 120 / 3;
    }else{
        SectionTwoH=0;
    }
    CGFloat ContentSizeHeight=SectionTwoH+SectionOneH+20;
    return CGSizeMake(self.collectionView.bounds.size.width,
                      ContentSizeHeight);
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
  
    NSMutableArray *attributesArray=[[NSMutableArray alloc]init];
    NSInteger cellGroup=[self.collectionView numberOfSections];
    for (int j=0; j<cellGroup;j++ ) {
        NSInteger cellCount=[self.collectionView numberOfItemsInSection:j];
        for (int i=0; i<cellCount; i++) {
            NSIndexPath *indexpath=[NSIndexPath indexPathForItem:i inSection:j];
            UICollectionViewLayoutAttributes *attributes =[self layoutAttributesForItemAtIndexPath:indexpath];
            [attributesArray addObject:attributes];
        }
    }

    return attributesArray;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   UICollectionViewLayoutAttributes* attribute= [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
   
    CGFloat line_S = 1;
    CGFloat line_H=1;
    
    CGFloat firstW = (WIDTH-1)/2;
    CGFloat firstH = [self.dataSource[indexPath.row] floatValue];
    CGFloat firstY = (indexPath.item /2 )*(line_H+100);
    CGFloat firstX = (indexPath.item%2)*((WIDTH)/2+0.5);


    CGFloat itemHeight=120;
    CGFloat itemWidth=WIDTH/3;
    CGFloat leftx=(indexPath.item%3)*(line_S+itemWidth);
    CGFloat lefty=303+(indexPath.item/3)*(line_H+itemHeight);
    
    CGFloat threeW =firstW;
    CGFloat threeH = 70;
    CGFloat threeY = itemHeight + 304 +(indexPath.item/2 )*(line_H+threeH);
    CGFloat threeX = (indexPath.item%2)*(WIDTH/2+0.5);
    
    if (indexPath.section==0) {
        
        if (indexPath.item ==4) {
            attribute.frame = CGRectMake(firstW+firstX+1, firstY, firstW, firstH);
        }else{
            attribute.frame = CGRectMake(firstX, firstY, firstW, firstH);
        }
    }else if(indexPath.section == 1){
        
         attribute.frame = CGRectMake(leftx, lefty, itemWidth,itemHeight);
    }else{
        
         attribute.frame = CGRectMake(threeX, threeY,threeW,threeH);
    }
    return attribute;
}


@end
