import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import "controls"

import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.14
import QtQuick.Shapes 1.14
import QtGraphicalEffects 1.0


Window {
	id : root
	width: 700
	//maximumWidth : 1280
	//minimumWidth : width
    height: 500
	//maximumHeight : 800
	//minimumHeight : height
	title:"membuat windows"
	color : "grey"
    visible: true
    flags:Qt.Dialog
	
	 CircularSlider {
			x:10
			y : 10
            id: customSlider
            hideProgress: false
            hideTrack: false
			interactive: true
            width: 300
            height: 300
			
            handleColor: "#6272A4"
            handleWidth: 32
            handleHeight: 32
            value: 0.5
			
            // Custom progress Indicator
            Item {
                anchors.fill: parent
                anchors.margins: 5
                Rectangle{
                    id: mask
                    anchors.fill: parent
                    radius: width / 2
                    color: "#282A36"
                    border.width: 5
                    border.color: "#44475A"
                }

                Item {
                    anchors.fill: mask
                    anchors.margins: 5
                    layer.enabled: true
                    rotation: 180
                    layer.effect: OpacityMask {
                        maskSource: mask
                    }
                    Rectangle {
                        height: parent.height * customSlider.value
                        width: parent.width
                        color:"#8BE9FD"
                    }
                }

                Label {
                    anchors.centerIn: parent
                    font.pointSize: 42
                    color: "#FEFEFE"
                    text: Number(customSlider.value * 100).toFixed() + "%"
                }
            }
        }
		
		
	CircularSlider {
                id: progressIndicator
				x : 310
				y : 10
                hideProgress: true
                hideTrack: true
                width: 300
                height: 300

                interactive: true
                value: 50
				minValue: 0
                maxValue: 100

                Repeater {
                    model: 72

                    Rectangle {
                        id: indicator
                        width: 5
                        height: 20
                        radius: width / 2
                        color: indicator.angle > progressIndicator.angle ? "#16171C" : "#7CFF6E"
                        readonly property real angle: index * 5
                        transform: [
                            Translate {
                                x: progressIndicator.width / 2 - width / 2
                            },
                            Rotation {
                                origin.x: progressIndicator.width / 2
                                origin.y: progressIndicator.height / 2
                                angle: indicator.angle
                            }
                        ]
                    }
                }
				
				Label {
                    anchors.centerIn: parent
                    font.pointSize: 42
                    color: "#FEFEFE"
                    text: Number(progressIndicator.value).toFixed() + "%"
                }
				
            }


	
}













