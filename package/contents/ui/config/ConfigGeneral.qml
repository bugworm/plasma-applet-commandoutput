import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import "../lib"

ConfigPage {
	id: page
	showAppletVersion: true
	
	property alias cfg_command: command.text
	property alias cfg_waitForCompletion: waitForCompletion.checked
	property alias cfg_interval: interval.value
	property alias cfg_clickCommand: clickCommand.text
	property alias cfg_mousewheelUpCommand: mousewheelUpCommand.text
	property alias cfg_mousewheelDownCommand: mousewheelDownCommand.text
	
	ConfigSection {
		label: i18n("Command")
		
		TextField {
			id: command
			Layout.fillWidth: true
		}

		RowLayout {
			Label {
				text: i18n("Run every ")
			}
			SpinBox {
				id: interval
				minimumValue: 1000
				stepSize: 500
				maximumValue: 2000000000 // Close enough.
				suffix: "ms"
			}
		}

		CheckBox {
			id: waitForCompletion
			text: i18n("Wait for completion")
			enabled: false
		}
	}

	ConfigSection {
		label: i18n("Font")

		ConfigFontFamily {
			configKey: 'fontFamily'
			before: i18n("Font Family:")
		}
		ConfigSpinBox {
			configKey: 'fontSize'
			before: i18n("Font Size:")
			suffix: i18n("px")
		}
		ConfigTextFormat {
			boldConfigKey: 'bold'
			italicConfigKey: 'italic'
			underlineConfigKey: 'underline'
			alignConfigKey: 'textAlign'
		}
	}
	
	ConfigSection {
		label: i18n("Misc")

		ConfigCheckBox {
			configKey: 'showBackground'
			text: i18n("Desktop Widget: Show background")
		}
	}

	ConfigSection {
		label: i18n("Click")
		
		RowLayout {
			Label {
				text: i18n("Run Command:")
			}
			TextField {
				id: clickCommand
				Layout.fillWidth: true
			}
		}
	}

	ConfigSection {
		label: i18n("Mouse Wheel")
		
		RowLayout {
			Label {
				text: i18n("Scroll Up:")
			}
			TextField {
				id: mousewheelUpCommand
				Layout.fillWidth: true
			}
		}
		
		RowLayout {
			Label {
				text: i18n("Scroll Down:")
			}
			TextField {
				id: mousewheelDownCommand
				Layout.fillWidth: true
			}
		}
	}
}
