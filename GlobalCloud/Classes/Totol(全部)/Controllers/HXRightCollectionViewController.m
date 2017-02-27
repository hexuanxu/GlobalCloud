//
//  HXRightCollectionViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/23.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXRightCollectionViewController.h"
#import "HXCollectionViewCell.h"
#import "rightCollectionModel.h"

@interface HXRightCollectionViewController ()

@end

@implementation HXRightCollectionViewController

static NSString * const reuseIdentifierID = @"HXCollectionViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerNib:[UINib nibWithNibName:@"HXCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifierID];
     self.collectionView.backgroundColor = UIColorFromRGBA(0xf3f3f3, 1.0);
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataSouce.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    rightCollectionModel *model = self.dataSouce[indexPath.item];
    HXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierID forIndexPath:indexPath];
    cell.model = model;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    
    HXCollectionViewCell *cell = (HXCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    HXLog(@"%lu--%@",indexPath.row,cell.nameLabel.text);

}


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
