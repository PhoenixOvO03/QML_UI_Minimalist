import QtQuick

Rectangle {
    property string titleArg: "black"
    property string backgroundArg: "gray"

    signal checkSkin()

    id: root
    color: "transparent"

    ListModel{
        id: listModel
        ListElement{
            title: "black"
            background: "gray"
        }
        ListElement{
            title: "blue"
            background: "white"
        }
        ListElement{
            title: "red"
            background: "pink"
        }
        ListElement{
            title: "green"
            background: "lightGreen"
        }
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
