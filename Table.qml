import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

// 表格
Item {
    id: root
    clip: true

    property var titleType: [] // 标题类型
    property var showTitle: [] // 标题
    property var titleWidth: [] // 各个标题宽度
    property ListModel value: ListModel{} // 数据

    function moveUp(){table.moveUp()} // 上移
    function moveDown(){table.moveDown()} // 下移
    function copy(){table.copy()} // 复制
    function remove(){table.removeCurrent()} // 删除

    // 表格
    ListView{
        id: table
        anchors.top: allTitle.bottom
        anchors.bottom: hbar.top
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true
        model: root.value
        highlight: Rectangle{color: "#20000000"}

        delegate: Item{
            width: root.width
            height: 50

            property int currentRow: index

            Row{
                x: -hbar.position * width

                Repeater{
                    model: root.titleType

                    delegate: Rectangle{
                        width: titleRepeater.itemAt(index).width
                        height: 50
                        color: "transparent"
                        clip: true

                        Text {
                            text: text = root.value.get(currentRow)[root.titleType[index]]
                            // text:
                            anchors.centerIn: parent
                            font.pixelSize: 25
                            color: "white"
                            style: Text.Outline
                            styleColor: "steelblue"
                        }

                        MouseArea{
                            anchors.fill: parent
                            onClicked: table.currentIndex = currentRow
                        }
                    }
                }
            }
        }

        function moveUp(){
            if (currentIndex <= 0) return;
            root.value.move(currentIndex, currentIndex - 1, 1);
            currentIndex -= 1;
        }

        function moveDown(){
            if (currentIndex >= value.count - 1) return;
            root.value.move(currentIndex, currentIndex + 1, 1);
            currentIndex += 1;
        }

        function copy(){
            var data = root.value.get(currentIndex)
            root.value.insert(currentIndex, data)
        }

        function removeCurrent(){
            root.value.remove(currentIndex)
        }
    }

    // 标题
    Row{
        id: allTitle
        x: -hbar.position * width

        Repeater{
            id: titleRepeater
            model: root.titleType.length

            delegate: Rectangle{
                id: titleItem
                width: root.titleWidth.length > index ? root.titleWidth[index] : 200
                height: 50
                color: "transparent"
                border.color: "steelblue"
                clip: true

                // 标题文字
                Text {
                    text: root.showTitle[index]
                    anchors.centerIn: parent
                    font.pixelSize: 25
                    color: "white"
                    font.family: "华文彩云"
                    style: Text.Outline
                    styleColor: "steelblue"
                }

                // 修改宽度
                MouseArea{
                    anchors.fill: parent
                    property int basicX: 0
                    property int basicWidth: 0
                    onPressed:
                    {
                        basicX = mouseX
                        basicWidth = titleItem.width
                    }
                    onPositionChanged: {
                        if(pressed) {
                            var temp = basicWidth + mouseX - basicX
                            if(temp > 10)
                                titleItem.width = basicWidth + mouseX - basicX
                        }
                    }
                }
            }
        }
    }

    // 下方进度条
    ScrollBar {
        id: hbar
        hoverEnabled: true
        orientation: Qt.Horizontal
        size: parent.width / allTitle.width
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }


    // 边框
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        border.width: 3
        border.color: "steelblue"

        Rectangle{
            anchors.centerIn: parent
            width: parent.width - 2
            height: parent.height - 2
            color: "transparent"
            border.color: "white"
        }
    }
}
