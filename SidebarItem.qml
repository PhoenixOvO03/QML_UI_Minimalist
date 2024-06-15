import QtQuick

// 侧边栏组件
/*
 * 感谢B站用户 风情万种孙真重 提出界面设计建议：
 * 侧边栏的文字位置和大小设置为固定，随着侧边栏展开同步显示
 * 感谢B站用户 越客水工 提出的界面设计：
 * 侧边栏部件增添悬浮颜色提示
*/
Rectangle {
    property string iconSource: "./res/menu.png"
    property string text: "菜单"
    property bool isHover: false

    id: root
    color: root.isHover ? "#20ffffff" : "transparent"
    radius: 20
    clip: true

    // 图标
    Image {
        id: icon
        width: root.height
        height: root.height
        source: root.iconSource
    }

    // 描述
    Text {
        anchors.left: icon.right
        width: root.height
        height: root.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "white"
        style: Text.Outline
        styleColor: "steelblue"
        font.pixelSize: root.height / 4
        text: root.text
    }
}
