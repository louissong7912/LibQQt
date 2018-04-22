#include "qqtserverprotocolmanager.h"

QQtServerProtocolManager::QQtServerProtocolManager ( QObject* parent ) : QQtProtocolManager ( parent )
{

}

QQtServerProtocolManager* QQtServerInstance ( QObject* parent )
{
    static QQtServerProtocolManager* m0 = 0;
    if ( !m0 )
    {
        //创建Protocol管理者
        m0 = new QQtServerProtocolManager ( parent );
        //注册我实现的Protocol
        m0->registerProtocol<QQtServerProtocol> ( "QQtServerProtocol" );
        //初始化Protocol管理者完成。
    }

    static QQtTcpServer* s0 = 0;
    if ( !s0 )
    {
        //新建服务器
        s0 = new QQtTcpServer ( parent );
        //安装协议管理者
        s0->installProtocolManager ( m0 );
        //开始监听
        s0->listen ( QHostAddress::Any, 8001 );
        //服务器初始化完成。
    }

    //等待客户端发消息过来，Protocol就处理了，去业务层看看。
    return m0;
}
