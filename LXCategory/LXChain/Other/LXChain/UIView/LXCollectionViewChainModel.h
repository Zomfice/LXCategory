//
//  LXCollectionViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXCollectionViewChainModel;
@interface LXCollectionViewChainModel : LXScrollViewChainModel<LXCollectionViewChainModel *>

LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ collectionViewLayout)(UICollectionViewLayout *collectionViewLayout);
LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ delegate)(id<UICollectionViewDelegate> delegate);
LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ dataSource)(id<UICollectionViewDataSource> dataSource);
LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ allowsSelection)(BOOL allowsSelection);

LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ allowsMultipleSelection)(BOOL allowsMultipleSelection);

LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ registerCellClass)(Class cellClass, NSString *identifier);

LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ registerCellNib)(UINib * nib, NSString *identifier);

LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ registerViewClass)(Class viewClass, NSString *identifier, NSString *kind);

LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel *(^ registerViewNib)(UINib * viewNib, NSString *identifier, NSString *kind);

LXCATEGORY_CHAIN_PROPERTY LXCollectionViewChainModel * (^ adJustedContentIOS11)(void);
@end
LXCreate(UICollectionView)
static inline UICollectionView *UICollectionViewCreateWithLayout(UICollectionViewFlowLayout *layout){
    return [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
}
LXCATEGORY_EXINTERFACE(UICollectionView, LXCollectionViewChainModel)
NS_ASSUME_NONNULL_END
