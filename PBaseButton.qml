import QtQuick 2.0
import QtQuick.Controls 2.2
import Paci.UI 1.0
import QtGraphicalEffects 1.0

Button {
    id: root

    property color backgroundColor: "darkgrey"
    background: Rectangle {
        anchors.fill: parent
        radius: 5
        color: backgroundColor
        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: root.down ? 3 : 5
            color: "#aa000000"
            spread: 0
            samples: 41
            radius: 20
        }
    }
}
