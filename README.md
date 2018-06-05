# LibQQt  

LibQQt全名QQt Foundation Class。  
LibQQt为基于Qt开发的App提供中间问题处理层，适配桌面、嵌入式以及Android、IOS的开发。
LibQQt为用户自动生成Library SDK，主动帮助用户发布App和资源文件。
2018年1月，LibQQt代码变更数量已达30万，主要面向初、中、高级软件相关专业、有一定App开发经验的工程师。
LibQQt现进行正式发布版本v2.1.6.0，欢迎工程师们使用。  

gitee link: https://gitee.com/drabel/LibQQt  
github link: https://github.com/AbelTian/LibQQt  

========================================================================  
# 摘要介绍  

*LibQQt包括基础组成、精美组成*
- 基础组成，可以完成专业App所需要的业务功能和图形功能。
- 精美组成，包括高级业务功能和超级图形功能。（都在src/exquisite文件夹里）  

*如果用户希望精简LibQQt，qqt_header.pri里面有很多模块开关，开开关关能修剪。*  
*不建议使用cmake，建议使用qmake。*  
*自动发布应用程序，自动拷贝应用配置。（请正确配置目录系统）*  


========================================================================  
# 详细介绍  

1. 支持绘制图表
    - [QQtChart](src/charts/qqtchartview.h) (compatiable with QChart and QCustomPlot)  
2. 支持检测USB设备热插拔  
3. 自定义了一部分特殊需要的控件，用来解决Qt的嵌入式bug。
    - 包括完全使用图片的checkbox（switchbutton）
    - QQtTabWidget，解决QtTab不能竖排横显文字的问题
    - QQt进度条，解决Qt进度条在Dialog中导致系统死机的问题(e-linux)    
1. 添加精美控件
    - 包括复杂的圆盘进度条, SpeedMeter    
    - 包括有多种效果的Widget、Dialog
    - 二维码生成器、识别器，校验码生成器
    - 九宫格技术展示图片
    - Html解析器
    - 以及未列出的等20余种自定义widget。
4. 有线和无线网络自动连接管理器  
6. 解决Qt4.8.7在嵌入式屏幕上QGraphics系统不正常绘画的问题 
7. QQt输入法
    - 重写了UI，适配多种屏幕
8. Qt对象管理器  
    - 用于管理已经生成的Qt对象实例，objectName是唯一查找索引。  
    - 含有QQtObjectFactory，用于动态注册、生成来自QObject和QWidget的类。
9. 嵌入式视频播放器，模拟端口实时预览器
0. QQt打印机，支持打印pdf
2. QQtWord，支持doc文档编写，输出pdf格式。
4. QQtTreeView，添加Qt4内部没有TreeView
    - 包括QQtXmlTreeModel、QQtJsonTreeModel、QQtFileSystemTreeModel、QQtSqlTreeModel
6. QQt通讯套件。
     - 通讯口类   
        - QQtSerialPort 兼容QSerialPort and QextSerialPort
        - [QQtTcpClient](src/network/qqttcpclient.h)、QQtTcpServer、QQtUdpClient
        - QQtBluetoothSocket +QQtBluetoothManager
        - QQtWebAccessManager，支持http、ftp等主流协议，高并发传输。
        - [QQtWebSocket](src/network/qqtwebsocketclient.h) 接口
     - 协议虚类（接口类） [QQtProtocol](src/network/qqtprotocol.h) QQtWebSocketProtocol
     - 报文虚类（接口类） [QQtMessage](src/network/qqtmessage.h)  
7. 添加应用中常用的form
8. 支持多页表格 [QQtMultiPageTableWidget](src/widgets/qqtmultipagetablewidget.h)  
9. 添加 [QQtApplication](src/frame/qqtapplication.h)，支持入门级、通用级、专用级嵌入式App所必须的初始化内容
5. 支持Qt5.9.2   
0. 跨平台支持macOS、iOS、Android、Windows、Linux、MIPS、ARM等。  
1. 添加矢量图形widgets  
     - 比如 QQtSvgProgressbar
     - QQtSvgCheckBox
     - [QQtSvgPushButton](src/exquisite/svgwidgets/qqtsvgpushbutton.h)  
2. 添加核心类之[QQtDictionary](src/core/qqtdictionary.h)   
     - 化解C Plus Plus中没有字典类别的尴尬。    
3. 添加Multi Link工程管理pri组  
     - [Multi Link technology](multi-link/add_multi_link_technology.pri)，既多链接工程管理技术。
     - [add_base_manager.pri](multi-link/multi-link/add_base_manager.pri)，app和lib工程的基础管理者。  
     - 基于qmake，用户可以轻易的链接LibQQt和添加自定义library。  
     - 工程版本变更可以使用add_version(1,0,0,0)实现了。  
4. 添加gif support Widgets  
    - 可以方便的设置动态按钮等。  
    - 有[QQtGifWidget](src/exquisite/gifwidgets/qqtgifwidget.h)、QQtGifButton等。   
5. 升级多媒体音频  
    - 添加内存服务器，处理内存和设备之间的数据交互。  
    - [QQtAudioManager](src/multimedia/qqtaudiomanager.h)、  
    - QQtWavAudioInput、QQtWavAudioOutput、QQtWavAudioManager、  
    - QQtWavSoundEffect  
    - 将AudioDevice、wav输入输出文件，当做一个设备进行读写，App处理获取到的声音。  
6. 添加Http功能支持工具
    - QQtWebAccessManager，支持管理Session、Cookies。    
    - 添加GumboQuery爬虫工具。  
    - 支持webservice (QtSoap)  


========================================================================  
# 多链接发布技术    

[Multiple Link Technology](multi-link.md)   
LibQQt为方便用户开发App过程方便的发布程序，所以添加了多链接和自动发布功能，基于qmake工程管理器的多链接发布技术。  
用户只需要做相应的目录设定，甚至包括自己的配置文件的目录设置，LibQQt提供的base manager就会自动将用户的程序，配置发布到指定位置，  
并且支持其他依赖的链接库。  
经过发布的App直接点击就可以运行，*大的省去了用户手动发布App的劳烦过程。    


========================================================================  
# 使用案例  

[看入门用例截图](screenshot.md)  


========================================================================  
# 使用方法  

在Windows平台上，  
*把LibQQt/extra/touch.exe 复制到C:\Windows*   
*把LibQQt/extra/md5.exe 复制到C:\Windows*   
  
[走，去看看入门用法](usage.md)  
[入门了，去看看学习设置工程目录](project.md)  
发现了一个问题: [new issue link](https://gitee.com/drabel/LibQQt/issues/new?issue%5Bassignee_id%5D=0&issue%5Bmilestone_id%5D=0)  


========================================================================  
# 依赖学习知识   

[预习Git入门](usage-git.md)  


========================================================================  
# LibQQt百科   

[跳转到LibQQt的百科知识页面](wiki/wiki.md "Wiki Page")  
[阅读我的LibQQt博客进行一系列的学习](http://blog.csdn.net/Dr_Abel)   
[LibQQt视频图说](http://v.youku.com/v_show/id_XMzUzODQ4MTczMg==.html?spm=a2hzp.8244740.0.0)  
[学会了使用？那么认识LibQQt吧](doc/knowledge-about-libQQt.md)  


========================================================================  
# 联系我  

邮箱: tianduanrui@163.com  
QQ: 2657635903  


========================================================================  
# 用户使用协议  

[LibQQt用户使用协议](licence.md)   


========================================================================  
# 收费处  

[LibQQt收费处](charge.md)   


========================================================================  
# 项目标识  

![logo](screenshot/logo.png "Logo")    

