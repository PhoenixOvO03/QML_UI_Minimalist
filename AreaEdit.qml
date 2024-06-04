import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

// 区域文本输入框
Rectangle {
    id: root
    radius: 10
    color: "#20000000"
    border.width: 5
    border.color: "steelblue"

    ScrollView {
        id: scrollView
        anchors.centerIn: parent
        width: root.width - 10
        height: root.height - 10

        TextArea {
            id: textArea
            background: Item {}
            placeholderText: "在此输入..."
            wrapMode: TextArea.Wrap
        }
    }

    // 边框
    Rectangle{
        anchors.centerIn: parent
        width: parent.width - 4
        height: parent.height - 4
        radius: 8
        color: "transparent"
        border.width: 1
        border.color: "white"
    }

    // 字数统计
    Text {
        anchors.right: scrollView.right
        anchors.bottom: scrollView.bottom
        text: "字数：" + textArea.length
        color: "white"
        font.family: "华文彩云"
        style: Text.Outline
        styleColor: "steelblue"
    }
}
