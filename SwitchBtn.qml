import QtQuick

// 开关按钮
Item {
    property color checkColor: "green"
    property bool isChecked: false

    id: root

    // 滑槽
    Rectangle{
        anchors.centerIn: parent
        width: root.width
        height: root.height * 0.6
        radius: height / 2
        color: root.isChecked ? root.checkColor : "gray"

        Behavior on color {
            ColorAnimation {
                duration: 500
            }
        }
    }

    // 圆点
    Rectangle{
        x: root.isChecked ? root.width - root.height : 0
        width: root.height
        height: root.height
        radius: height / 2
        color: root.isChecked ? Qt.lighter(root.checkColor) : "lightgray"

        Behavior on x{
            NumberAnimation{
                duration: 500
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 500
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.isChecked = !root.isChecked
    }
}
