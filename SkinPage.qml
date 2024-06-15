import QtQuick

// 设置主题界面
Item {
    property color backTopColor: "transparent"
    property color backBottomColor: "transparent"

    signal checkSkin()

    id: root

    GridView{
        id: gridView
        anchors.fill: parent
        anchors.leftMargin: root.width * 0.03
        cellWidth: root.width * 0.24
        cellHeight: root.width * 0.20
        clip: true
        highlight: Rectangle{color: "#40000000"}

        model: ListModel{
            ListElement{topInit: "#c0444444"; bottomInit: "#c0444444"} // 灰
            ListElement{topInit: "#c0444444"; bottomInit: "#c0ffffff"} // 白
            ListElement{topInit: "#c0444444"; bottomInit: "#c0ffd0d0"} // 粉
            ListElement{topInit: "#c0444444"; bottomInit: "#c080d080"} // 绿
            ListElement{topInit: "#c0444444"; bottomInit: "#c0daa520"} // 黄
            ListElement{topInit: "#c0444444"; bottomInit: "#c087ceeb"} // 蓝
        }

        delegate: SkinItem{
            anchors.margins: root.width * 0.05
            width: root.width * 0.23
            height: root.width * 0.19
            backTopColor: topInit
            backBottomColor: bottomInit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.backTopColor = backTopColor
                    root.backBottomColor = backBottomColor
                    root.checkSkin()
                    gridView.currentIndex = index
                }
            }
        }
    }
}
