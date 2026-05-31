/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Window 2.0

Rectangle {
    id: root
    color: "#a4b980"
    anchors.fill: parent
    property int stage

    property variant images : [
        "images/spinner1.svg",
        "images/spinner2.svg",
        "images/spinner3.svg",
        "images/spinner4.svg",
        "images/spinner5.svg",
        "images/spinner6.svg",
        "images/spinner7.svg",
        "images/spinner8.svg",
    ];
    property int currentImage : 0;

    Repeater {
        id: repeaterImg;
        model: images;
        delegate: Image {
            id: spinner
            source: modelData;
            asynchronous: true;
            height: 48
            width: 48
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            visible: (model.index === currentImage);
        }
    }

    Timer {
        id: timerAnimImg;
        interval: 150; // here is the delay between 2 images in msecs
        running: true; // stopped by default, use start() or running=true to launch
        repeat: true;
        onTriggered: {
            if (currentImage < images.length -1) {
                currentImage++; // show next image
            }
            else {
                currentImage = 0; // go back to the first image at the end
            }
        }
    }
}
