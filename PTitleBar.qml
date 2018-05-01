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

    Text {
        id: titleText
        anchors.fill: parent
        anchors.leftMargin: root.titleLeftSpace + root.radius
        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter
        color: "white"
        text: root.title
        z: 1
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
