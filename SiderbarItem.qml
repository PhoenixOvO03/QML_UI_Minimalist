import QtQuick

// 侧边栏组件
/*
 * 感谢B站用户 风情万种孙真重 提出界面设计建议：
 * 侧边栏的文字位置和大小设置为固定，随着侧边栏展开同步显示
*/
Rectangle {
    property string iconSource: "./res/menu.png"
    // property bool textVisible: false
    property string text: "菜单"

    id: root
    color: "transparent"
    clip: true

    Image {
        id: icon
        width: root.height
        height: root.height
        source: root.iconSource
    }

    Text {
        anchors.left: icon.right
        width: root.height
        height: root.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.family: "华文彩云"
        style: Text.Outline
        styleColor: "steelblue"
        font.pixelSize: root.height / 3
        // visible: root.textVisible
        text: root.text
    }
}
