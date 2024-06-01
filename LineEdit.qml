import QtQuick

// 单行输入框
/*
 * 感谢B站用户 C站搜喵呜角角 提出的建议：
 * 右侧的清除按钮在输入后再显示出来
*/
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

    // 输入框
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

    // 清除按钮
    Rectangle{
        id: clearBtn
        x: parent.width - parent.height * 0.75
        y: parent.height * 0.25
        width: parent.height / 2
        height: width
        radius: width / 2
        color: "#40FFFFFF"
        visible: textInput.length !== 0

        Text {
            anchors.centerIn: parent
            color: "white"
            text: "X"
            font.pixelSize: parent.width / 2
        }

        MouseArea{
            anchors.fill: parent
            onClicked: textInput.clear()
        }
    }

    function getText(){
        return textInput.text
    }
}
