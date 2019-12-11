//
//  LimitTextField.m
//  HexMeet
//
//  Created by quanhao huang on 2018/8/6.
//  Copyright © 2018年 fo. All rights reserved.
//

#import "LimitTextField.h"
#import <AudioToolbox/AudioToolbox.h>
@implementation LimitTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.maxTextLength = 20;
    //添加通知监听文本状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:self];
}
-(void)textBeginEditing:(NSNotification*)note
{
    [self changBorderwithNote:note];
    
}

-(void)textDidEndEditing:(NSNotification*)note
{
    [self changBorderwithNote:note];
    
    
}

-(void)textDidChange:(NSNotification*)note
{
    [self changBorderwithNote:note];
}

-(void)changBorderwithNote:(NSNotification*)editing
{
    if (![editing.object isEqual:self])return;
    if ([editing.name isEqualToString:UITextFieldTextDidBeginEditingNotification])
    {
        
    }else if ([editing.name isEqualToString:UITextFieldTextDidEndEditingNotification])
    {

        
    }else if ([editing.name isEqualToString:UITextFieldTextDidChangeNotification]){
        
        if (self.maxTextLength!=0)
        {
            if (self.text.length >self.maxTextLength) {
                [self judemaxText];
            }
        }
    }
    
}

//限制最大输入字数
-(void)judemaxText
{
    if (_maxTextLength>0)
    {
        // 键盘输入模式
        NSString *lang=[[UIApplication sharedApplication]textInputMode].primaryLanguage;
        if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
            UITextRange *selectedRange = [self markedTextRange];
            //获取高亮部分
            UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if (self.text.length >= _maxTextLength) {
                    if (self.text.length>_maxTextLength)
                    {
                        [self addShakeAnimation];
                    }
                    NSString *newText=[self.text substringToIndex:_maxTextLength];
                    if (![self.text isEqualToString:newText])
                    {
                        self.text =newText;
                    }
                    
                }
            }
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
            else{
                
            }
        }
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        else{
            if (self.text.length >= _maxTextLength) {
                if (self.text.length>_maxTextLength)
                {
                    [self addShakeAnimation];
                }
                NSString *newText=[self.text substringToIndex:_maxTextLength];
                if (![self.text isEqualToString:newText])
                {
                    self.text =newText;
                }
            }
        }
        
    }
    
}

//添加抖动动画
-(void)addShakeAnimation
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    

    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat currentTx = self.transform.tx;
    
    //    animation.delegate = self;
    animation.duration = 0.5;
    animation.values = @[ @(currentTx), @(currentTx + 10), @(currentTx-8), @(currentTx + 8), @(currentTx -5), @(currentTx + 5), @(currentTx) ];
    animation.keyTimes = @[ @(0), @(0.225), @(0.425), @(0.6), @(0.75), @(0.875), @(1) ];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:animation forKey:@"kAFViewShakerAnimationKey"];
}

@end
