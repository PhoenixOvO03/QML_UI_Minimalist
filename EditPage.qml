import QtQuick

// 编辑页面
Item {
    anchors.margins: 20

    Column{
        // 单行输入框
        Row{
            spacing: 20

            LineEdit{
                width: 200
                height: 50
            }

            LineEdit{
                width: 400
                height: 100
            }
        }

        // 区域输入框
        Row{
            spacing: 20

            AreaEdit{
                width: 200
                height: 200
            }

            AreaEdit{
                width: 300
                height: 400
            }
        }
    }
}
