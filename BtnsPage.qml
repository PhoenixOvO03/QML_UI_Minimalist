import QtQuick

// 按钮界面
Item {
    anchors.margins: 20

    Column{
        spacing: 20

        // 开关按钮
        Row{
            spacing: 20

            SwitchBtn{width: 100; height: 40; checkColor: "green"}
            SwitchBtn{width: 100; height: 40; checkColor: "red"}
            SwitchBtn{width: 100; height: 40; checkColor: "blue"}
            SwitchBtn{width: 100; height: 40; checkColor: "pink"}
            SwitchBtn{width: 100; height: 40; checkColor: "brown"}
        }

        // 复选按钮
        Row{
            spacing: 20

            CheckBtn{width: 100; height: 100; checkColor: "green"}
            CheckBtn{width: 100; height: 100; checkColor: "red"}
            CheckBtn{width: 100; height: 100; checkColor: "blue"}
            CheckBtn{width: 100; height: 100; checkColor: "pink"}
            CheckBtn{width: 100; height: 100; checkColor: "brown"}
        }

        // 点击按钮
        Row{
            spacing: 20

            ClickBtn{width: 100; height: 50; btnColor: "green"; btnText: "btn1"}
            ClickBtn{width: 100; height: 50; btnColor: "red"; btnText: "按钮2"}
            ClickBtn{width: 100; height: 50; btnColor: "blue"}
            ClickBtn{width: 100; height: 50; btnColor: "pink"}
            ClickBtn{width: 100; height: 50; btnColor: "brown"}
        }

        // 单选按钮组
        Row{
            spacing: 20

            RadioBtnCombobox{
                width: 300
                height: 300
                listModel: ListModel{
                    ListElement{labelText: "按钮1"}
                    ListElement{labelText: "按钮2"}
                    ListElement{labelText: "按钮3"}
                }
            }
            RadioBtnCombobox{
                width: 200
                height: 200
                checkColor: "lightblue"
                listModel: ListModel{
                    ListElement{labelText: "btn1"}
                    ListElement{labelText: "btn2"}
                    ListElement{labelText: "btn3"}
                }
            }
            RadioBtnCombobox{
                width: 100
                height: 300
                checkColor: "pink"
                listModel: ListModel{
                    ListElement{labelText: ""}
                    ListElement{labelText: ""}
                    ListElement{labelText: ""}
                }
            }
        }
    }
}
