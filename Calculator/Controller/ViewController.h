//
//  ViewController.h
//  Calculator
//
//  Created by 鳞潜羽翔 on 2019/10/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalView.h"
#import "CalculatorModel.h"

@interface ViewController : UIViewController
@property (nonatomic, strong) CalView *calview;
@property (nonatomic, strong) CalculatorModel *calculatorModel;
@property (nonatomic, strong) NSMutableString *dataString;

@end

