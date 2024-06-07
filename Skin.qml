import QtQuick

// 设置主题界面
Rectangle {
    property color titleColor: "black"
    // property color backgroundArg: "gray"
    property color backTopColor: "gray"
    property color backBottomColor: "gray"

    signal checkSkin()

    id: root
    color: "transparent"

    // ListModel{
    //     id: listModel
    //     ListElement{title: "black"; background: "#404040"/*"gray"*/}
    //     ListElement{title: "blue"; background: "white"}
    //     ListElement{title: "red"; background: "#ffd0d0"/*"pink"*/}
    //     ListElement{title: "green"; background: "#80d080"/*"lightGreen"*/}
    // }

    GridView{
        id: gridView
        anchors.fill: parent
        anchors.leftMargin: root.width * 0.03
        cellWidth: root.width * 0.24
        cellHeight: root.width * 0.20
        clip: true

        // model: listModel
        model: ListModel{
            // 黑灰
            ListElement{titleInit: "black"; topInit: "#404040"; bottomInit: "#404040"}
            ListElement{titleInit: "black"; topInit: "black"; bottomInit: "#404040"}
            ListElement{titleInit: "black"; topInit: "#404040"; bottomInit: "black"}
            ListElement{titleInit: "black"; topInit: "#20000000"; bottomInit: "#20000000"}
            // 蓝白
            ListElement{titleInit: "blue"; topInit: "white"; bottomInit: "white"}
            ListElement{titleInit: "blue"; topInit: "blue"; bottomInit: "white"}
            ListElement{titleInit: "blue"; topInit: "white"; bottomInit: "blue"}
            ListElement{titleInit: "blue"; topInit: "#20ffffff"; bottomInit: "#20ffffff"}
            // 红粉
            ListElement{titleInit: "red"; topInit: "#ffd0d0"; bottomInit: "#ffd0d0"}
            ListElement{titleInit: "red"; topInit: "red"; bottomInit: "#ffd0d0"}
            ListElement{titleInit: "red"; topInit: "#ffd0d0"; bottomInit: "red"}
            ListElement{titleInit: "red"; topInit: "#20ffd0d0"; bottomInit: "#20ffd0d0"}
            // 绿
            ListElement{titleInit: "green"; topInit: "#80d080"; bottomInit: "#80d080"}
            ListElement{titleInit: "green"; topInit: "green"; bottomInit: "#80d080"}
            ListElement{titleInit: "green"; topInit: "#80d080"; bottomInit: "green"}
            ListElement{titleInit: "green"; topInit: "#2080d080"; bottomInit: "#2080d080"}
            // 橘黄
            ListElement{titleInit: "darkorange"; topInit: "#ffbf00"; bottomInit: "#ffbf00"}
            ListElement{titleInit: "darkorange"; topInit: "darkorange"; bottomInit: "#ffbf00"}
            ListElement{titleInit: "darkorange"; topInit: "#ffbf00"; bottomInit: "darkorange"}
            ListElement{titleInit: "darkorange"; topInit: "#20ffbf00"; bottomInit: "#20ffbf00"}
        }

        delegate: SkinItem{
            anchors.margins: root.width * 0.05
            width: root.width * 0.23
            height: root.width * 0.19
            // titleColor: title
            // backgroundColor: background
            titleColor: titleInit
            backTopColor: topInit
            backBottomColor: bottomInit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.titleColor = titleColor
                    root.backTopColor = backTopColor
                    root.backBottomColor = backBottomColor
                    root.checkSkin()
                    gridView.currentIndex = index
                }
            }

            // onClick: {
            //     root.titleArg = titleColor
            //     root.backgroundArg = backgroundColor
            //     root.checkSkin()
            // }
        }

        highlight: Rectangle{
            color: "#40000000"
        }
    }
}
