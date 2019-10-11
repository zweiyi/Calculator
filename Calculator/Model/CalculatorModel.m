//
//  CalculatorModel.m
//  Calculator
//
//  Created by 鳞潜羽翔 on 2019/10/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _flagsucc = [NSNumber numberWithInt:1];
    }
    return self;
}

Num * InitNum () {
    Num *top;
    top = (Num *)malloc(sizeof(Num));
    top->next = NULL;
    return top;
}

OPTR * InitOPTR () {
    OPTR *top;
    top = (OPTR *)malloc(sizeof(OPTR));
    top->next = NULL;
    return top;
}

//2:当前读入的小于栈顶的，1:当前读入的大于栈顶的，3:当前读入的等于栈顶的
int compare (char ch_top, char ch_cur) {
    int cmp[7][7]  = {  { 2, 2, 1, 1, 1, 2, 2 },
                        { 2, 2, 1, 1, 1, 2, 2 },
                        { 2, 2, 2, 2, 1, 2, 2 },
                        { 2, 2, 2, 2, 1, 2, 2 },
                        { 1, 1, 1, 1, 1, 3, 0 },
                        { 2, 2, 2, 2, 0, 2, 2 },
                        { 1, 1, 1, 1, 1, 0, 3 }  };
    
    char *opset = "+-*/()#";
    int i, m_top, m_cur;
//    NSLog(@"top %c and %c", ch_top, ch_cur);
    for(i = 0; i < 7; i++) {
        if(ch_top == opset[i]) {
            m_top = i;
        }
        if(ch_cur == opset[i]) {
            m_cur = i;
        }
    }
//    NSLog(@"bijiao %d", cmp[m_top][m_cur]);
    return cmp[m_top][m_cur];
    
    
}

void PushNum(Num *top, double data) {
    Num *pnew;
    pnew = (Num *)malloc(sizeof(Num));
    pnew->num = data;
    pnew->next = top->next;
    top->next = pnew;
}

void PushOPTR(OPTR *top, char data) {
    OPTR *pnew;
    pnew = (OPTR *)malloc(sizeof(OPTR));
    pnew->ch = data;
    pnew->next = top->next;
    top->next = pnew;
}

double PopNum(Num *top) {
    Num *pdel , *p;
    double data;
    p = top->next;
    if(top->next == NULL) {
        return 0;
    }
    pdel = top->next;
    //printf("num--%d", pdel->num);
    data = pdel->num;
    top->next = pdel->next;
    free(pdel);
    return data;
    
}

char PopOPTR(OPTR *top) {
    OPTR *pdel;
    char ch;
    if(top->next == NULL) {
        printf("栈空");
        exit(1);
    } else {
        pdel = top->next;
        ch = pdel->ch;
        top->next = pdel->next;
        free(pdel);
    }
    return ch;
}

char GetOPTR(OPTR *top) {
    return top->next->ch;
}

double GetNum(Num *top) {
    return top->next->num;
}


double Execute(double num1, char ch, double num2) {
    double result;
    switch(ch) {
        case '+':
            result = num1 + num2;
            break;
        case '-':
            result =  num1 - num2;
            break;
        case '*':
            result =  num1 * num2;
            break;
        case '/':
            result =  num1 / num2;
            break;
    }
//    NSLog(@"%f %c %f", num1, ch, num2);
    return result;
}

int Inopset(char ch) {
    int i;
    char *opset = "+-*/()#";
    for(i = 0; i < 7; i++) {
        if(ch == opset[i]) {
            return 1;
        }
    }
    return 0;
}

-(void)IsRight:(const char *) string {
    char ch;
    int len;
    int top = 0;
    len = (int)strlen(string);
    _flagsucc = [NSNumber numberWithInt:1];
    if (string[0] == '.') {
        _flagsucc = 0;
    }
    int numflag = 0;
    //括号匹配，2.3.3.3
    for (int i = 0; i < len; i++) {
        ch = string[i];
        if (ch == '(') {
            top++;
        }
        if (ch == ')') {
            if (top == 0) {
                _flagsucc = 0;
                break;
            } else {
                top--;
            }
        }
        if (!Inopset(ch) && ch != '(' && ch != ')') {
            numflag = 1;
        }
    
    }
    if (top != 0) {
        _flagsucc = 0;
    } else {
        ;
    }
    if (!numflag) {
        _flagsucc = 0;
    }
    
    for (int i = 0; i < len - 1; i++) {
        if (string[i] == ')' && !Inopset(string[i + 1])) {
            _flagsucc = 0;
            break;
        }
        if (Inopset(string[i]) && Inopset(string[i + 1]) && string[i] != '(' && string[i] != ')' && string[i + 1] != '(' && string[i + 1] != ')') {
            _flagsucc = 0;
            break;
        }
    }
    
    for (int i = 1; i < len - 1; i++) {
        //+.3
        if ( Inopset(string[i - 1]) && (string[i] == '.') && !Inopset(string[i + 1]) && (string[i + 1] != '.') ){
            _flagsucc = 0;
            break;
        }
    }
    
   
}

-(void)Exp {
    int len, i = 0;
    int flag = 0;   //判断是减号还是负号
   const char *mess;
    char ch, opch;
    double data, num1, num2, res;
    mess = [_messageString cStringUsingEncoding:NSUTF8StringEncoding];
    len = (int) strlen(mess);
    OPTR *optr_top;
    Num *num_top;
    optr_top = InitOPTR();
    num_top = InitNum();
    PushOPTR(optr_top, '#');
    ch = mess[i];
    [self IsRight:mess];
    //如果表达式输入正确
    if (_flagsucc != 0) {
        while (ch != '#' || GetOPTR(optr_top) != '#') {
            //如果第一个为负数
            if (mess[0] == '-') {
                i++;
                ch = mess[i];
                if (!Inopset(ch)) {
                    //                NSLog(@"ch === %c", ch);
                    data = ch - '0';
                    i++;
                    ch = mess[i];
                    int flag = 0;       //含小数点
                    while (!Inopset(ch)) {
                        //                    NSLog(@"data == %f", data);
                        if (ch == '.') {
                            flag = 1;
                            i++;
                            ch = mess[i];
                            continue;
                        }
                        if (flag) {
                            data = data + (ch - '0') * pow(10, -flag);
                            flag++;
                            //data = data * 10 + ch - '0';
                            //                        NSLog(@"1=");
                        } else {
                            //flag = 1;
                            data = data * 10 + ch - '0';
                        }
                        i++;
                        ch = mess[i];
                        //                    NSLog(@"data == %f", data);
                    }
                    data = -data;
                    PushNum(num_top, data);
                }
            } else if (!Inopset(ch)) {
//                NSLog(@"ch === %c", ch);
                data = ch - '0';
                i++;
                ch = mess[i];
                int flagpoint = 0;       //含小数点
                while (!Inopset(ch)) {
//                    NSLog(@"data == %f", data);
                    if (ch == '.') {
                        flagpoint = 1;
                        i++;
                        ch = mess[i];
                        continue;
                    }
                    if (flagpoint) {
                        data = data + (ch - '0') * pow(10, -flagpoint);
                        flagpoint++;
                        //data = data * 10 + ch - '0';
//                        NSLog(@"1=");
                    } else {
                        //flag = 1;
                        data = data * 10 + ch - '0';
                    }
                    i++;
                    ch = mess[i];
//                    NSLog(@"data == %f", data);
                }
                
                if (flag == 1) {
                    PushNum(num_top, data * (-1));
                } else {
                    PushNum(num_top, data);
                }
            } else {
                char ch1 = mess[i-1];
                if (ch1 == '(' && ch == '-') {
                    flag = 1;
                    i++;
                    ch = mess[i];
                    continue;
                } else {
                    flag = 0;
                }
                switch (compare(GetOPTR(optr_top), ch)) {
                    case 1:
                        PushOPTR(optr_top, ch);
                        i++;
                        ch = mess[i];
                        break;
                    case 2:
                        num2 = PopNum(num_top);
                        num1 = PopNum(num_top);
                        opch = PopOPTR(optr_top);
                        res = Execute(num1, opch, num2);
//                        NSLog(@"%f+%f = %f", num1, num2, res);
                        PushNum(num_top, res);
                        break;
                    case 3:
                        opch = PopOPTR(optr_top);
                        i++;
                        ch = mess[i];
                        break;
                }
            }
        }
        _result = [NSNumber numberWithFloat:GetNum(num_top)];
    }
    
}

@end
