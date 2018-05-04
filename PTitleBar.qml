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

    property string title
    property real titleLeftSpace: 3
    property color color: "black"
    property real radius: 0
    property real backgroundOpacity: 0.5
    property string message

    Text {
        id: titleText
        anchors.left: parent.left
        anchors.top: parent.top
        height: parent.height
        anchors.leftMargin: root.titleLeftSpace + root.radius
        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter
        color: "white"
        text: root.title
        width: parent.width / 2
        z: 1
    }

    Text {
        id: messageText
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height
        anchors.rightMargin: root.titleLeftSpace + root.radius
        horizontalAlignment: Qt.AlignRight
        verticalAlignment: Qt.AlignVCenter
        color: "grey"
        width: parent.width / 2
        z: 2
        text: root.message

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
}
