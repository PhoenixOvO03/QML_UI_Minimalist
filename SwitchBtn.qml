import QtQuick

// 开关按钮
Rectangle {
    property color checkColor: "green"
    property bool isChecked: false

    id: root
    radius: height / 2
    color: root.isChecked ? root.checkColor : "#606060"
    border.color: Qt.lighter(color)

    Behavior on color {
        ColorAnimation {
            duration: 500
        }
    }

    // 圆点
    Rectangle{
        anchors.verticalCenter: root.verticalCenter
        x: root.isChecked ? root.width - root.height * 0.9 : root.height * 0.1
        width: root.height * 0.8
        height: width
        radius: width / 2
        color: "white"

        Behavior on x{
            NumberAnimation{
                duration: 500
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.isChecked = !root.isChecked
    }
}
