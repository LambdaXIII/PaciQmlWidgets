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

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: root.windowColor
        radius: root.windowRound
        clip: true

        PTitleBar {
            id: titleBar
            titleLeftSpace: backgroundRect.radius
            title: root.title
            radius: root.windowRound

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    cursorShape = Qt.DragMoveCursor
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
                    cursorShape = Qt.ArrowCursor
                    isMoving = false
                }
            }
        }
    }
}
