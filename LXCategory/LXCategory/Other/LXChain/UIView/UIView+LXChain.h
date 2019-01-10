//
//  UIView+LXChain.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXViewChainHeader.h"
#import "CALayer+LXChain.h"
#import "LXGestureChainHeader.h"
NS_ASSUME_NONNULL_BEGIN
@interface UIView (LXChain)

LXCATEGORY_STRONG_PROPERTY LXViewChainModel *(^ addView)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXLabelChainModel *(^ addLabel)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXImageViewChainModel *(^ addImageView)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXControlChainModel *(^ addControl)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXTextFieldChainModel *(^ addTextField)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXButtonChainModel *(^ addButton)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXSwitchChainModel *(^ addSwitch)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXScrollViewChainModel *(^ addScrollView)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXTextViewChainModel *(^ addTextView)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXTableViewChainModel *(^ addTableView)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXCollectionViewChainModel *(^ addCollectionView)(NSInteger tag);

LXCATEGORY_STRONG_PROPERTY LXLayerChainModel *(^ addLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXShaperLayerChainModel *(^ addShaperLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXEmiiterLayerChainModel *(^ addEmiiterLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXScrollLayerChainModel *(^ addScrollLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXTextLayerChainModel *(^ addTextLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXTiledLayerChainModel *(^ addTiledLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXTransFormLayerChainModel *(^ addTransFormLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXGradientLayerChainModel *(^ addGradientLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXReplicatorLayerChainModel *(^ addReplicatorLayer)(void);

@end

NS_ASSUME_NONNULL_END
