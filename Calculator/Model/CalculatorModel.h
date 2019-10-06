//
//  CalculatorModel.h
//  Calculator
//
//  Created by 鳞潜羽翔 on 2019/10/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct stack{
    double num;
    struct stack *next;
}Num;

typedef struct optr {
    char ch;
    struct optr *next;
}OPTR;

@interface CalculatorModel : NSObject 
@property (nonatomic, copy) NSMutableString *messageString;
@property (nonatomic, copy) NSNumber *result;
@property (nonatomic, copy) NSNumber *flagsucc;
//@property (nonatomic) OPTR *optr_top;
//@property (nonatomic) Num *num_top;
-(void)Exp;
@end

NS_ASSUME_NONNULL_END
