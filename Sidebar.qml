import QtQuick

// 侧边栏
Item {
    property color backTopColor: "transparent"
    property color backBottomColor: "transparent"
    property bool sidebarChecked: false
    property int currentIndex: 0

    id: root

    Behavior on width{
        NumberAnimation{
            duration: 500
        }
    }

    // 背景
    Rectangle{
        id: background
        color: "transparent"
        radius: 20
        width: root.width
        anchors.top: menu.top
        anchors.bottom: bilibili.bottom
        border.color: "#80ffffff"

        gradient: Gradient{
            GradientStop{position:0.0;color: root.backTopColor}
            GradientStop{position:1;color: root.backBottomColor}
        }
    }

    // 菜单
    SidebarItem{
        id: menu
        width: root.width
        height: 40
        anchors.bottom: listView.top

        MouseArea{
            anchors.fill: parent
            onClicked: root.sidebarChecked = !root.sidebarChecked
        }
    }

    // 页面标签
    ListView{
        id: listView
        anchors.centerIn: parent
        width: root.width
        height: Math.min(listView.count * menu.height, root.height - 150)
        clip: true
        // focus: true

        // 标签信息
        model: ListModel{
            ListElement{labelText: "按钮"; labelIcon: "./res/switch.png"}
            ListElement{labelText: "进度条"; labelIcon: "./res/progress.png"}
            ListElement{labelText: "编辑"; labelIcon: "./res/edit.png"}
            ListElement{labelText: "表格"; labelIcon: "./res/table.png"}
        }

        // 侧边栏部件
        delegate: SidebarItem{
            id: siderbarItem
            width: menu.width
            height: menu.height
            text: labelText
            iconSource: labelIcon

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    listView.currentIndex = index
                    root.currentIndex = index
                    siderbarItem.isHover = false
                }
                onEntered: if(listView.currentIndex !== index) siderbarItem.isHover = true
                onExited: siderbarItem.isHover = false
            }
        }

        highlight: Rectangle{
            color: "#40ffffff"
            radius: 20
        }

        onCurrentIndexChanged: root.currentIndex = listView.currentIndex
    }

    // 哔哩哔哩
    SidebarItem{
        id: bilibili
        width: menu.width
        height: menu.height
        anchors.top: listView.bottom
        text: "十_OvO"
        iconSource: "./res/bilibili.png"

        MouseArea{
            anchors.fill: parent
            onClicked: Qt.openUrlExternally("https://space.bilibili.com/387426555")
        }
    }
}
