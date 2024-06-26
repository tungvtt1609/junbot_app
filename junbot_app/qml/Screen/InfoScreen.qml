import QtQuick 2.12
import QmlCustomItem 1.0
import "../Component/Common"
import "../Component/Login"

Item {
    id: root
    width: 1080
    height: 720

    QText {
        id: name
        anchors {
            top: logo.bottom
            topMargin: 28
            horizontalCenter: parent.horizontalCenter
        }
        font.bold: true
        text: qsTr("Scada App for Omni Robot - Version 1.0
        Copyright by Thai Huu Nguyen")
    }

    Rectangle {
        id: logo
        width: 200
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        Image {
            id: logo_image
            anchors.centerIn: parent
            width: 200
            height: 200
            source: "qrc:/res/icon_ro.png"
        }
    }

    // QText {
    //     id: name
    //     anchors {
    //         top: logo.bottom
    //         topMargin: 28
    //         horizontalCenter: parent.horizontalCenter
    //     }
    //     font.bold: true
    //     text: qsTr("Robot VDR-01 of Viettel Manufacturing")
    // }

    // Rectangle{
    //         id: logout_button
    //         width: 200
    //         height: 75
    //         anchors.bottom: parent.bottom
    //         anchors.bottomMargin: 20
    //         anchors.right: parent.right
    //         anchors.rightMargin: 20
    //         color: "red"
    //         radius: 40
    //         Text {
    //             id: log_text
    //             anchors.centerIn: parent
    //             text: qsTr("Log out")
    //             font.pixelSize: 30
    //             font.bold: true
    //             color: "white"

    //         }
    //         MouseArea{
    //             anchors.fill: parent
    //             onClicked: {
    //                 QmlHandler.qmlSendEvent(ENUMS.LogoutRequest)
    //             }
    //             onPressed: {
    //                 logout_button.color = "#BC1010"
    //                 log_text.color = "#CAC7C7"
    //             }
    //             onReleased: {
    //                 logout_button.color = "red"
    //                 log_text.color = "white"
    //             }
    //         }
    //     }
}
