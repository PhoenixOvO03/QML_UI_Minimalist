import QtQuick

// 窗口主体
Rectangle {
    property bool sidebarChecked: false
    property int pageIndex: 0

    id: root
    color: "transparent"

    // 侧边栏
    Rectangle{
        id: siderbar
        width: root.sidebarChecked ? root.width * 0.2 : root.width * 0.1
        height: root.height
        color: "transparent"

        Behavior on width{
            NumberAnimation{
                duration: 500
            }
        }

        // 菜单
        SiderbarItem{
            id: menu
            width: siderbar.width
            height: root.width * 0.1
            // textVisible: sidebarChecked
            // color: "#20000000"

            MouseArea{
                anchors.fill: parent
                onClicked: root.sidebarChecked = !root.sidebarChecked
            }
        }

        // 哔哩哔哩
        SiderbarItem{
            id: bilibili
            width: siderbar.width
            height: root.width * 0.1
            anchors.bottom: siderbar.bottom
            text: "十_OvO"
            iconSource: "./res/bilibili.png"

            MouseArea{
                anchors.fill: parent

                onClicked: {
                    var url = "https://space.bilibili.com/387426555"
                    if (Qt.openUrlExternally(url)) {
                        console.log("Successfully opened URL: " + url)
                    } else {
                        console.log("Failed to open URL: " + url)
                    }
                }
            }
        }

        // 页面标签
        ListView{
            id: listView
            anchors.top: menu.bottom
            anchors.left: siderbar.left
            anchors.right: siderbar.right
            // anchors.bottom: siderbar.bottom
            anchors.bottom: bilibili.top
            clip: true

            // 标签信息
            model: ListModel{
                ListElement{
                    labelText: "按钮"
                    labelIcon: "./res/switch.png"
                }
                ListElement{
                    labelText: "进度条"
                    labelIcon: "./res/progress.png"
                }
                ListElement{
                    labelText: "编辑"
                    labelIcon: "./res/edit.png"
                }
            }

            // 侧边栏部件
            delegate: SiderbarItem{
                id: siderbarItem
                width: menu.width
                height: menu.height
                // textVisible: sidebarChecked
                text: labelText
                iconSource: labelIcon

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        listView.currentIndex = index
                        root.pageIndex = index
                        siderbarItem.isHover = false
                    }
                    onEntered: if(listView.currentIndex !== index) siderbarItem.isHover = true
                    onExited: siderbarItem.isHover = false
                }
            }

            highlight: highlightComponent
            focus: true
            onCurrentIndexChanged: root.pageIndex = listView.currentIndex
        }

        // 高亮
        Component{
            id: highlightComponent

            Rectangle{
                width: menu.width
                height: menu.height
                color: "#20000000"
            }
        }
    }

    // 主体页面
    Pages{
        anchors.left: siderbar.right
        anchors.right: root.right
        anchors.top: root.top
        anchors.bottom: root.bottom
        pageIndex: root.pageIndex
    }

}
