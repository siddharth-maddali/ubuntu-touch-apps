/*
 * Copyright (C) 2025  Siddharth Maddali
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * sensor-dump is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
import QtSensors 5.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'accelerometer.smaddali'
    automaticOrientation: true

    width: units.gu(36)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Accelerometer')
        }

        Column {
            anchors.centerIn: parent
            spacing: units.gu(2)

            Label {
                id: xLabel
                text: 'X: '
            }

            Label {
                id: yLabel
                text: 'Y: '
            }

            Label {
                id: zLabel
                text: 'Z: '
            }
        }

        Accelerometer {
            id: accelerometer
            active: true
            onReadingChanged: {
                xLabel.text = 'X: ' + accelerometer.reading.x.toFixed(4) + ' m/s²';
                yLabel.text = 'Y: ' + accelerometer.reading.y.toFixed(4) + ' m/s²';
                zLabel.text = 'Z: ' + accelerometer.reading.z.toFixed(4) + ' m/s²';
            }
        }
    }
}
