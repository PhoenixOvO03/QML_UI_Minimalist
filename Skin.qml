import QtQuick

// 设置主题界面
Rectangle {
    property color titleArg: "black"
    property color backgroundArg: "gray"

    signal checkSkin()

    id: root
    color: "transparent"

    ListModel{
        id: listModel
        ListElement{title: "black"; background: "#404040"/*"gray"*/}
        ListElement{title: "blue"; background: "white"}
        ListElement{title: "red"; background: "#ffd0d0"/*"pink"*/}
        ListElement{title: "green"; background: "#80d080"/*"lightGreen"*/}
    }

    GridView{
        anchors.fill: parent
        anchors.leftMargin: root.width * 0.05
        cellWidth: root.width * 0.3
        cellHeight: root.width * 0.25
        clip: true

        model: listModel

        delegate: SkinItem{
            anchors.margins: 20
            width: root.width * 0.29
            height: root.width * 0.24
            titleColor: title
            backgroundColor: background

            onClick: {
                root.titleArg = titleColor
                root.backgroundArg = backgroundColor
                root.checkSkin()
            }
        }
    }
}
