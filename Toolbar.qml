import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

RowLayout {
    signal newGame()
    signal quitApp()

    function stoptimer() {
        timer.stop()
    }

    function starttimer() {
        gameplay.score = 0
        gameplay.alls = 0
        timerField.text = "Time left: 20"
        timer.sec = 0
        timer.restart()
    }

    Button {
        id: newGameButton

        text: "New Game"
        onClicked: {
            starttimer()
            newGame()
        }
    }

    TextField {
        id: timerField

        readOnly: true
        selectByMouse: false
        Layout.fillWidth: true

        horizontalAlignment: TextInput.AlignHCenter
        text: "Time left: 20"

        Timer {
            id: timer
            interval: 1000
            running: false
            repeat: true
            property int sec: 0

            onTriggered: {
                timerField.text = "Time left: "
                if (timer.sec > 9) timerField.text += 0
                timerField.text += 19 - timer.sec
                timer.sec++
                if (timer.sec == 21) {
                    gameplay.endGame()
                }
            }
        }
    }

    Button {
        id: quitButton

        text: "Quit"
        onClicked: quitApp()
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Ctrl+N"]
        onActivated: newGame()
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: [StandardKey.Close, "Ctrl+Q"]
        onActivated: quitApp()
    }
}
