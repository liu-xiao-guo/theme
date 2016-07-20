import QtQuick 2.4
import Ubuntu.Components 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "theme.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)
    theme.name :"Ubuntu.Components.Themes.SuruDark"

    function getThemeProperties() {
        var keys = Object.keys(theme);
        for(var i = 0; i < keys.length; i++) {
            var key = keys[i];
            // prints all properties, signals, functions from object
            var type = typeof theme[key];
//            console.log("type: " + type);
            console.log(key + ' : ' + theme[key]);

            if ( key === "palette" ) {                
            }
        }
    }

    Page {
        title: i18n.tr("theme")

        Label {
            anchors.centerIn: parent
            text: theme.name
        }

        Button {
            text: theme.name == "Ubuntu.Components.Themes.Ambiance" ?
                      "SuruDark" : "Ambiance"
            onClicked: {
//                console.log("theme: " + theme.name );
//                console.log("text: " + text )

                theme.name = (text == "Ambiance" ?
                                  "Ubuntu.Components.Themes.Ambiance" :
                                  "Ubuntu.Components.Themes.SuruDark" )

                getThemeProperties();
            }
        }
    }

    Component.onCompleted: {
        console.log("theme.name: " + theme.name)
    }
}

