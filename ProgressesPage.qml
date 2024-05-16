import QtQuick

// 进度条页面
Item {
    anchors.margins: 20

    Column{
        spacing: 20

        // 滑块进度条
        Row{
            spacing: 20

            SliderProgress{
                width: 200
                height: 20
                sliderColor: "blue"
                onValueChanged: circleProgress1.value = value
            }

            SliderProgress{
                width: 200
                height: 20
                sliderColor: "pink"
                onValueChanged: circleProgress2.value = value
            }

            SliderProgress{
                width: 200
                height: 20
                sliderColor: "yellow"
                onValueChanged: circleProgress3.value = value
            }
        }

        // 圆形进度条
        Row{
            spacing: 20

            CircleProgress{
                id: circleProgress1
                width: 200
                height: 200
                sliderColor: "blue"
                typeName: "温度："
            }

            CircleProgress{
                id: circleProgress2
                width: 200
                height: 200
                sliderColor: "pink"
                typeName: "湿度："
            }
            CircleProgress{
                id: circleProgress3
                width: 200
                height: 200
                sliderColor: "yellow"
            }
        }
    }
}
