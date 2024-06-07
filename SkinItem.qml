import QtQuick

// 各个主题组件
Rectangle {
    property color titleColor: "black"
    // property color backgroundColor: "gray"
    property color backTopColor: "#404040"
    property color backBottomColor: "#404040"

    // signal click()

    id: root
    // color: "transparent"
    color: "#20000000"

    // Rectangle{
    //     anchors.fill: parent
    //     color: "#20000000"
    // }

    Item{
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.8

        Rectangle{
            id: title
            width: parent.width
            height: parent.height * 0.2
            color: root.titleColor
        }

        Rectangle{
            id: body
            anchors.top: title.bottom
            width: parent.width
            height: parent.height * 0.8
            // color: root.backgroundColor

            gradient: Gradient{
                GradientStop{position:0.0;color: root.backTopColor}
                GradientStop{position:1;color: root.backBottomColor}
            }
        }
    }

    // MouseArea{
    //     anchors.fill: parent
    //     onClicked: root.click()
    // }
}
