import QtQuick 2.1
import RadarScanEffect 1.0

Rectangle {
    width: 800
    height: 480
    color: "black"

    Image {
        id: image1
        x: 194
        y: 75
        z: 6
        source: "image/biao2.png"
    }

    Image {
        id: image2
        x: 47
        y: 89
        z: 5
        source: "image/left1.png"
    }

    Image {
        id: image3
        x: 508
        y: 127
        z: 4
        source: "image/rightleft2.png"
    }

    Image {
        id: image4
        x: 508
        y: 87
        z: 5
        source: "image/right1.png"
    }

    Image {
        id: image16
        x: 611
        y: 83
        scale: 0.8
        source: "image/yuanguang.png"
    }

    Image {
        id: image6
        x: 206
        y: 271
        z: 8
        source: "image/zhizhen2.png"
    }

    Image {
        id: image7
        x: 262
        y: 144
        z: 9
        source: "image/biao1.png"
    }

    Image {
        id: image8
        x: 277
        y: 266
        scale: 1.1
        z: 10
        source: "image/zhizhen1.png"
    }

    Image {
        id: image9
        x: 624
        y: 294
        z: 10
        source: "image/wendu.png"
    }

    Image {
        id: image14
        x: 531
        y: 68
        scale: 0.7
        source: "image/P.png"
    }

    Image {
        id: image5
        x: 74
        y: 127
        z: 4
        mirror: true
        source: "image/rightleft2.png"
    }

    Image {
        id: image10
        x: 140
        y: 294
        z: 10
        source: "image/jiayou.png"
    }

    Image {
        id: image11
        x: 471
        y: 22
        source: "image/jiantou.png"
    }

    Image {
        id: image12
        x: 677
        y: 105
        scale: 0.8
        source: "image/jinguang.png"
    }

    Image {
        id: image13
        x: 82
        y: 81
        scale: 0.7
        source: "image/jiyouyali.png"
    }

    Image {
        id: image15
        x: 69
        y: 413
        z: 10
        source: "image/underside.png"
    }

    Image {
        id: image17
        x: 189
        y: 57
        scale: 0.8
        source: "image/dianchi.png"
    }

    Image {
        id: image18
        x: 265
        y: 22
        mirror: true
        source: "image/jiantou.png"
    }

}
