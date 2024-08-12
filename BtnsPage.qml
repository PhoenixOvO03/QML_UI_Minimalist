import QtQuick

// 按钮界面
Item {
    anchors.margins: 20

    Column{
        spacing: 20

        // 开关按钮
        Row{
            spacing: 20

            SwitchBtn{width: 100; height: 40; checkColor: "#80d080"} // 绿
            SwitchBtn{width: 100; height: 40; checkColor: "#daa520"} // 黄
            SwitchBtn{width: 100; height: 40; checkColor: "#87ceeb"} // 蓝
            SwitchBtn{width: 100; height: 40; checkColor: "#ffd0d0"} // 粉
        }

        // 复选按钮
        Row{
            spacing: 20

            CheckBtn{width: 100; height: 40; labelText: "复选1"; checkColor: "#80d080"} // 绿
            CheckBtn{width: 100; height: 40; labelText: "复选2"; checkColor: "#daa520"} // 黄
            CheckBtn{width: 100; height: 40; labelText: "复选3"; checkColor: "#87ceeb"} // 蓝
            CheckBtn{width: 100; height: 40; labelText: "复选4"; checkColor: "#ffd0d0"} // 粉
        }

        // 点击按钮
        Row{
            spacing: 20

            ClickBtn{width: 100; height: 50; btnColor: "#80d080"; btnText: "btn1"}
            ClickBtn{width: 100; height: 50; btnColor: "#daa520"; btnText: "按钮2"}
            ClickBtn{width: 100; height: 50; btnColor: "#87ceeb"}
            ClickBtn{width: 100; height: 50; btnColor: "#ffd0d0"}
        }

        // 单选按钮组
        Row{
            spacing: 20

            RadioBtnCombobox{
                width: 340
                height: 300
                checkColor: "#80d080"
                listModel: ListModel{
                    ListElement{labelText: "按钮1"}
                    ListElement{labelText: "按钮2"}
                    ListElement{labelText: "按钮3"}
                }
            }
            RadioBtnCombobox{
                width: 100
                height: 300
                checkColor: "#ffd0d0"
                listModel: ListModel{
                    ListElement{labelText: ""}
                    ListElement{labelText: ""}
                    ListElement{labelText: ""}
                }
            }
        }
    }
}
