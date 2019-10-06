//
//  CalView.h
//  Calculator
//
//  Created by 鳞潜羽翔 on 2019/10/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalView : UIView
//@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *AcButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *divisionButton;
@property (nonatomic, strong) UIButton *multiplyButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *subtractButton;
@property (nonatomic, strong) UIButton *resultButton;
@property (nonatomic, strong) UIButton *pointButton;
@property (nonatomic, strong) UIButton *oneButton;
@property (nonatomic, strong) UIButton *twoButton;
@property (nonatomic, strong) UIButton *threeButton;
@property (nonatomic, strong) UIButton *fourButton;
@property (nonatomic, strong) UIButton *fiveButton;
@property (nonatomic, strong) UIButton *sixButton;
@property (nonatomic, strong) UIButton *sevenButton;
@property (nonatomic, strong) UIButton *eightButton;
@property (nonatomic, strong) UIButton *nineButton;
@property (nonatomic, strong) UIButton *zeroButton;
@property (nonatomic, copy) NSMutableArray <UIButton *> *buttonArray;



@end

NS_ASSUME_NONNULL_END
