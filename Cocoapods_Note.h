

/*
 安装CocoaPods
    $ sudo gem install cocoapods
    $ gem sources --remove https://rubygems.org/
    $ gem sources -a http://ruby.taobao.org/  //等有反应之后再敲入这条命令
        有可能报错：bad response Not Found 404 (http://ruby.taobao.org/specs.4.8.gz)
            原因：淘宝停止基于 HTTP 协议的镜像服务 需要改用https的协议
            解决方法步骤：
                $ gem sources –remove http://ruby.taobao.org/
                $ gem sources -a https://ruby.taobao.org/
                $ gem sources -l
                $ sudo gem install cocoapods
    $ gem sources -l    // 为了验证你的Ruby镜像是并且仅是taobao，可以用这个命令查看：
        只有在终端中出现下面文字才表明你上面的命令是成功的：
        *** CURRENT SOURCES ***
            http://ruby.taobao.org/
    $ sudo gem install cocoapods    //安装
 
 创建Podfile
    $ vim Podfile   // 创建Podfile 文件并且编辑
        Podfile 标准格式
 
 */


/**
 NS_ASSUME_NONNULL_BEGIN
 
 @interfacemyClass()
 @property (nonatomic,copy) NSString *aString;
 - (id)methodWithString:(NSString *_Nonnull)str;
 @end
 
 NS_ASSUME_NONNULL_END
 
 == 等于下方
 
 @interfacemyClass()
 @property (nonatomic,copy) NSString *_Nonnull aString;
 - (id)methodWithString:(NSString *_Nonnull)str;
 @end
 
 
 在这两个宏之间的代码，所有简单指针对象都被假定为 nonnull ，因此我们只需要去指定那些 nullable 指针对象即可。
 */
