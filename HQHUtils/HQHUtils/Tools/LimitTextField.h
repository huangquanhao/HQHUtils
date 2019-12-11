//
//  LimitTextField.h
//  HexMeet
//
//  Created by quanhao huang on 2018/8/6.
//  Copyright © 2018年 fo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LimitTextField : UITextField
/**最多输入长度*/
@property(nonatomic,assign)int maxTextLength;
@property(nonatomic,copy)NSString *type;
@end
