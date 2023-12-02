import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 300
    title: "Qt with Python"

    SplitView {
        id: splitView
        anchors.fill: parent

        handle: Rectangle {
            implicitWidth: 4
            implicitHeight: 4
            color: SplitHandle.pressed ? "#000a9c"
                : (SplitHandle.hovered ? Qt.lighter("#000a9c", 1.3) : "#5e5e5e")
            
        }

        Rectangle {
            id: settingBox
            implicitWidth: 300
            SplitView.maximumWidth: 300
            color: "#fff"
            ColumnLayout{
                // anchors.fill: parent.center
                spacing: 0
                Rectangle{
                    width: settingBox.width
                    height: 50
                    color: "purple"
                    Label{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        // anchors.fill: parent
                        text: "Setting"
                        font.pixelSize: 22
                        color: "white"
                    }
                }

                Rectangle{
                    id: settingProperty
                    width: settingBox.width
                    height: settingBox.height
                    // anchors.centerIn: parent
                    color: "gray"
                    ColumnLayout{
                        Label{
                            text: "Rotation"
                            font.pixelSize: 22
                            Layout.leftMargin : 10
                        }
                        Label{
                            text: "Z-Axis"
                            font.pixelSize: 18
                            Layout.leftMargin : 20
                        }
                        Slider{
                            id: zaxis
                            Layout.alignment: Qt.AlignHCenter
                            implicitWidth: 250
                            height: 30
                            Layout.leftMargin : 20
                            from: 1
                            value: 1
                            to: 360
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: zaxis.value.toFixed(1)
                        }
                        Label{
                            text: "Y-Axis"
                            font.pixelSize: 18
                            Layout.leftMargin : 20
                        }
                        Slider{
                            id: yaxis
                            Layout.alignment: Qt.AlignHCenter
                            implicitWidth: 250
                            height: 30
                            Layout.leftMargin : 20
                            from: 1
                            value: 1
                            to: 360
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: yaxis.value.toFixed(1)
                        }
                        Label{
                            text: "X-Axis"
                            font.pixelSize: 18
                            Layout.leftMargin : 20
                        }
                        Slider{
                            id:xaxis
                            Layout.alignment: Qt.AlignHCenter
                            implicitWidth: 250
                            height: 30
                            Layout.leftMargin : 20
                            from: 1
                            value: 1
                            to: 360
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: xaxis.value.toFixed(1)
                        }
                    }

                }

            }

        }

        Rectangle {
            implicitWidth: 150
            color: "#000"
            View3D{
                anchors.fill: parent
                PerspectiveCamera {
                    z: 300
                }

                Node {
                    // x: 30

                    DirectionalLight{

                    }
                    Model{
                        source: "#Cube"
                        eulerRotation.z: zaxis.value
                        eulerRotation.y: yaxis.value
                        eulerRotation.x: xaxis.value
                        materials: PrincipledMaterial {
                            baseColor: "red"
                            metalness: 0.0
                            roughness: 0.0
                        }
                    }
                }


            }
        }
    }
}
