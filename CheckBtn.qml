import QtQuick
import QtQuick.Shapes

// 复选按钮
Rectangle {
    property color checkColor: "green"
    property bool isChecked: false
    property string labelText: ""

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
        id: circlePoint
        anchors.verticalCenter: root.verticalCenter
        x: root.height * 0.1
        width: root.height * 0.8
        height: width
        radius: width / 2
        color: "white"

        // 勾
        Shape {
            anchors.fill: parent
            ShapePath {
                fillColor: "transparent"
                strokeWidth: circlePoint.width / 10
                strokeColor: root.isChecked ? root.checkColor : "#606060"
                capStyle: ShapePath.RoundCap

                startX: circlePoint.width * 0.2; startY: circlePoint.height * 0.5
                PathLine { x: circlePoint.width * 0.4; y: circlePoint.height * 0.8 }
                PathLine { x: circlePoint.width * 0.8; y: circlePoint.height * 0.3 }

                Behavior on strokeColor {
                    ColorAnimation {
                        duration: 500
                    }
                }
            }
        }
    }

    Item {
        anchors.left: circlePoint.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Text {
            anchors.centerIn: parent
            color: "white"
            style: Text.Outline
            styleColor: "steelblue"
            font.pixelSize: root.height / 3
            text: root.labelText
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.isChecked = !root.isChecked
    }

}
