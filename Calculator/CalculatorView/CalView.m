//
//  CalView.m
//  Calculator
//
//  Created by 鳞潜羽翔 on 2019/10/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "CalView.h"
#import "Masonry.h"

@implementation CalView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
//    NSLog(@"%s", __FUNCTION__);
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = [UIColor blackColor];
        _textView.textColor = [UIColor whiteColor];
        _textView.font = [UIFont systemFontOfSize:50];
        _textView.textAlignment = NSTextAlignmentRight;
//        _textView.textAlignment = NSTextAlignmentCenter;
//        _textView.textContainerInset = UIEdgeInsetsMake();
        _textView.textContainerInset = UIEdgeInsetsMake(60, 0, 10, 0);
        [self addSubview:_textView];
        
        _buttonArray = [NSMutableArray array];
        
        _AcButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_AcButton];
        [_AcButton setTitle:@"AC" forState:UIControlStateNormal];
        _AcButton.tag = 100;
        [_buttonArray addObject:_AcButton];
        
        _leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_leftButton];
        [_leftButton setTitle:@"(" forState:UIControlStateNormal];
        _leftButton.tag = 101;
        [_buttonArray addObject:_leftButton];
        
        _rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_rightButton];
        [_rightButton setTitle:@")" forState:UIControlStateNormal];
        _rightButton.tag = 102;
        [_buttonArray addObject:_rightButton];
        
        _divisionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_divisionButton];
        [_divisionButton setTitle:@"÷" forState:UIControlStateNormal];
        _divisionButton.tag = 103;
        [_buttonArray addObject:_divisionButton];
        
        _multiplyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_multiplyButton];
        [_multiplyButton setTitle:@"*" forState:UIControlStateNormal];
        _multiplyButton.tag = 104;
        [_buttonArray addObject:_multiplyButton];
        
        _subtractButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_subtractButton];
        [_subtractButton setTitle:@"-" forState:UIControlStateNormal];
        _subtractButton.tag = 105;
        [_buttonArray addObject:_subtractButton];
        
        _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_addButton];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        _addButton.tag = 106;
        [_buttonArray addObject:_addButton];
        
        _resultButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_resultButton];
        [_resultButton setTitle:@"=" forState:UIControlStateNormal];
        _resultButton.tag = 107;
        [_buttonArray addObject:_resultButton];
        
        _oneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_oneButton];
        [_oneButton setTitle:@"1" forState:UIControlStateNormal];
        _oneButton.tag = 111;
        [_buttonArray addObject:_oneButton];
        
        _twoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_twoButton];
        [_twoButton setTitle:@"2" forState:UIControlStateNormal];
        _twoButton.tag = 112;
        [_buttonArray addObject:_twoButton];
        
        _threeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_threeButton];
        [_threeButton setTitle:@"3" forState:UIControlStateNormal];
        _threeButton.tag = 113;
        [_buttonArray addObject:_threeButton];
        
        _fourButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_fourButton];
        [_fourButton setTitle:@"4" forState:UIControlStateNormal];
        _fourButton.tag = 114;
        [_buttonArray addObject:_fourButton];
        
        _fiveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_fiveButton];
        [_fiveButton setTitle:@"5" forState:UIControlStateNormal];
        _fiveButton.tag = 115;
        [_buttonArray addObject:_fiveButton];
        
        _sixButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_sixButton];
        [_sixButton setTitle:@"6" forState:UIControlStateNormal];
        _sixButton.tag = 116;
        [_buttonArray addObject:_sixButton];
        
        _sevenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_sevenButton];
        [_sevenButton setTitle:@"7" forState:UIControlStateNormal];
        _sevenButton.tag = 117;
        [_buttonArray addObject:_sevenButton];
        
        _eightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_eightButton];
        [_eightButton setTitle:@"8" forState:UIControlStateNormal];
        _eightButton.tag = 118;
        [_buttonArray addObject:_eightButton];
        
        _nineButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_nineButton];
        [_nineButton setTitle:@"9" forState:UIControlStateNormal];
        _nineButton.tag = 119;
        [_buttonArray addObject:_nineButton];
        
        _zeroButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_zeroButton];
        [_zeroButton setTitle:@"0" forState:UIControlStateNormal];
        _zeroButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        _zeroButton.tag = 110;
        [_buttonArray addObject:_zeroButton];
        
        _pointButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_pointButton];
        [_pointButton setTitle:@"." forState:UIControlStateNormal];
        _pointButton.tag = 120;
        [_buttonArray addObject:_pointButton];
        
        for (UIButton *button in _buttonArray) {
            if (button.tag >= 100 && button.tag <= 120) {
                button.titleLabel.font = [UIFont systemFontOfSize:40];
            }
            
            if (button.tag >= 100 && button.tag < 103) {
                button.tintColor = [UIColor blackColor];
                button.backgroundColor = [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f];
                
            }
            
            //加减乘除的颜色设置
            if (button.tag >= 103 && button.tag <= 107) {
                [button setTintColor:[UIColor whiteColor]];
                button.backgroundColor = [UIColor colorWithRed:0.96f green:0.53f blue:0.00f alpha:1.00f];
            }
            
            //数字的颜色设置
            if (button.tag >= 110) {
                [button setTintColor:[UIColor whiteColor]];
                button.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
            }
            
            //设置外形
            if (button.tag >= 100 && button.tag != 110 && button.tag <= 120 ) {
                button.layer.cornerRadius = 45;
            } else {
                button.layer.cornerRadius = 35;
            }
        }
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@(self.bounds.size.height / 3));
    }];
    
    [_AcButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(self.bounds.size.width / 4 - 15));
        make.height.equalTo(@(self.bounds.size.width / 4 -15));
    }];
    
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom);
        make.left.equalTo(self.AcButton.mas_right).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom);
        make.left.equalTo(self.leftButton.mas_right).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_divisionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom);
        make.left.equalTo(self.rightButton.mas_right).offset(10);
       make.size.equalTo(self.AcButton);
    }];
    
    [_sevenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.AcButton);
        make.top.equalTo(self.AcButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_eightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftButton);
        make.top.equalTo(self.leftButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_nineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightButton);
        make.top.equalTo(self.rightButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_multiplyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.divisionButton);
        make.top.equalTo(self.divisionButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_fourButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sevenButton);
        make.top.equalTo(self.sevenButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_fiveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.eightButton);
        make.top.equalTo(self.eightButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_sixButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nineButton);
        make.top.equalTo(self.nineButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_subtractButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.multiplyButton);
        make.top.equalTo(self.multiplyButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fourButton);
        make.top.equalTo(self.fourButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fiveButton);
        make.top.equalTo(self.fiveButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sixButton);
        make.top.equalTo(self.sixButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.subtractButton);
        make.top.equalTo(self.subtractButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    
    [_pointButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.threeButton);
        make.top.equalTo(self.threeButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
    [_zeroButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.oneButton);
        make.top.equalTo(self.oneButton.mas_bottom).offset(10);
        make.right.equalTo(self.twoButton);
        make.bottom.equalTo(self.pointButton);
    }];
    
    [_resultButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addButton);
        make.top.equalTo(self.addButton.mas_bottom).offset(10);
        make.size.equalTo(self.AcButton);
    }];
    
}
@end
