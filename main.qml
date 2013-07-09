import QtQuick 2.1
import RadarScanEffect 1.0

Rectangle {
    width: 800
    height: 480
    color: "black"

    Image {
        id: green_panel
        x: 194
        y: 75
        z: 6
        source: "image/biao2.png"
    }

    Image {
        id: left_up_panel
        x: 200
        y: 89
        z: 5
        source: "image/left1.png"
    }

    Image {
        id: right_bottom_panel
        x: 382
        y: 127
        z: 4
        source: "image/rightleft2.png"
    }

    Image {
        id: right_up_panel
        x: 382
        y: 87
        z: 5
        source: "image/right1.png"
    }

    Image {
        id: near_light_note
        x: 611
        y: 83
        scale: 0.8
        opacity: 0
        source: "image/yuanguang.png"
    }

    Image {
        id: green_needle
        x: 206
        y: 271
        z: 8
        source: "image/zhizhen2.png"

        transform: Rotation {
            id: green_rot
            origin.x: 190
            origin.y: 8
            angle: 210
        }
    }

    Image {
        id: blue_panel
        x: 262
        y: 144
        z: 9
        source: "image/biao1.png"
    }

    Image {
        id: blue_needle
        x: 277
        y: 266
        scale: 1.1
        z: 10
        source: "image/zhizhen1.png"

        transform: Rotation {
            id: blue_rot
            origin.x: 120
            origin.y: 5
            angle: 220
        }
    }

    Image {
        id: temperature_note
        x: 624
        y: 294
        z: 10
        opacity: 0
        source: "image/wendu.png"
    }

    Image {
        id: p_note
        x: 531
        y: 68
        scale: 0.7
        opacity: 0
        source: "image/P.png"
    }

    Image {
        id: left_bottom_panel
        x: 200
        y: 127
        z: 4
        mirror: true
        source: "image/rightleft2.png"
    }

    Image {
        id: gas_note
        x: 140
        y: 294
        z: 10
        opacity: 0
        source: "image/jiayou.png"
    }

    Image {
        id: right_arrow
        x: 471
        y: 22
        opacity: 0
        source: "image/jiantou.png"
    }

    Image {
        id: far_light_note
        x: 677
        y: 105
        scale: 0.8
        opacity: 0
        source: "image/jinguang.png"
    }

    Image {
        id: oil_note
        x: 82
        y: 81
        scale: 0.7
        opacity: 0
        source: "image/jiyouyali.png"
    }

    Image {
        id: ground
        x: 69
        y: 500
        z: 10
        source: "image/underside.png"
    }

    Image {
        id: battery
        x: 189
        y: 57
        scale: 0.8
        opacity: 0
        source: "image/dianchi.png"
    }

    Image {
        id: left_arrow
        x: 265
        y: 22
        mirror: true
        opacity: 0
        source: "image/jiantou.png"
    }

    states: [
        State {
            name: "hide"
            when: on
            PropertyChanges {
                target: ground
                y: 480
            }
            PropertyChanges {
                target: left_bottom_panel
                x: 200
            }
            PropertyChanges {
                target: left_up_panel
                x: 200
            }
            PropertyChanges {
                target: right_bottom_panel
                x: 382
            }
            PropertyChanges {
                target: right_up_panel
                x: 382
            }
            PropertyChanges {
                target: blue_rot
                angle: 220
            }
            PropertyChanges {
                target: green_rot
                angle: 210
            }
        },
        State {
            name: "show"
            PropertyChanges {
                target: ground
                y: 413
            }
            PropertyChanges {
                target: left_bottom_panel
                x: 74
            }
            PropertyChanges {
                target: left_up_panel
                x: 47
            }
            PropertyChanges {
                target: right_bottom_panel
                x: 508
            }
            PropertyChanges {
                target: right_up_panel
                x: 508
            }
            PropertyChanges {
                target: blue_rot
                angle: -40
            }
            PropertyChanges {
                target: green_rot
                angle: -30
            }
        }
    ]

    transitions: [
        Transition {
            to: "*"

            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation {
                        target: ground
                        properties: "y"
                        duration: 1200
                        easing.type: Easing.OutExpo
                        //easing.type: Easing.OutElastic
                        //easing.type: Easing.OutBounce
                    }

                    NumberAnimation { target: left_bottom_panel; property: "x"; duration: 1200; easing.type: Easing.OutElastic }
                    NumberAnimation { target: left_up_panel; property: "x"; duration: 1200; easing.type: Easing.OutElastic }
                    NumberAnimation { target: right_bottom_panel; property: "x"; duration: 1200; easing.type: Easing.OutElastic }
                    NumberAnimation { target: right_up_panel; property: "x"; duration: 1200; easing.type: Easing.OutElastic }

                    NumberAnimation { target: blue_rot; property: "angle"; duration: 1000; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: green_rot; property: "angle"; duration: 1000; easing.type: Easing.InOutQuad }
                }
                ParallelAnimation {
                    id: show_animation
                    ParallelAnimation {
                        SequentialAnimation {
                            NumberAnimation { target: blue_rot; from: -40; to: 220; property: "angle"; duration: 6000; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: blue_rot; from: 220; to: -40; property: "angle"; duration: 6000; easing.type: Easing.InOutQuad }
                        }
                        SequentialAnimation {
                            NumberAnimation { target: green_rot; from: -30; to: 210; property: "angle"; duration: 8000; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: green_rot; from: 210; to: -30; property: "angle"; duration: 8000; easing.type: Easing.InOutQuad }
                        }

                        loops: Animation.Infinite
                    }
                    ParallelAnimation {
                        SequentialAnimation {
                            NumberAnimation { target: oil_note; from: 0; to: 1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: battery; from: 0; to: 1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: left_arrow; from: 0; to: 1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: right_arrow; from: 0; to: 1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: p_note; from: 0; to: 1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: near_light_note; from: 0; to: 1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                            NumberAnimation { target: far_light_note; from: 0; to: 1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }

                            ParallelAnimation {
                                NumberAnimation { target: oil_note; from: 1; to: 0; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                                NumberAnimation { target: battery; from: 1; to: 0; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                                NumberAnimation { target: left_arrow; from: 1; to: 0; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                                NumberAnimation { target: right_arrow; from: 1; to: 0; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                                NumberAnimation { target: p_note; from: 1; to: 0; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                                NumberAnimation { target: near_light_note; from: 1; to: 0; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                                NumberAnimation { target: far_light_note; from: 1; to: 0; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                            }

                            loops: Animation.Infinite
                        }

                        SequentialAnimation {
                            NumberAnimation { target: gas_note; from: 0; to: 1; property: "opacity"; duration: 500; easing.type: Easing.OutQuad }
                            NumberAnimation { target: gas_note; from: 1; to: 0; property: "opacity"; duration: 500; easing.type: Easing.InQuad }

                            loops: Animation.Infinite
                        }

                        SequentialAnimation {
                            NumberAnimation { target: temperature_note; from: 0; to: 1; property: "opacity"; duration: 600; easing.type: Easing.OutQuad }
                            NumberAnimation { target: temperature_note; from: 1; to: 0; property: "opacity"; duration: 600; easing.type: Easing.InQuad }

                            loops: Animation.Infinite
                        }
                    }
                }
            }
        }
    ]

    Component.onCompleted: {
        state = "show"
    }
}
