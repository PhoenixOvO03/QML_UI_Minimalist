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
                sliderColor: "#80d080" // 绿
                onValueChanged: {
                    circleProgress1.value = value
                    rippleProgress1.value = value
                }
            }

            SliderProgress{
                width: 200
                height: 20
                sliderColor: "#daa520" // 黄
                onValueChanged: {
                    circleProgress2.value = value
                    rippleProgress2.value = value
                }
            }

            SliderProgress{
                width: 200
                height: 20
                sliderColor: "#87ceeb" // 蓝
                onValueChanged: {
                    circleProgress3.value = value
                    rippleProgress3.value = value
                }
            }
        }

        // 圆形进度条
        Row{
            spacing: 20

            CircleProgress{
                id: circleProgress1
                width: 200
                height: 200
                minValue: -40
                maxValue: 50
                sliderColor: "#80d080" // 绿
                typeName: "温度："
            }

            CircleProgress{
                id: circleProgress2
                width: 200
                height: 200
                minValue: 0
                maxValue: 100
                sliderColor: "#daa520" // 黄
                typeName: "湿度："
            }

            CircleProgress{
                id: circleProgress3
                width: 200
                height: 200
                minValue: 25
                maxValue: 75
                sliderColor: "#87ceeb" // 蓝
            }
        }

        // 水波进度条
        Row{
            spacing: 20

            RippleProgress{
                id: rippleProgress1
                width: 200
                height: 200
                valueColor: "#80d080" // 绿
            }

            RippleProgress{
                id: rippleProgress2
                width: 200
                height: 200
                valueColor: "#daa520" // 黄
            }

            RippleProgress{
                id: rippleProgress3
                width: 200
                height: 200
                valueColor: "#87ceeb" // 蓝
            }
        }
    }
}
