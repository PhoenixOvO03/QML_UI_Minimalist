import QtQuick

// 点击按钮
Rectangle {
    signal clicked()

    property string btnText: ""
    property color btnColor: "green"
    property bool hover: false

    id: root
    radius: height / 2
    color: root.hover ? Qt.lighter(root.btnColor) : root.btnColor
    border.color: Qt.lighter(color)

    Text {
        anchors.centerIn: parent
        font.pixelSize: root.height / 3
        font.family: "华文彩云"
        color: "white"
        style: Text.Outline
        styleColor: "steelblue"
        text: root.btnText
    }

    MouseArea{
        anchors.fill: parent
        onPressed: root.hover = true
        onReleased: root.hover = false
        onClicked: root.clicked()
    }
}
