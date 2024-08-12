import QtQuick

// 水波进度条
Item {
    id:root
    property int value: 0  //百分比数值
    property color valueColor: "green"
    property int percent: 0

    onValueChanged: {
        if (value > 100) value = 100
        else if (value < 0) value = 0
        percent = value
    }

    Behavior on percent{
        NumberAnimation{
            duration: 1000
        }
    }

    onPercentChanged: canvas.requestPaint()

    Canvas{
        id:canvas
        anchors.fill: parent
        property real p: root.percent/100  //百分比
        property real r: root.width * 0.5 //半径
        property real j: 0  //动画位移

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, root.width, root.width);
            ctx.save()
            // 背景
            ctx.translate(root.width/2,root.height/2)
            var y = r-p*root.width  //波纹高度的Y
            ctx.beginPath()
            ctx.arc(0,0,r,0,2*Math.PI)
            ctx.fillStyle = root.valueColor
            ctx.fill()
            // 波浪
            ctx.clip()
            ctx.beginPath()
            ctx.moveTo(-r,y)
            for(var i=0;i<=r*2;i++){
                ctx.lineTo(-r+i,y+18*Math.sin((i+j)*Math.PI/180))
            }
            ctx.lineTo(r,r)
            ctx.lineTo(-r,r)
            ctx.closePath()
            ctx.fillStyle = Qt.lighter(root.valueColor)
            ctx.fill()
            ctx.restore()
            // 相位移动
            canvas.j = canvas.j+5
        }
    }

    Text {
        text: root.percent + '%'
        font.bold: true
        anchors.centerIn: parent
        font.pointSize: 30
        color: "#80444444"
        style: Text.Outline
        styleColor: "#80ffffff"
    }

    Timer{
        repeat: true
        interval: 10
        running: true
        onTriggered: canvas.requestPaint()
    }

}

