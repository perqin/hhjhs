// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "main.js" as Script
Rectangle {
    width: 360
    height: 600
    Column {
        anchors.centerIn: parent;
        Row {
            Text {
                text: qsTr("Username prefix:");
            }
            TextInput {
                id: up;
                text: qsTr("perqin");
            }
        }
        Row {
            Text {
                text: qsTr("Password:");
            }
            TextInput {
                id: pw;
                text: qsTr("929495789");
            }
        }
        Row {
            Text {
                text: qsTr("StartNo:");
            }
            TextInput {
                id: sn;
                text: qsTr("40");
            }
        }
        Rectangle {
            width: 300;
            height: 80;
            color: "Red";
            Text {
                id: bl;
                anchors.centerIn: parent;
                text: qsTr("START!!!");
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    bl.text = "Running!!!";
                    Script.signUp(up.text, sn.text, pw.text);
                    enabled = false;
                }
            }
        }
        /*TextEdit {
            id: logT;
            height: 300;
            width: 300;
            text: "======log======\n";
        }*/
    }
    /*Timer {
        id: tim;
        property int sta: 10;
        running: false;
        interval: 1000;
        repeat: false;
        onTriggered: {
            logT.text = logT.text + "---\n\n";
            console.log("======");
            Script.signUp(up.text, sta, pw.text);
            sta++;
        }
    }*/
}
