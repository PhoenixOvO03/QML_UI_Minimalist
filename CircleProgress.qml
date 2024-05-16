import QtQuick
import QtQuick.Controls 2.12

Item {
    property int value: 0 //当前值
    property double valueAngle: -150*Math.PI/180 + value*3*Math.PI/180
    property color sliderColor: "green"
    property string typeName: ""

    Behavior on valueAngle {
        NumberAnimation{
            duration: 500
        }
    }

    onValueAngleChanged: canvas.requestPaint()

    id: root

    Text {
        x: root.width * 0.05
        anchors.verticalCenter: parent.verticalCenter
        font.family: "华文彩云"
        font.pixelSize: root.width / 8
        color: root.sliderColor
        text: root.typeName + root.value
    }

    Canvas {
        id: canvas
        width: root.width
        height: root.width
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, root.width, root.width);
            ctx.lineCap = "round";

            // 背景
            ctx.beginPath();
            ctx.arc(root.width/2, root.width/2, root.width * 0.4, -150*Math.PI/180, 150*Math.PI/180, false);
            ctx.lineWidth = root.width * 0.1
            ctx.strokeStyle = "gray";
            ctx.stroke();

            // 值
            ctx.beginPath();
            ctx.arc(root.width/2, root.width/2, root.width * 0.4, -150*Math.PI/180, valueAngle, false);
            ctx.lineWidth = root.width * 0.1
            ctx.strokeStyle = root.sliderColor;
            ctx.stroke();
        }
    }
}
