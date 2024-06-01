import QtQuick

Rectangle {
    radius: height / 2
    color: "#20000000"
    border.width: 5
    border.color: "steelblue"

    // 边框
    Rectangle{
        anchors.centerIn: parent
        width: parent.width - 4
        height: parent.height - 4
        radius: height / 2
        color: "transparent"
        border.width: 1
        border.color: "white"
    }

    TextEdit{
        anchors.fill: parent
    }
}
