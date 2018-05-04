import QtQuick 2.0
import QtQuick.Window 2.3

Window {
    id: root

    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.Window

    property real windowRound: 10
    property color windowColor: "white"

    property point startP: Qt.point(0, 0)
    property point offsetP: Qt.point(0, 0)
    property bool isMoving: false

    property string message

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
        message: root.message
        z: 9999

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.OpenHandCursor
            onPressed: {
                cursorShape = Qt.ClosedHandCursor
                startP = Qt.point(mouseX, mouseY)
                isMoving = true
            }

            onPositionChanged: {
                if (root.isMoving) {
                    root.offsetP = Qt.point(mouseX - root.startP.x,
                                            mouseY - root.startP.y)

                    root.x = root.x + root.offsetP.x
                    root.y = root.y + root.offsetP.y
                }
            }
            onReleased: {
                cursorShape = Qt.OpenHandCursor
                isMoving = false
            }
        }
    }
}
