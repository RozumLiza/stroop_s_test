import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window {
    id: w

    minimumWidth: 700
    maximumWidth: 700
    width: 700
    minimumHeight: 700
    maximumHeight: 700
    height: 700
    visible: true
    title: qsTr("Stroop`s test")
    color: "#E0FFFF"

    ColumnLayout {
        id:clstart
        anchors.centerIn: w.contentItem
        spacing: (w.height - startrc1.height - startrc2.height - startrc0.height - startrc00.height) / 5

        Rectangle {
            id: startrc0
            width: 200
            height: 100
            color: "#E0FFFF"

            Text {
                text: "  LIZA`S GAME\nSTROOP`S TEST"
                anchors.centerIn: startrc0
                color: "#8B008B"
                font.bold: true
                font.pointSize: 30
                style: Text.Raised
            }
        }

        Rectangle {
            id: startrc1
            width: 200
            height: 100
            color: "#8B008B"
            border.color: "black"
            border.width: 5
            Text {
                text: "START"
                anchors.centerIn: startrc1
                color: "#E0FFFF"
                font.bold: true
                font.pointSize: 30
                style: Text.Raised
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clstart.visible = false
                    cl.visible = true
                    toolbar.starttimer()
                }
            }
        }

        Rectangle {
            id: startrc00
            width: 200
            height: 10
            color: "#E0FFFF"
            Text {
                text: "mini rules: click on the color of the inscription"
                anchors.centerIn: startrc00
                color: "#8B008B"
                font.bold: true
                font.pointSize: 20
                style: Text.Raised
            }
        }

        Rectangle {
            id: startrc2
            width: 200
            height: 100
            color: "#8B008B"
            border.color: "black"
            border.width: 5
            Text {
                text: "QUIT"
                anchors.centerIn: startrc2
                color: "#E0FFFF"
                font.bold: true
                font.pointSize: 30
                style: Text.Raised
            }
            MouseArea {
                anchors.fill: parent

                onClicked: {
                    Qt.quit()
                }
            }
        }
    }

    ColumnLayout {
        id: cl
        visible: false

        anchors.centerIn: w.contentItem
        spacing: 2

        Gameplay {
            id: gameplay
        }

        Toolbar {
            id: toolbar

            onNewGame: {
                qDebug("hhh");
                gameplay.newGame()
            }
            onQuitApp: Qt.quit()
        }
    }

    ColumnLayout {
        id:clend
        anchors.centerIn: w.contentItem
        spacing: (w.height - endrc1.height - endrc2.height - endrc0.height) / 4
        visible: false

        Rectangle {
            id: endrc1
            width: clend.spacing + endrc3.width + endrc4.width
            height: 100
            color: "#E0FFFF"
            Text {
                text: "Score: "+gameplay.score+" of "+gameplay.alls+" - "+gameplay.percent+"%"
                anchors.centerIn: endrc1
                color: "#8B008B"
                font.bold: true
                font.pointSize: 40
                style: Text.Raised
            }
        }
        Rectangle {
            id: endrc2
            width: clend.spacing + endrc3.width + endrc4.width
            height: 100
            color: "#E0FFFF"
            Text {
                text: gameplay.result
                anchors.centerIn: endrc2
                color: "#8B008B"
                font.bold: true
                font.pointSize: 30
                style: Text.Raised
            }
        }
        Rectangle {
            id: endrc0
            width: clend.spacing + endrc3.width + endrc4.width
            height: 100
            color: "#E0FFFF"
            RowLayout {
                spacing: (w.width - endrc3.width - endrc4.width) / 3

                Rectangle {
                    id: endrc3
                    width: 250
                    height: 100
                    color: "#8B008B"
                    border. color: "black"
                    border.width: 5
                    Text {
                        text: "NEW GAME"
                        anchors.centerIn: endrc3
                        color: "#E0FFFF"
                        font.bold: true
                        font.pointSize: 30
                        style: Text.Raised
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            clend.visible = false
                            cl.visible = true
                            gameplay.visible = true
                            toolbar.visible = true
                            gameplay.newGame()
                            toolbar.starttimer()
                        }
                    }
                }
                Rectangle {
                    id: endrc4
                    width: 200
                    height: 100
                    color: "#8B008B"
                    border. color: "black"
                    border.width: 5
                    Text {
                        text: "QUIT"
                        anchors.centerIn: endrc4
                        color: "#E0FFFF"
                        font.bold: true
                        font.pointSize: 30
                        style: Text.Raised
                    }
                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            Qt.quit()
                        }
                    }
                }
            }
        }
    }
}

