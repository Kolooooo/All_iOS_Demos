

#import <UIKit/UIKit.h>

@interface UITextField (__Category)

/**
 设置Placeholder 字体颜色
 
 @param color 字体颜色
 */
- (void)__setPlaceholderColor:(UIColor *_Nonnull)color;

/**
 设置Placeholder 字体
 
 @param placeholderFont 字体
 */
- (void)__setPlaceholderFont:(UIFont *_Nonnull)placeholderFont;

/**
 设置输入框内容向左内边距/左内偏移
 
 @param leftPadding 左偏移数值
 */
- (void)__setLeftContentPadding:(CGFloat)leftPadding;

@end


#pragma mark 设置背景
/*
 * text.background = [UIImageimageNamed:@"dd.png"];
 UITextField 的背景，注意只有UITextBorderStyleNone的时候改属性有效
 * text.disabledBackground = [UIImageimageNamed:@"cc.png"]; 设置enable为no时，textfield的背景
 */

#pragma mark rightView 最右侧加图片
/*
 * 最右侧加图片是以下代码　 左侧类似
 UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right.png"]];
 text.rightView = image;
 text.rightViewMode = UITextFieldViewModeAlways;
 typedef enum {
 UITextFieldViewModeNever,
 UITextFieldViewModeWhileEditing,
 UITextFieldViewModeUnlessEditing,
 UITextFieldViewModeAlways
 } UITextFieldViewMode;
 */

#pragma mark 界面重写绘制行为
/*
 * 除了UITextField对象的风格选项，你还可以定制化UITextField对象，为他添加许多不同的重写方法，
 来改变文本字段的显示行为。这些方法都会返回一个CGRect结构，制定了文本字段每个部件的边界范围。以下方法都可以重写。
 
 – textRectForBounds:　　   　//重写来重置文字区域
 – drawTextInRect:　　     　 //改变绘文字属性.重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数，就不用调用super了.
 – placeholderRectForBounds:　//重写来重置占位符区域
 – drawPlaceholderInRect:　　 //重写改变绘制占位符属性.重写时调用super可以按默认图形属性绘制,
 若自己完全重写绘制函数，就不用调用super了.
 – borderRectForBounds:   　　//重写来重置边缘区域
 – editingRectForBounds:　　  //重写来重置编辑区域
 – clearButtonRectForBounds:  //重写来重置clearButton位置,改变size可能导致button的图片失真
 – leftViewRectForBounds:
 – rightViewRectForBounds:
 */

#pragma mark 操作键盘
/*
 * [text resignFirstResponder]; 在哪调用就能把receiver（text）对应的键盘往下收
 */

/*
 UITextField控件处理键盘弹出时遮住输入框的问题
 我们采取的方法就是在textField(有可能是其他控件)接收到弹出键盘事件时把self.view整体上移216px了(我们就以iPhone竖屏为例了)。
 
 - (void)textFieldDidBeginEditing:(UITextField *)textField{
 NSTimeInterval animationDuration = 0.30f;
 
 CGRect frame = self.view.frame;
 frame.origin.y -= 216;
 frame.size.height +=216;
 self.view.frame = frame;
 
 [UIView beginAnimations:@"ResizeView" context:nil];
 [UIView setAnimationDuration:animationDuration];
 
 self.view.frame = frame;
 
 [UIView commitAnimations];
 }
 
 - (BOOL)textFieldShouldReturn:(UITextField *)textField{
 NSTimeInterval animationDuration = 0.30f;
 
 CGRect frame = self.view.frame;
 frame.origin.y += 216;
 frame.size. height -= 216;
 self.view.frame = frame;
 
 // self.view移回原位置
 [UIView beginAnimations:@"ResizeView" context:nil];
 [UIView setAnimationDuration:animationDuration];
 
 self.view.frame = frame;
 
 [UIView commitAnimations];
 [textField resignFirstResponder];
 }
 */

#pragma mark 通知
/*
 UITextField 派生自UIControl，所以UIControl类中的通知系统在文本字段中也可以使用。
 除了UIControl类的标准事件，你还可以使用下列UITextField类特有的事件
 
 UITextFieldTextDidBeginEditingNotification
 UITextFieldTextDidChangeNotification
 UITextFieldTextDidEndEditingNotification
 当文本字段退出编辑模式时触发。通知的object属性存储了最终文本。
 
 因为文本字段要使用键盘输入文字，所以下面这些事件发生时，也会发送动作通知
 
 UIKeyboardWillShowNotification 　//键盘显示之前发送
 UIKeyboardDidShowNotification  　//键盘显示之后发送
 UIKeyboardWillHideNotification 　//键盘隐藏之前发送
 UIKeyboardDidHideNotification  　//键盘隐藏之后发送
 */

#pragma mark 设置键盘的样式
/*
 text.keyboardType = UIKeyboardTypeNumberPad;
 typedef enum {
 UIKeyboardTypeDefault,    　          默认键盘，支持所有字符
 UIKeyboardTypeASCIICapable,　         支持ASCII的默认键盘
 UIKeyboardTypeNumbersAndPunctuation,　标准电话键盘，支持＋＊＃字符
 UIKeyboardTypeURL,                    URL键盘，支持.com按钮 只支持URL字符
 UIKeyboardTypeNumberPad,              数字键盘
 UIKeyboardTypePhonePad,　 　           电话键盘
 UIKeyboardTypeNamePhonePad, 　         电话键盘，也支持输入人名
 UIKeyboardTypeEmailAddress, 　         用于输入电子 邮件地址的键盘
 UIKeyboardTypeDecimalPad,   　         数字键盘 有数字和小数点
 UIKeyboardTypeTwitter,     　          优化的键盘，方便输入@、#字符
 UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable,
 } UIKeyboardType;
 */

#pragma mark  实例：限制只能输入一定长度的字符
/*
 // string就是此时输入的那个字符 textField就是此时正在输入的那个输入框 返回YES就是可以改变输入框的值 NO相反
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;{
 　
 //按回车可以改变
 if ([string isEqualToString:@"\n"]){
 return YES;
 }
 
 // 得到输入框的内容
 NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
 
 if ([toBeString length] > 20) {
 textField.text = [toBeString substringToIndex:20];
 return NO;
 }
 
 return YES;
 }
 */

#pragma mark textfield did Change
/*
 // 第一步,对组件增加监听器 可以在viewDidLoad 方法中加入 textField 为你自定义输入框的名称
 [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
 
 // 第二步,实现回调函数
 - (void) textFieldDidChange:(id) sender {
 UITextField *_field = (UITextField *)sender;
 NSLog(@"%@",[_field text]);
 }
 */
