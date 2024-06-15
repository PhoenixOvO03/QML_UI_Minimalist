import QtQuick

// 各个主题组件
Rectangle {
    property color backTopColor: "transparent"
    property color backBottomColor: "transparent"

    id: root
    color: "#20000000"

    Rectangle{
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.8
        radius: width * 0.1
        color: "transparent"
        border.color: "#80ffffff"

        // 背景渐变
        gradient: Gradient{
            GradientStop{position:0.0;color: root.backTopColor}
            GradientStop{position:1;color: root.backBottomColor}
        }
    }
}
