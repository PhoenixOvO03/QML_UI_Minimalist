import QtQuick

// 按钮界面
Item {
    anchors.margins: 20

    Column{
        spacing: 20

        Row{
            spacing: 20

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "green"
            }

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "red"
            }

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "blue"
            }

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "pink"
            }
        }

        Row{
            spacing: 20

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "brown"
            }

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "orange"
            }

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "black"
            }

            SwitchBtn{
                width: 100
                height: 40
                checkColor: "yellow"
            }
        }
    }
}
