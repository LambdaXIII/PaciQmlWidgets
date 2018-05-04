import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

PBaseButton {
    id: root

    property color pressedColor: "orange"
    property color releasedColor: "darkgrey"

    onPressed: root.state = "PRESSED"
    onReleased: root.state = "RELEASED"

    states: [
        State {
            name: "PRESSED"
            PropertyChanges {
                target: root
                backgroundColor: root.pressedColor
                shadowOffset: 3
            }
        },
        State {
            name: "RELEASED"
            PropertyChanges {
                target: root
                backgroundColor: root.releasedColor
                shadowOffset: 5
            }
        }
    ]

    transitions: [
        Transition {
            from: "PRESSED"
            to: "RELEASED"

            ColorAnimation {
                target: root
                duration: 300
            }
        },
        Transition {
            from: "RELEASED"
            to: "PRESSED"
            ColorAnimation {
                target: root
                duration: 70
            }
        }
    ]
}
