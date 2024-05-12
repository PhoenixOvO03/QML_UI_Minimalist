import QtQuick
import QtQuick.Shapes

// 复选按钮
Item {
    property string checkColor: "green"
    property bool isChecked: false

    id: root

    Rectangle{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "transparent"
        border.color: root.isChecked ? root.checkColor : "grey"
        border.width: 10

        Behavior on border.color {
            ColorAnimation {
                duration: 500
            }
        }
    }

    Shape {
        anchors.fill: parent
        ShapePath {
            fillColor: "transparent"
            strokeWidth: root.width / 10
            strokeColor: root.isChecked ? Qt.lighter(root.checkColor) : "grey"
            capStyle: ShapePath.RoundCap

            startX: root.width / 10; startY: root.height / 2
            PathLine { x: root.width / 2; y: root.height * 0.9 }
            PathLine { x: root.width * 0.9; y: root.height * 0.1 }

            Behavior on strokeColor {
                ColorAnimation {
                    duration: 500
                }
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.isChecked = !root.isChecked
    }

}
