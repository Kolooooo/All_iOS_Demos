//
//  __Keyboard.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/3/17.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "__Keyboard.h"

@implementation __Keyboard

+ (void)__observerKeyboard:(id)target {
    [[NSNotificationCenter defaultCenter] addObserver:target selector:@selector(_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:target selector:@selector(_keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)_keyboardWillShow:(NSNotification *)note {
//    let userInfo = note.userInfo!
//    let keyBoardBounds = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//    let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
//
//    //键盘的偏移量
//    let deltaY = keyBoardBounds.size.height
//    let animations:(() -> Void) = { [weak self] in
//        self?.inputBigView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
//    }
//
//    if duration > 0 {
//        let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
//
//        UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
//    } else {
//        animations()
//    }
}

- (void)_keyboardWillHidden:(NSNotification *)note {
    
}

@end






