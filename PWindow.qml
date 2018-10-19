import QtQuick 2.0
import QtQuick.Window 2.3

Window {
    id: root

    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.Window

    property real windowRound: 10
    property color windowColor: "white"

    property alias message: titleBar.message

    Loader {
        id: messagePopupLoader
    }

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: root.windowColor
        radius: root.windowRound
        clip: true
        z: -9999
    }

    PTitleBar {
        id: titleBar
        titleLeftSpace: backgroundRect.radius
        title: root.title
        radius: root.windowRound
        z: 9999

        onWindowMove: {
            root.x = root.x + offsetX
            root.y = root.y + offsetY
        }
        onMessagePopupRequested: {
            if (messagePopupLoader.status == Loader.Null) {
                messagePopupLoader.source = "PMessagePopup.qml"
            }
            messagePopupLoader.item.message = root.message
            messagePopupLoader.item.x = (root.width - messagePopupLoader.item.width) / 2
            messagePopupLoader.item.y = (root.height - messagePopupLoader.item.height) / 2
            messagePopupLoader.item.open()
        }
    }
}
