import QtQuick

// 控制显示各个页面
Rectangle {
    property int pageIndex: 0

    id: root
    color: "#20000000"

    BtnsPage{
        anchors.fill: parent
        visible: root.pageIndex === 0
    }
}
