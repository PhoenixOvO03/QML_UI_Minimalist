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
        }

        // 复选按钮
        Row{
            spacing: 20

            CheckBtn{width: 100; height: 40; labelText: "复选1"; checkColor: "green"}
            CheckBtn{width: 100; height: 40; labelText: "复选2"; checkColor: "red"}
            CheckBtn{width: 100; height: 40; labelText: "复选3"; checkColor: "blue"}
            CheckBtn{width: 100; height: 40; labelText: "复选4"; checkColor: "pink"}
        }

        // 点击按钮
        Row{
            spacing: 20

            ClickBtn{width: 100; height: 50; btnColor: "green"; btnText: "btn1"}
            ClickBtn{width: 100; height: 50; btnColor: "red"; btnText: "按钮2"}
            ClickBtn{width: 100; height: 50; btnColor: "blue"}
            ClickBtn{width: 100; height: 50; btnColor: "pink"}
        }

        // 单选按钮组
        Row{
            spacing: 20

            RadioBtnCombobox{
                width: 340
                height: 300
                listModel: ListModel{
                    ListElement{labelText: "按钮1"}
                    ListElement{labelText: "按钮2"}
                    ListElement{labelText: "按钮3"}
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
