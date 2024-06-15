import QtQuick
import QtQuick.Window

// 自定义无边框窗口
/*
 * 感谢B站用户 辛归元 提出界面设计建议：
 * 窗口圆角化、添加边缘拖拽缩放窗口、双击状态栏最大化和正常化
 * 感谢B站用户 白白白狗子 提出的界面优化建议：
 * 致敬apple vision ui对整体的主题设计进行了优化
*/
Window{
    id: mainWindow
    width: 800
    height: 650
    flags: Qt.Window | Qt.FramelessWindowHint // 窗口 | 无边框窗口
    visible: true
    color: "transparent" // 背景透明方便圆角
    minimumWidth: 700 // 最小宽度
    minimumHeight: 600 // 最小高度

    property bool isBody: true // 主页面和皮肤页面切换
    property color backTopColor: "#c0444444" // 背景上方颜色
    property color backBottomColor: "#c0444444" // 背景下方颜色

    // 侧边栏
    Sidebar{
        id: sidebar

        width: sidebarChecked || mainWindow.visibility == mainWindow.Maximized ? 80 : 40
        height: parent.height
        onCurrentIndexChanged: pages.pageIndex = currentIndex
        backTopColor: mainWindow.backTopColor
        backBottomColor: mainWindow.backBottomColor
    }

    // 全体界面
    Rectangle {
        id: window
        width: mainWindow.width - 80
        height: mainWindow.height
        anchors.right: parent.right
        radius: 25
        color: "transparent"
        border.color: "#80ffffff"
        clip: true

        gradient: Gradient{
            GradientStop{position:0.0;color: mainWindow.backTopColor}
            GradientStop{position:1;color: mainWindow.backBottomColor}
        }

        // 标题栏
        Item{
            id: titleBar
            width: parent.width
            height: 50

            // 主题
            Item{
                id: skinBtn
                width: titleBar.height
                height: titleBar.height

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

            // 拖动条
            Item {
                anchors.left: skinBtn.right
                anchors.right: closeBtn.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                DragHandler{
                    onActiveChanged: {
                        if (active){
                            mainWindow.startSystemMove()
                        }
                    }
                }

                // 双击最大化或正常化
                MouseArea{
                    anchors.fill: parent
                    onDoubleClicked: mainWindow.visibility == mainWindow.Maximized ? mainWindow.showNormal() : mainWindow.showMaximized()
                }
            }

            Image {
                anchors.centerIn: parent
                height: parent.height
                fillMode: Image.PreserveAspectFit
                source: "./res/title.png"
            }

            // 关闭按钮
            Item{
                id: closeBtn
                width: titleBar.height
                height: titleBar.height
                anchors.right: parent.right

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

        // 主题页面
        SkinPage{
            id: skin
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: titleBar.bottom
            anchors.bottom: parent.bottom
            visible: !mainWindow.isBody

            onCheckSkin: {
                mainWindow.backTopColor = backTopColor
                mainWindow.backBottomColor = backBottomColor
            }
        }

        // 主体
        Pages{
            id: pages
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: titleBar.bottom
            anchors.bottom: parent.bottom
            visible: mainWindow.isBody
            clip: true
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
}
