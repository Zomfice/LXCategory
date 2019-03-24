//
//  UIView+LXChain.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "UIView+LXChain.h"

#define LXCATEGORY_ADDVIEW(method, modelClass, ViewClass)\
- (modelClass * (^)(NSInteger tag))method    \
{   \
    return ^(NSInteger tag) {      \
        ViewClass *view = [[ViewClass alloc] init];       \
        [self addSubview:view];                            \
        modelClass *chainModel = [[modelClass alloc] initWithTag:tag andView:view]; \
        return chainModel;      \
    };      \
}
#define LXCATEGORY_ADDLAYER(method, modelClass, LayerClass)\
- (modelClass * _Nonnull (^)(void))method{\
return ^ (){\
    LayerClass *layer = [LayerClass layer];\
    modelClass *chainModel = [[modelClass alloc] initWithLayer:layer];\
    [self.layer addSublayer:layer];\
    return chainModel;\
};\
}


@implementation UIView (LXChain)

LXCATEGORY_ADDVIEW(addView, LXViewChainModel, UIView);
LXCATEGORY_ADDVIEW(addLabel, LXLabelChainModel, UILabel);
LXCATEGORY_ADDVIEW(addImageView, LXImageViewChainModel, UIImageView);
LXCATEGORY_ADDVIEW(addControl, LXControlChainModel, UIControl);
LXCATEGORY_ADDVIEW(addTextField, LXTextFieldChainModel, UITextField);
LXCATEGORY_ADDVIEW(addButton, LXButtonChainModel, UIButton);
LXCATEGORY_ADDVIEW(addSwitch, LXSwitchChainModel, UISwitch);
LXCATEGORY_ADDVIEW(addScrollView, LXScrollViewChainModel, UIScrollView);
LXCATEGORY_ADDVIEW(addTextView, LXTextViewChainModel, UITextView);
LXCATEGORY_ADDVIEW(addTableView, LXTableViewChainModel, UITableView);

- (LXCollectionViewChainModel * (^)(NSInteger tag))addCollectionView
{
    return ^(NSInteger tag) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = layout.minimumLineSpacing = 0;
        layout.headerReferenceSize = layout.footerReferenceSize = CGSizeZero;
        layout.sectionInset = UIEdgeInsetsZero;
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:view];
        LXCollectionViewChainModel *chainModel = [[LXCollectionViewChainModel alloc] initWithTag:tag andView:view];
        return chainModel;
    };
}

LXCATEGORY_ADDLAYER(addLayer, LXLayerChainModel, CALayer)
LXCATEGORY_ADDLAYER(addShaperLayer, LXShaperLayerChainModel, CAShapeLayer)
LXCATEGORY_ADDLAYER(addEmiiterLayer, LXEmiiterLayerChainModel, CAEmitterLayer)
LXCATEGORY_ADDLAYER(addScrollLayer, LXScrollLayerChainModel, CAScrollLayer)
LXCATEGORY_ADDLAYER(addTextLayer, LXTextLayerChainModel, CATextLayer)
LXCATEGORY_ADDLAYER(addTiledLayer, LXTiledLayerChainModel, CATiledLayer)
LXCATEGORY_ADDLAYER(addTransFormLayer, LXTransFormLayerChainModel, CATransformLayer)
LXCATEGORY_ADDLAYER(addGradientLayer, LXGradientLayerChainModel, CAGradientLayer)
LXCATEGORY_ADDLAYER(addReplicatorLayer, LXReplicatorLayerChainModel, CAReplicatorLayer)

@end
#undef LXCATEGORY_ADDVIEW
#undef LXCATEGORY_ADDLAYER
