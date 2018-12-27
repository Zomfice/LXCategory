//
//  WTCommonNavigationBar.m
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import "WTCommonNavigationBar.h"

@interface WTCommonNavigationBar()
@property (nonatomic, strong) NSArray * buttonClass;
@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;
@property (nonatomic, strong) NSMutableDictionary * statusDic;
@property (nonatomic, assign) NSInteger  currentTag;
@end

@implementation WTCommonNavigationBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _statusDic = [NSMutableDictionary dictionary];
    _currentTag = -999;
    self.backgroundColor = [UIColor whiteColor];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(naviTap)]];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)naviTap{
    if ([_delegate respondsToSelector:@selector(navigationClick:)]) {
        [_delegate navigationClick:self];
    }
}

- (void)setDelegate:(id<WTCommonNavigationBarDelegate>)delegate{
    if (!delegate) return;
    _delegate = delegate;
    if ([_delegate respondsToSelector:@selector(buttonClasses)]) {
        self.buttonClass = [delegate buttonClasses];
    }else{
        self.buttonClass = @[@"",@"",@""];
    }
}

- (UIButton *)leftButton{
    if (!_leftButton && _delegate) {
        _leftButton = [[self getButtonClassIndex:0] buttonWithType:UIButtonTypeCustom];
        [_leftButton setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:17];
        _leftButton.userInteractionEnabled = NO;
        [self.leftView addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.top.bottom.mas_offset(0);
            make.right.mas_offset(-20);
        }];
    }
    return _leftButton;
}

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [UIView new];
        [self addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.bottom.equalTo(self.line.mas_top);
            make.top.mas_offset(StatusBarHeight);
            make.width.lessThanOrEqualTo(@(100));
        }];
        [_leftView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftViewTap)]];
    }
    return _leftView;
}

- (void)leftViewTap{
    if ([_delegate respondsToSelector:@selector(leftButtonTap:)]) {
        [_delegate leftButtonTap:_leftButton];
    }
}

- (UIButton *)middleButton{
    if (!_middleButton) {
        _middleButton = [[self getButtonClassIndex:1] buttonWithType:UIButtonTypeCustom];
        _middleButton.titleLabel.font = [UIFont systemFontOfSize:17];
        _middleButton.titleLabel.numberOfLines = 1;
        [_middleButton setTitleColor:[UIColor colorWithHexString:@"474747"] forState:UIControlStateNormal];
        [self addSubview:_middleButton];
        [_middleButton mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self);
             make.width.lessThanOrEqualTo(@([UIScreen mainScreen].bounds.size.width - 140));
             make.top.mas_offset(StatusBarHeight);
             make.bottom.equalTo(self.line.mas_top);
         }];
        [_middleButton addTarget:self action:@selector(middleButtonTap) forControlEvents:UIControlEventTouchUpInside];
    }
    return _middleButton;
}

- (void)middleButtonTap{
    if ([_delegate respondsToSelector:@selector(middleButtonTap:)]) {
        [_delegate middleButtonTap:_middleButton];
    }
}

- (UIButton *)rightButton{
    if (!_rightButton && _delegate) {
        _rightButton = [[self getButtonClassIndex:2] buttonWithType:UIButtonTypeCustom];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_rightButton setTitleColor:[UIColor colorWithHexString:@"474747"] forState:UIControlStateNormal];
        [self.rightView addSubview:_rightButton];
        _rightButton.userInteractionEnabled = NO;
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.mas_offset(-10);
             make.top.bottom.mas_offset(0);
             make.right.mas_offset(-20);
         }];
    }
    return _rightButton;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [UIView new];
        [self addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(0);
            make.bottom.equalTo(self.line.mas_top);
            make.top.mas_offset(StatusBarHeight);
            make.width.lessThanOrEqualTo(@(100 *UTILS_SCALE));
        }];
        [_rightView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightViewTap)]];
    }
    return _rightView;
}

- (void)rightViewTap{
    if ([_delegate respondsToSelector:@selector(rightButtonTap:)]) {
        [_delegate rightButtonTap:_leftButton];
    }
}

- (Class)getButtonClassIndex:(NSInteger)index{
    if (_buttonClass.count <= index || index < 0) return [UIButton class];
    
    NSString *clas = _buttonClass[index];
    Class class;
    if (clas.length == 0) {
        class = [UIButton class];
    }else{
        class = NSClassFromString(clas);
        if (!class || ![class isKindOfClass:[UIButton class]]) {
            class = [UIButton class];
        }
    }
    return class;
}

- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor colorWithHexString:@"dbdbdb"];
        [self addSubview:_line];
    }
    return _line;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    if ([_delegate respondsToSelector:@selector(navigationEventsShouldPass)]) {
        if ([_delegate navigationEventsShouldPass]) {
            if (hitView == self) {
                return nil;
            }
        }
    }
    return hitView;
}

- (void)setTag:(NSInteger)tag{
    if (self.currentTag == tag) return;
    nav_Block block = _statusDic[@(tag)];
    if (block) {
        self.currentTag = tag;
        block(self);
    }
}

- (void)setupTag:(NSInteger)tag WithBlock:(nav_Block)block{
    if (block) {
        [_statusDic setObject:block forKey:@(tag)];
    }else{
        [_statusDic removeObjectForKey:@(tag)];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
