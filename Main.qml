import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window{
    id: mainWindow
    width: 800
    height: 650
    title: "QML_UI_Minimalist"
    // 窗口 | 无边框窗口
    flags: Qt.Window | Qt.FramelessWindowHint
    visible: true

    property bool isBody: true
    property color titleColor: "black"
    property color backgroundColor: "gray"

    // 全体界面
    Item {
        anchors.fill: parent

        // 背景
        Rectangle{
            id: background
            anchors.fill: parent
            color: mainWindow.backgroundColor
        }

        // 标题栏
        Rectangle{
            id: titleBar
            width: parent.width
            height: 50
            color: mainWindow.titleColor

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
            }

            // 主题
            Rectangle{
                id: skinBtn
                width: titleBar.height
                height: titleBar.height
                anchors.right: minBtn.left
                color: "transparent"

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
}
