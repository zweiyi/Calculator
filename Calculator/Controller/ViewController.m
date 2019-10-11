//
//  ViewController.m
//  Calculator
//
//  Created by 鳞潜羽翔 on 2019/10/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CalculatorModel.h"

@interface ViewController () {
    int flagpoint;
    int flagstr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //让状态栏变成白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    _calview = [[CalView alloc] init];
    [self.view addSubview:_calview];
    [_calview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(44);
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
//    _dataString = [NSMutableString string];
      _dataString = [[NSMutableString alloc] init];
    
    _calculatorModel = [[CalculatorModel alloc] init];
    
    for (UIButton *button in self.calview.buttonArray) {
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    flagpoint = 0;
    flagstr = 0;
}

-(void)clickButton:(UIButton *)button {
//    double res;
    
    if (button.tag == 100) {
        self.calview.textView.text = @"";
        [_dataString setString:@""];
        flagpoint = 0;
    } else if (button.tag == 107) {
//        NSLog(@"dengyu");
        [_dataString appendString:@"#"];
        _calculatorModel.messageString = _dataString;
        [_calculatorModel Exp];
        if (self.calculatorModel.flagsucc) {
            NSString *str = [NSString stringWithFormat:@"%@", self.calculatorModel.result];
            [_dataString setString:str];
            self.calview.textView.text = _dataString;
        } else {
            self.calview.textView.text = @"出错了";
        }
    } else if (button.tag == 103) {

//        NSMutableString *str = [NSMutableString stringWithString:_dataString];
//        [str appendString:@"÷"];
        
        flagpoint = 0;
        if (_dataString.length >= 1) {
            NSString *str = [NSString stringWithString: [_dataString substringFromIndex:_dataString.length - 1]];
            if (![str isEqualToString:@"/"] && ![str isEqualToString:@"*"] && ![str isEqualToString:@"+"] && ![str isEqualToString:@"-"]) {
                [_dataString appendString:@"/"];
            }
        }
        
        self.calview.textView.text = _dataString;
    } else {
        //点击小数点
        if ([button.titleLabel.text  isEqual: @"."]) {
            if ([_dataString isEqual:@""]) {
                [_dataString setString:@"0."];
                self.calview.textView.text = _dataString;
            } else {
                if (flagpoint == 0) {
                    NSString *str1 = [NSString stringWithString:[_dataString substringFromIndex:_dataString.length - 1]];
                    
                    //防止“+.”等情况出现
                    if (![str1 isEqualToString:@"/"] && ![str1 isEqualToString:@"*"] && ![str1 isEqualToString:@"+"] && ![str1 isEqualToString:@"-"] && ![str1 isEqualToString:@"("] && ![str1 isEqualToString:@")"]) {
                        flagpoint = 1;
                        [_dataString appendString:button.titleLabel.text];
                    }
                }
            }
            
        } else if ([button.titleLabel.text isEqual:@"0"] /*&& flagpoint == 0 && _dataString.length >= 1*/) {            //点击零
            if (_dataString.length >= 1 && flagpoint == 0) {
                NSString *str = [NSString stringWithString: [_dataString substringFromIndex:_dataString.length - 1]];
                if (![str isEqualToString:button.titleLabel.text]) {
                    [_dataString appendString:button.titleLabel.text];
                }
            } else {
                [_dataString appendString:button.titleLabel.text];
            }
            
        } else {                    //点击其余按钮
            
            NSString *str = button.titleLabel.text;
            if ([str isEqual:@"+"] || [str isEqual:@"-"] || [str isEqual:@"*"] || [str isEqual:@"("] || [str isEqual:@")"]) {
                flagpoint = 0;
                
                
                if ([str isEqualToString:@"("] || [str isEqualToString:@")"]) {
                    if (_dataString.length >= 1 )  {
                        if ([str isEqualToString:@")"]) {
                            NSString *str1 = [NSString stringWithString:[_dataString substringFromIndex:_dataString.length - 1]];
                            if (![str1 isEqualToString:@"("] &&![str1 isEqualToString:@"/"] && ![str1 isEqualToString:@"*"] && ![str1 isEqualToString:@"+"] && ![str1 isEqualToString:@"-"]
                                && ![str1 isEqualToString:@"."]) {
                                [_dataString appendString:button.titleLabel.text];
                            }
                        } else {
                            NSString *str1 = [NSString stringWithString:[_dataString substringFromIndex:_dataString.length - 1]];
                            if ([str1 isEqualToString:@"("] || [str1 isEqualToString:@"/"] || [str1 isEqualToString:@"*"] || [str1 isEqualToString:@"+"] || [str1 isEqualToString:@"-"]) {
                                [_dataString appendString:button.titleLabel.text];
                            }
                        }
                        
                    } else {
                        if ([str isEqualToString:@"("]) {
                            [_dataString appendString:button.titleLabel.text];
                        }
                    }
                    
               } else
                
                //负数的第一次输入
                if([str isEqualToString:@"-"]) {
                    if (_dataString.length == 0) {
                        [_dataString appendString:button.titleLabel.text];
                    } else {
                        NSString *str1 = [NSString stringWithString:[_dataString substringFromIndex:_dataString.length - 1]];
                        if (![str1 isEqualToString:@"/"] && ![str1 isEqualToString:@"*"] && ![str1 isEqualToString:@"+"] && ![str1 isEqualToString:@"-"]) {
                            [_dataString appendString:button.titleLabel.text];
                        }
                    }
                } else {
                    if (_dataString.length >= 1) {
                        NSString *str1 = [NSString stringWithString:[_dataString substringFromIndex:_dataString.length - 1]];
                        if (![str1 isEqualToString:@"/"] && ![str1 isEqualToString:@"*"] && ![str1 isEqualToString:@"+"] && ![str1 isEqualToString:@"-"] &&![str1 isEqualToString:@"("] && ![str1 isEqualToString:@")"]) {
                            [_dataString appendString:button.titleLabel.text];
                        }
                    }
                }
                
                //连续运算符的输入判断
//                if (_dataString.length >= 1) {
//                    NSString *lastStr = [NSString stringWithString:[_dataString substringFromIndex:_dataString.length - 1]];
//                    if (![lastStr isEqualToString:@"/"] && ![lastStr isEqualToString:@"*"] && ![lastStr isEqualToString:@"+"] && ![lastStr isEqualToString:@"-"]) {
//                        [_dataString appendString:button.titleLabel.text];
//                    }
//                }
                
            } else {
                [_dataString appendString:button.titleLabel.text];
            }
        }
        
        self.calview.textView.text = _dataString;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
