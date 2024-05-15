import QtQuick

Rectangle {
    radius: height / 2
    color: "white"

    TextEdit{
        width: parent.width * 0.8
        height: parent.height * 0.8
        font.pixelSize: height
    }
}
