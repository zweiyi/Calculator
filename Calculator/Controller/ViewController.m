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

@interface ViewController ()

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
    float num1 = 5.3;
    float num2 = 9.2;
    float reslut = num1 + 2.6 - num2;
    NSNumber *num = [NSNumber numberWithDouble:reslut];
    NSLog(@"%f", reslut);
    NSString *str = [NSString stringWithFormat:@"%@", num];
    NSLog(@"%@",str );
}

-(void)clickButton:(UIButton *)button {
//    double res;
    if (button.tag == 100) {
        self.calview.textView.text = @"";
        [_dataString setString:@""];
    } else if (button.tag == 107) {
        NSLog(@"dengyu");
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
        [_dataString appendString:@"/"];
        self.calview.textView.text = _dataString;
//        [_dataString appendString:@"/"];
    } else {
        [_dataString appendString:button.titleLabel.text];
        self.calview.textView.text = _dataString;
    }
}

@end
