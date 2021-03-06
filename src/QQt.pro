#-------------------------------------------------
#
# Project created by QtCreator 2016-03-24T14:08:11
#
#-------------------------------------------------
#Project link: https://gitee.com/drabel/LibQQt
#github link: https://github.com/AbelTian/LibQQt

#2017年11月10日18:53:56
#if you succeed with LibQQt, please thumb up.

#2018年02月09日10:40:10
#开发者建议：中级工程师及以上学者，再打算学习这些pri文件的思路、结构、编写。

#2018年02月13日09:58:25
#LibQQt设计宗旨：为内存服务。Service for memory.

#################################################################
##Usage
#################################################################
#Suggest Qt 5.8/5.9.2/4.8.6/4.8.7
#please dont use Qt 5.9.1, it is broken with android and ios.
#please dont modify this pro
#use LibQQt you need change Qt Creator default build directory: your-pc-build-station/%{CurrentProject:Name}/%{CurrentKit:FileSystemName}/%{Qt:Version}/%{CurrentBuild:Name} (Only Once)
#Multi-link v2 wont force user for setting Qt Creator default build directory.
#in Qt kit page, set kit's File System Name. (Creator Ver.>v3.5) (Only Once)
#in project build page, def env QSYS
#in app_configure.pri (auto createed) define QQT_BUILD_ROOT= and QQT_SDK_ROOT= and APP_DEPLOY_ROOT. (Only Once)
#target MSVC, user must define QSYS=MSVC in project build page!

#################################################################
##project name
#################################################################
TARGET = QQt
TEMPLATE = lib

CONFIG += debug_and_release
CONFIG += build_all

#################################################################
#包含基础管理者
#################################################################
include ($${PWD}/../multi-link/add_base_manager.pri)

#根据 Multi-link 提供的动态编译、静态编译设定进行编译。
#Multi-link提供了添加用户库自有编译控制宏的函数。
#Multi-link提供了自动引用 LibQQt 的函数，包括帮助补充链接控制宏。

#如果，用户把 LibQQt 编译为静态库，为用户提供 build_link_QQt 配置和 QQT_STATIC_LIBRARY 宏。Multi-link也为使用者提供链接QQt用的静态配置和宏。
#add_static_library_project()
#如果，用户动态编译 LibQQt，为用户提供 build_QQt 配置和 QQT_LIBRARY 宏。
#add_dynamic_library_project()

#以上函数提供的链接库自有 CONFIG。
#build_QQt / build_static_QQt build_link_QQt
#link_QQt / link_static_QQt build_link_QQt
contains(CONFIG, dll) {
    CONFIG += build_QQt
} else:contains(CONFIG, static) {
    CONFIG += build_static_QQt build_link_QQt
}

#Multi-link 提供以上函数替代以下代码。我喜欢使用以下代码。
#动态链接，添加我自己的QQt的宏定义。
contains(DEFINES, LIB_LIBRARY) {
    DEFINES += QQT_LIBRARY
    message(Build $${TARGET} QQT_LIBRARY is defined. build)
} else:contains(DEFINES, LIB_STATIC_LIBRARY) {
    DEFINES += QQT_STATIC_LIBRARY
    message(Build $${TARGET} QQT_STATIC_LIBRARY is defined. build and link)
}

#clean_target()
#clean_sdk()

#################################################################
##project version
#################################################################
#这个的设置有特点，要先设置
add_version(3,2,0,0)

#自定义宏 冗余定义
DEFINES += QQT_VERSION=$$APP_VERSION

#user can use app_version.pri to modify app version once, once is all.
#unix:VERSION = $${QQT_VERSION}
#bug?:open this macro, TARGET will suffixed with major version.
#win32:VERSION = $${QQT_VERSION4}

#################################################################
##project header
#################################################################
#qqt_header.pri 内部使用函数实现
include ($$PWD/qqt_header.pri)

#预编译。
#add_pch($$PWD/qqt-qt.h)

#################################################################
##project source
#################################################################
include ($$PWD/qqt_source.pri)

#################################################################
#发布SDK 必要
#所有App都依赖QQt的这个步骤
#################################################################
#可选修饰函数
#add_project_name(QQt)
#add_source_dir($$PWD)
#add_build_dir($$DESTDIR)

#导出include和library
#目标
#源代码目录
#编译在相对编译目录
add_sdk(QQt, $$add_target_name())

#额外做点事情 拷贝头文件 没有后缀的头文件
#这个可以通过Multi-link工具实现。
add_sdk_header_no_postfix(QQt, $$add_target_name(), QQtApplication, frame)
add_sdk_header_no_postfix(QQt, $$add_target_name(), QQtWidget, widgets)

#################################################################
#其他设置
#################################################################
QMAKE_TARGET_FILE = "$${TARGET}"
QMAKE_TARGET_PRODUCT = "$${TARGET}"
QMAKE_TARGET_COMPANY = "www.$${TARGET}.com"
QMAKE_TARGET_DESCRIPTION = "$${TARGET} Foundation Class"
QMAKE_TARGET_COPYRIGHT = "Copyright 2017-2042 $${TARGET} Co., Ltd. All rights reserved"

win32 {
    #common to use upload, this can be ignored.
    #open this can support cmake config.h.in
    #configure_file(qqtversion.h.in, qqtversion.h) control version via cmake.
    #qmake version config and cmake version config is conflicted
    #RC_FILE += qqt.rc
    #RC_ICONS=
    RC_LANG=0x0004
    RC_CODEPAGE=
}

################################################
##project resource
################################################
RESOURCES += \
    $${PWD}/qqt.qrc

#################################################################
##QQt Lib工程持续编译
#################################################################
#如果不touch一下,资源文件改变不会引发编译,可是我们需要编译一下,不开持续编译,岂不是漏失?
#修改pro,如果不需要编译源文件,还是编译了一下,岂不是多余?
#权衡利弊,在qqt工程里开启开关.保证用户在编译源代码的时候,任何改动一定持续生效.
#依赖touch命令 :|
#QQt持续编译配置开关
#QQt用户请注意，在这里我开启了持续编译，以保证用户对QQt本身的修改生效
CONFIG += continue_build
contains(CONFIG, continue_build){
    system("touch $${PWD}/frame/qqtapplication.cpp")
}

#################################################################
##project environ
#################################################################
#build
message($${TARGET} build obj dir $$add_host_path($${OUT_PWD}) $$OBJECTS_DIR)
message($${TARGET} build moc dir $$add_host_path($${OUT_PWD}) $$MOC_DIR)
message($${TARGET} build uih dir $$add_host_path($${OUT_PWD}) $$UI_DIR)
message($${TARGET} build rcc dir $$add_host_path($${OUT_PWD}) $$RCC_DIR)
message($${TARGET} build dst dir $$add_host_path($${OUT_PWD}) $$DESTDIR)
#default
message ($${TARGET} QT $${QT})
message ($${TARGET} config $${CONFIG})
message ($${TARGET} define $${DEFINES})
#message ($${TARGET} pre link $${QMAKE_PRE_LINK})
#message ($${TARGET} post link $${QMAKE_POST_LINK})
