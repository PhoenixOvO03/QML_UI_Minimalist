import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

// 区域文本输入框
Rectangle {
    id: root
    radius: 10
    color: "#80444444"
    border.color: "#80ffffff"

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

    // 字数统计
    Text {
        anchors.right: scrollView.right
        anchors.bottom: scrollView.bottom
        text: "字数：" + textArea.length
        color: "#444444"
        style: Text.Outline
        styleColor: "#ffffff"
    }
}
