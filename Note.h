
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
 * pod install --verbose --no-repo-update  //update / initialize librarys
 *
 */


/* 访问权限
Privacy - Microphone Usage Description //麦克风权限
Privacy - Contacts Usage Description   //通讯录权限
Privacy - Camera Usage Description     //摄像头权限
Privacy - NSSiriUsageDescription       //Siri的权限
Privacy - Bluetooth Peripheral Usage Description //蓝牙
Privacy - Reminders Usage Description  //提醒事项
Privacy - Motion Usage Description     //运动与健康
Privacy - Media Libaray Usage Description //媒体资源库
Privacy - Calendars Usage Description  //日历
*/
