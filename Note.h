
/**
 * Initialize the cocoapods to the target.
 *
 * 1. open the terminal 
 * 2. $ cd #targetName#.xcodeproj
 * 3. $ vim Podfile
 * 4. $ i (Edit)
        platform :ios, '8.0'
        target '#targetName#' do
            pod 'AFNetworking'
        end
 *
 * 5. $ pod install
 *
 *
 * Other method
 *
 * pod install --verbose --no-repo-update (update / initialize librarys)
 *
 */

/*
 * 性能优化
 * 
 * 少使用半透明，因为 cpu 需要计算半透明层与底层的显示效果
 *
 * UIImageView 里面的图片大小尽量与 UIImageView 的大小一致，避免显示时候需要压缩尺寸大小后重新显示
 */
