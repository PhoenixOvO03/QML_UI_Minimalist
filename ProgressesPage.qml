import QtQuick

// 进度条页面
Item {
    anchors.margins: 20

    // 滑块进度条
    SliderProgress{
        width: 200
        height: 20
        sliderColor: "blue"
        onValueChanged: circleProgress1.value = value
    }

    SliderProgress{
        x: 250
        width: 200
        height: 20
        sliderColor: "pink"
        onValueChanged: circleProgress2.value = value
    }

    CircleProgress{
        id: circleProgress1
        y : 100
        width: 200
        height: 200
        sliderColor: "blue"
    }

    CircleProgress{
        id: circleProgress2
        x: 250
        y : 100
        width: 200
        height: 200
        sliderColor: "pink"
    }
}
