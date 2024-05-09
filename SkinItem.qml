import QtQuick

// 各个主题组件
Rectangle {
    property string titleColor: "black"
    property string backgroundColor: "gray"

    signal click()

    id: root
    color: "transparent"

    Rectangle{
        anchors.fill: parent
        color: "#20000000"
    }

    Rectangle{
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
            color: root.backgroundColor
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.click()
    }
}
