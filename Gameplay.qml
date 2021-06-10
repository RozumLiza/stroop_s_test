import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

ColumnLayout {
    id: cl
    width: 700
    height: 674
    spacing: 0

    property int score: 0
    property int alls: 0
    property int percent: 0
    property string result: ""

    function newGame () {
        var newGameConfigs = colors.newGame()
        r1.color1 = newGameConfigs[0]
        r2.color2 = newGameConfigs[1]
        r3.color3 = newGameConfigs[2]
        r4.color4 = newGameConfigs[3]
        colorstext.textcolor = newGameConfigs[4]
        colorstext.colortext = newGameConfigs[5]
    }

    function endGame () {
        percent = (gameplay.score * 100) / gameplay.alls
        if (percent == 100) result = "   A phenomenal result!\nYour cognitive flexibility\n        on a high level!"
        if (percent < 100) result = "         A good result!\nYour cognitive flexibility\n        at a good level!"
        if (percent < 80) result = "        A normal result!\nYour cognitive flexibility\n  at the secondary level!"
        if (percent < 50) result = "The result of below normal.\n   Your cognitive flexibility\n        isn`t high enough."
        toolbar.stoptimer()
        cl.visible = false
        toolbar.visible = false
        clend.visible = true
    }

    Rectangle {
        id: rc1
        width: 700
        height: 374
        color: "#E0FFFF"

        Text {
            id: colorstext

            property string textcolor: "red"
            property string colortext: "red"

            anchors.centerIn: rc1
            text: textcolor
            font.italic: false
            font.family: "Arial"
            color: colortext
            font.bold: true
            font.pointSize: 100
            style: Text.Raised
        }
    }
    Rectangle {
        id: rc2
        width: 700
        height: 300
        y: 374
        color: "#E0FFFF"

        Rectangle {
            id: r1

            property string color1: "red"

            width: 120
            height: 120
            color: color1
            x: 80; y: 20
            border.color: "black"
            border.width: 5

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (r1.color1 == colorstext.colortext) {
                        score++;
                    }
                    alls++;
                    newGame()
                }
            }
        }
        Rectangle {
            id: r2

            property string color2: "blue"

            width: 120
            height: 120
            color: color2
            x: 220; y: 20
            border.color: "black"
            border.width: 5

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (r2.color2 == colorstext.colortext) {
                        score++;
                    }
                    alls++;
                    newGame()
                }
            }
        }
        Rectangle {
            id: r3

            property string color3: "red"

            width: 120
            height: 120
            color: color3
            x: 360; y: 20
            border.color: "black"
            border.width: 5

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (r3.color3 == colorstext.colortext) {
                        score++;
                    }
                    alls++;
                    newGame()
                }
            }
        }
        Rectangle {
            id: r4

            property string color4: "red"

            width: 120
            height: 120
            color: color4
            x: 500; y: 20
            border.color: "black"
            border.width: 5

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (r4.color4 == colorstext.colortext) {
                        score++;
                    }
                    alls++;
                    newGame()
                }
            }
        }
    }

    Component.onCompleted: {
        newGame()
    }
}
