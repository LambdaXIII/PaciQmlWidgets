import QtQuick 2.0

Item {
    id: root

    //    color: "black"
    //    opacity: 0.5
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 25
    clip: true

    property alias title: titleText.text
    property real titleLeftSpace: 3
    property color color: "black"
    property real radius: 0
    property real backgroundOpacity: 0.5
    property alias message: messageText.text

    property bool isMoving: false
    property point startPoint: Qt.point(0, 0)

    signal windowMove(real offsetX, real offsetY)
    signal messagePopupRequested(string msg)

    Text {
        id: titleText
        anchors.left: parent.left
        anchors.top: parent.top
        height: parent.height
        anchors.leftMargin: root.titleLeftSpace + root.radius
        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter
        color: "white"
        z: 1
    }

    Text {
        id: messageText
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.left: titleText.right
        height: parent.height
        anchors.rightMargin: root.titleLeftSpace + root.radius
        horizontalAlignment: Qt.AlignRight
        verticalAlignment: Qt.AlignVCenter
        color: "grey"
        //        width: parent.width / 2
        z: 2
        elide: Text.ElideMiddle

        SequentialAnimation on color {
            id: messageTextColorAnimation
            ColorAnimation {
                from: "grey"
                to: "yellow"
                duration: 50
            }
            ColorAnimation {
                from: "yellow"
                to: "grey"
                duration: 600
            }
        }

        onTextChanged: {
            messageTextColorAnimation.complete()
            messageTextColorAnimation.start()
        }
    }

    Rectangle {
        width: parent.width
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height * 2
        radius: root.radius
        color: root.color
        z: -1
        opacity: root.backgroundOpacity
    }

    MouseArea {
        id: mouseArea
        z: 10
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        anchors.fill: parent
        cursorShape: Qt.OpenHandCursor
        onPressed: {
            if (mouse.button === Qt.LeftButton) {
                cursorShape = Qt.ClosedHandCursor
                startPoint = Qt.point(mouseX, mouseY)
                isMoving = true
            }
        }

        onPositionChanged: {
            if (root.isMoving) {
                root.windowMove(mouseX - root.startPoint.x,
                                mouseY - root.startPoint.y)
            }
        }
        onReleased: {
            if (mouse.button === Qt.LeftButton) {
                cursorShape = Qt.OpenHandCursor
                isMoving = false
            }
        }
        onClicked: {
            if (root.message != "" && mouse.button === Qt.RightButton) {
                root.messagePopupRequested(root.message)
            }
        }
    }
}
