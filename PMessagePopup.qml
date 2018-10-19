import QtQuick 2.0
import QtQuick.Controls 2.2

Popup {
    property alias message: messageText.text

    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutside
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    //    height: 200
    //    width: 300
    background: Rectangle {
        id: bgRect
        color: "lightyellow"
        radius: 5
        opacity: 0.8
    }

    Text {
        id: messageText
        anchors.fill: parent
        wrapMode: Text.WrapAnywhere
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }
}
