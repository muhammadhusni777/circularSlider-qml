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
			interactive: false
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
                    text: Number(customSlider.value).toFixed() + "%"
                }
            }
        }
		
		
	

		Timer{
		id:guitimer
		interval: 200
		repeat: true
		running: true
		onTriggered: {
			customSlider.value = backend.battery()
		}
		
		}


	
}













