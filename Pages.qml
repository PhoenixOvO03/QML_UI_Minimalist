import QtQuick

// 控制显示各个页面
Item {
    property int pageIndex: 0

    id: root

    // 按钮页面
    BtnsPage{
        anchors.fill: parent
        visible: root.pageIndex === 0
    }

    // 进度条页面
    ProgressesPage{
        anchors.fill: parent
        visible: root.pageIndex === 1
    }

    // 编辑页面
    EditPage{
        anchors.fill: parent
        visible: root.pageIndex === 2
    }

    // 表格页面
    TablePage{
        anchors.fill: parent
        visible: root.pageIndex === 3
    }
}
