import QtQuick

Rectangle {
    radius: height / 2
    color: "gray"
    border.width: 5
    border.color: "steelblue"

    Rectangle{
        anchors.centerIn: parent
        width: parent.width - 4
        height: parent.height - 4
        radius: height / 2
        color: "transparent"
        border.width: 1
        border.color: "white"
    }

    TextInput{
        id: textInput
        height: parent.height
        anchors.left: parent.left
        anchors.right: clearBtn.left
        font.pixelSize: height * 0.5
        font.family: "华文彩云"
        color: "white"
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        clip: true
    }

    Rectangle{
        id: clearBtn
        x: parent.width - parent.height * 0.75
        y: parent.height * 0.25
        width: parent.height / 2
        height: width
        radius: width / 2
        color: "#40FFFFFF"

        Text {
            anchors.centerIn: parent
            color: "white"
            text: "X"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: textInput.clear()
        }
    }
}
