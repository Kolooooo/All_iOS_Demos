
// http://blog.csdn.net/sunnyboy9/article/details/51254543
/*
 * 准备演员--->CALayer，规定电影的主角是谁
 * 准备剧本--->CAAnimation，规定电影该怎么演，怎么走，怎么变换
 * 开拍--->AddAnimation，开始执行
 */


#pragma mark keyPath
/*
     transform.scale = 比例轉換
     transform.scale.x = 闊的比例轉換
     transform.scale.y = 高的比例轉換
     transform.rotation.z = 平面圖的旋轉
     opacity = 透明度
     margin
     zPosition
     backgroundColor    背景颜色
     cornerRadius    圆角
     borderWidth
     bounds
     contents
     contentsRect
     cornerRadius
     frame
     hidden
     mask
     masksToBounds
     opacity
     position
     shadowColor
     shadowOffset
     shadowOpacity
     shadowRadius
 */


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WAxis)
{
    WAxisX = 0,
    WAxisY,
    WAxisZ
};

// Degrees to radians
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

@interface CAAnimation (WAnimation)

/**
 *  breathing forever
 *
 *  @param time duritaion, from clear to fully seen
 *
 *  @return animation obj
 */
+(CABasicAnimation *)opacityForever_Animation:(float)time;

/**
 *  breathing with fixed repeated times
 *
 *  @param repeatTimes times
 *  @param time        duritaion, from clear to fully seen
 *
 *  @return animation obj
 */
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;

/**
 *  //rotate
 *
 *  @param dur         duration
 *  @param degree      rotate degree in radian(弧度)
 *  @param axis        axis
 *  @param repeatCount repeat count
 *
 *  @return animation obj
 */
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(WAxis)axis repeatCount:(int)repeatCount;


/**
 *  scale animation
 *
 *  @param fromScale   the original scale value, 1.0 by default
 *  @param toScale     target scale
 *  @param time        duration
 *  @param repeatTimes repeat counts
 *
 *  @return animaiton obj
 */
+(CABasicAnimation *)scaleFrom:(CGFloat)fromScale toScale:(CGFloat)toScale durTimes:(float)time rep:(float)repeatTimes;
/**
 *  shake
 *
 *  @param repeatTimes time
 *  @param time        duration
 *  @param obj         always be CALayer at present
 *  @return aniamtion obj
 */
+(CAKeyframeAnimation *)shake_AnimationRepeatTimes:(float)repeatTimes durTimes:(float)time forObj:(id)obj;

/**
 *  bounce
 *
 *  @param repeatTimes time
 *  @param time        duration
 *  @param obj         always be CALayer at present
 *  @return aniamtion obj
 */
+(CAKeyframeAnimation *)bounce_AnimationRepeatTimes:(float)repeatTimes durTimes:(float)time forObj:(id)obj;

@end
