import QtQuick 2.1
import RadarScanEffect 1.0

Item {
    width: 800
    height: 480

    RadarScanEffect {
        anchors.fill: parent

        /*
        SequentialAnimation on t {
            NumberAnimation { to: 1; duration: 2500; easing.type: Easing.InQuad }
            NumberAnimation { to: 0; duration: 2500; easing.type: Easing.OutQuad }
            loops: Animation.Infinite
            running: true
        }
        */

        NumberAnimation on t {
            from: 0; to: 10000; duration: 100000; easing.type: Easing.Linear
            running: true
        }

        NumberAnimation on angle {
            from: 0; to: 360; duration: 20000; easing.type: Easing.Linear
            loops: Animation.Infinite
            running: true
        }
    }
}
