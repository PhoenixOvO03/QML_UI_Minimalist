import QtQuick
import QtQuick.Window
import QtQuick.Controls

// 自定义无边框窗口
/*
 * 感谢B站用户 辛归元 提出界面设计建议：
 * 窗口圆角化、添加边缘拖拽缩放窗口、双击状态栏最大化和正常化
*/
Window{
    id: mainWindow
    width: 800
    height: 650
    title: "QML_UI_Minimalist"
    // 窗口 | 无边框窗口
    flags: Qt.Window | Qt.FramelessWindowHint
    visible: true
    color: "transparent" // 背景透明方便圆角

    property bool isBody: true // 主页面和皮肤页面切换
    property color titleColor: "black"
    property color backgroundColor: "#404040"

    // 全体界面
    Item {
        anchors.fill: parent

        // 背景
        Rectangle{
            id: background
            anchors.fill: parent
            color: mainWindow.backgroundColor
            radius: mainWindow.visibility == mainWindow.Maximized ? 0 : 25 // 非最大化为圆角
        }

        // 标题栏
        Rectangle{
            id: titleBar
            width: parent.width
            height: 50
            color: mainWindow.titleColor
            radius: mainWindow.visibility == mainWindow.Maximized ? 0 : 25 // 非最大化为圆角

            // 拖动条
            Item {
                anchors.left: parent.left
                anchors.right: skinBtn.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                DragHandler{
                    onActiveChanged: {
                        if (active){
                            mainWindow.startSystemMove()
                        }
                    }
                }

                // 主图标
                Image {
                    id: mainIcon
                    height: parent.height
                    width: parent.height
                    source: "./res/Qt.png"
                }

                // up标识
                Image {
                    height: parent.height
                    anchors.left: mainIcon.right
                    fillMode: Image.PreserveAspectFit
                    source: "./res/title.png"
                }

                // 双击最大化或正常化
                MouseArea{
                    anchors.fill: parent
                    onDoubleClicked: mainWindow.visibility == mainWindow.Maximized ? mainWindow.showNormal() : mainWindow.showMaximized()
                }
            }

            // 主题
            Rectangle{
                id: skinBtn
                width: titleBar.height
                height: titleBar.height
                anchors.right: minBtn.left
                color: "transparent"

                // 主题图标
                Image {
                    anchors.fill: parent
                    source: "./res/skin.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: mainWindow.isBody = !mainWindow.isBody
                }
            }

            // 最小化
            Rectangle{
                id: minBtn
                width: titleBar.height
                height: titleBar.height
                anchors.right: maxBtn.left
                color: "transparent"

                Image {
                    anchors.fill: parent
                    source: "./res/min.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: mainWindow.showMinimized()
                }
            }

            // 最大化或正常化
            Rectangle{
                id: maxBtn
                width: titleBar.height
                height: titleBar.height
                anchors.right: closeBtn.left
                color: "transparent"

                Image {
                    anchors.fill: parent
                    source: mainWindow.visibility == mainWindow.Maximized ? "./res/normal.png" : "./res/max.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: mainWindow.visibility == mainWindow.Maximized ? mainWindow.showNormal() : mainWindow.showMaximized()
                }
            }

            // 关闭按钮
            Rectangle{
                id: closeBtn
                width: titleBar.height
                height: titleBar.height
                anchors.right: parent.right
                color: "transparent"

                Image {
                    anchors.fill: parent
                    source: "./res/close.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: mainWindow.close()
                }
            }
        }

        // 设置主题
        Skin{
            id: skin
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: titleBar.bottom
            anchors.bottom: parent.bottom
            visible: !mainWindow.isBody

            onCheckSkin: {
                titleColor = titleArg
                backgroundColor = backgroundArg
            }
        }

        // 主体
        Body{
            id: body
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: titleBar.bottom
            anchors.bottom: parent.bottom
            visible: mainWindow.isBody
        }
    }

    // 界面缩放区域
    Item {
        id: scaling
        anchors.fill: parent
        enabled:  mainWindow.visibility !== mainWindow.Maximized // 最大化时不可用

        // 上
        Item {
            height: 5
            width: parent.width

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeVerCursor

                onPressed: mainWindow.startSystemResize(Qt.TopEdge)
            }
        }

        // 下
        Item {
            height: 5
            width: parent.width
            anchors.bottom: parent.bottom

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeVerCursor

                onPressed: mainWindow.startSystemResize(Qt.BottomEdge)
            }
        }

        // 左
        Item {
            width: 5
            height: parent.height

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeHorCursor

                onPressed: mainWindow.startSystemResize(Qt.LeftEdge)
            }
        }

        // 右
        Item {
            width: 5
            height: parent.height
            anchors.right: parent.right

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeHorCursor

                onPressed: mainWindow.startSystemResize(Qt.RightEdge)
            }
        }

        // 左上
        Item {
            id: left_top
            width: 5
            height: 5

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeFDiagCursor

                onPressed: mainWindow.startSystemResize(Qt.LeftEdge | Qt.TopEdge)
            }
        }

        // 右上
        Item {
            id: right_top
            width: 5
            height: 5
            anchors.right: parent.right

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeBDiagCursor

                onPressed: mainWindow.startSystemResize(Qt.RightEdge | Qt.TopEdge)
            }
        }

        // 左下
        Item {
            id: left_bottom
            width: 5
            height: 5
            anchors.bottom: parent.bottom

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeBDiagCursor

                onPressed: mainWindow.startSystemResize(Qt.LeftEdge | Qt.BottomEdge)
            }
        }

        // 右下
        Item {
            id: right_bottom
            width: 5
            height: 5
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.SizeFDiagCursor

                onPressed: mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
            }
        }
    }
}
