import QtQuick

// 表格页面
Item {
    id: root

    Row{
        spacing: root.width * 0.05

        Item{
            width: root.width * 0.45
            height: root.height * 0.9

            ClickBtn{
                width: 80
                height: 50
                btnColor: "green"
                btnText: "上移"
                onClicked: table1.moveUp()
            }

            ClickBtn{
                x: 80
                width: 80
                height: 50
                btnColor: "green"
                btnText: "下移"
                onClicked: table1.moveDown()
            }

            ClickBtn{
                x: 160
                width: 80
                height: 50
                btnColor: "green"
                btnText: "复制"
                onClicked: table1.copy()
            }

            ClickBtn{
                x: 240
                width: 80
                height: 50
                btnColor: "red"
                btnText: "删除"
                onClicked: table1.remove()
            }

            Table{
                id: table1
                y: 50
                width: root.width / 2 - 10
                height: root.height - 100
                titleType: ["name", "age", "info"]
                showTitle: ["名字", "年龄", "信息"]
                value: ListModel{
                    ListElement{name: "老大"; age: 30; info: "力大无穷"}
                    ListElement{name: "老二"; age: 29; info: "金刚不坏"}
                    ListElement{name: "老三"; age: 28; info: "千里眼顺风耳"}
                    ListElement{name: "老四"; age: 27; info: "喷火"}
                    ListElement{name: "老五"; age: 26; info: "喷水"}
                    ListElement{name: "老六"; age: 25; info: "阴人"}
                    ListElement{name: "老七"; age: 24; info: "隐身"}
                    ListElement{name: "老八"; age: 23; info: "嗨嗨嗨"}
                    ListElement{name: "老九"; age: 22; info: "他没毛病"}
                    ListElement{name: "老十"; age: 21; info: "当皇帝"}
                    ListElement{name: "十一"; age: 20; info: "eleven"}
                    ListElement{name: "十二"; age: 19; info: "鼠、牛、虎、兔、龙、蛇、马、羊、猴、鸡、狗、猪"}
                }
                titleWidth: [100, 100, 300]
            }
        }

        Item{
            width: root.width * 0.45
            height: root.height * 0.9

            ClickBtn{
                width: 80
                height: 50
                btnColor: "green"
                btnText: "上移"
                onClicked: table2.moveUp()
            }

            ClickBtn{
                x: 80
                width: 80
                height: 50
                btnColor: "green"
                btnText: "下移"
                onClicked: table2.moveDown()
            }

            ClickBtn{
                x: 160
                width: 80
                height: 50
                btnColor: "green"
                btnText: "复制"
                onClicked: table2.copy()
            }

            ClickBtn{
                x: 240
                width: 80
                height: 50
                btnColor: "red"
                btnText: "删除"
                onClicked: table2.remove()
            }

            Table{
                id: table2
                y: 50
                width: root.width / 2 - 10
                height: root.height - 100
                titleType: ["name", "temp", "humi", "light", "ps"]
                showTitle: ["名字", "温度", "湿度", "光照", "备注"]
                value: ListModel{
                    ListElement{name: "设备1"; temp: 12; humi: 37; light: "明亮"; ps: "轻微损坏"}
                    ListElement{name: "设备2"; temp: 34; humi: 80; light: "黑暗"; ps: ""}
                    ListElement{name: "设备3"; temp: -29; humi: 37; light: "明亮"; ps: ""}
                    ListElement{name: "设备4"; temp: 27; humi: 20; light: "明亮"; ps: "数据不稳定"}
                    ListElement{name: "设备5"; temp: 17; humi: 8; light: "明亮"; ps: ""}
                    ListElement{name: "设备6"; temp: -12; humi: 17; light: "昏暗"; ps: ""}
                    ListElement{name: "设备7"; temp: 34; humi: 86; light: "极亮"; ps: ""}
                    ListElement{name: "设备8"; temp: 28; humi: 26; light: "极暗"; ps: "供电不足"}
                    ListElement{name: "设备9"; temp: -18; humi: 34; light: "明亮"; ps: ""}
                }
                titleWidth: [100, 100, 100, 100, 200]
            }
        }
    }
}
