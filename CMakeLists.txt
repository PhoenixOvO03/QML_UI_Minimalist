cmake_minimum_required(VERSION 3.16)

project(QML_UI_Minimalist VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

set(app_icon_resource_windows "${CMAKE_CURRENT_SOURCE_DIR}/res/icon.rc")

qt_add_executable(appQML_UI_Minimalist
    main.cpp ${app_icon_resource_windows}
)

qt_add_qml_module(appQML_UI_Minimalist
    URI QML_UI_Minimalist
    VERSION 1.0
    QML_FILES
        Main.qml
        Skin.qml
        Body.qml
        SkinItem.qml
        SiderbarItem.qml
        Pages.qml
        BtnsPage.qml
        SwitchBtn.qml
        CheckBtn.qml
        RadioBtnCombobox.qml
        ProgressesPage.qml
        SliderProgress.qml
        CircleProgress.qml
        EditPage.qml
        LineEdit.qml
        ClickBtn.qml
        RippleProgress.qml
        AreaEdit.qml
        TablePage.qml
        Table.qml
    RESOURCES
        res/close.png
        res/max.png
        res/min.png
        res/normal.png
        res/skin.png
        res/skin.png
        res/Qt.png
        res/title.png
        res/menu.png
        res/switch.png
        res/progress.png
        res/edit.png
        res/bilibili.png
        res/table.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQML_UI_Minimalist PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQML_UI_Minimalist
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQML_UI_Minimalist
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQML_UI_Minimalist
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
