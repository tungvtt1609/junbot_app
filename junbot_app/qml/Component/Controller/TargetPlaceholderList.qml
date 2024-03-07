import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root
    width: parent.width
    height: parent.height / 2
    // public for others
    readonly property var targets: [self.item1, self.item2, self.item3]
    property int m_loopTime: 0

    signal requestRemoveItem(string item)

    QtObject {
        id: self
        // hiding from others
        property string item1: ""
        property string item2: ""
        property string item3: ""
        property bool completed: false
        // only update the list in AppModel from QML after initFromModel is completed
        // remember this flag

        function removeItemAt(index) {
            console.debug("Remove item at index:", index)
            switch (index) {
            case 0:
                root.requestRemoveItem(item1)
                item1 = ""
                return
            case 1:
                root.requestRemoveItem(item2)
                item2 = ""
                return
            // case 2:
            //     root.requestRemoveItem(item3)
            //     item3 = ""
            //     return
            default:
                console.warn("Invalid index:", index)
                return
            }
        }
    }

    Row {
        anchors.fill: parent

        width: (parent.width / 3) * 2
        height: parent.height

        TargetPlaceholder {
            id: first_item
            width: parent.width / 3
            height: parent.height
            currentData: self.item1
            margins: [ 10, 15, 10, 30 ]
            onClicked: self.removeItemAt(0)
        }

        TargetPlaceholder {
            id: second_item
            width: parent.width / 3
            height: parent.height
            currentData: self.item2
            margins: [ 10, 25 ]
            onClicked: self.removeItemAt(1)
        }

        // TargetPlaceholder {
        //     id: third_item
        //     width: parent.width / 3
        //     height: parent.height
        //     currentData: self.item3
        //     margins: [ 10, 30, 10, 15 ]
        //     onClicked: self.removeItemAt(2)
        // }
    }

    SpinBox {
        id: loopTime
        width: parent.width / 5
        height: parent.height / 2
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 10
        value: 0

        onValueChanged: {
            m_loopTime = loopTime.value
            AppModel.loopTime = m_loopTime
        }
    }

    onTargetsChanged: {
        if (self.completed) {
            AppModel.deliveryNodes = targets
        }
    }

    function addTarget(newItem) {
        if (self.item1 === "") {
            self.item1 = newItem
            return true
        }

        if (self.item2 === "") {
            self.item2 = newItem
            return true
        }

        // if (self.item3 === "") {
        //     self.item3 = newItem
        //     return true
        // }

        console.warn("Full")
        return false
    }

    function removeItem(item) {
        if (self.item1 === item) {
            self.item1 = ""
            return true
        }

        if (self.item2 === item) {
            self.item2 = ""
            return true
        }

        // if (self.item3 === item) {
        //     self.item3 = ""
        //     return true
        // }

        console.warn("No item match:", item)
        return false
    }

    function initFromModel() {
        if (AppModel.deliveryNodes.length >= 3) {
            self.item1 = AppModel.deliveryNodes[0]
            self.item2 = AppModel.deliveryNodes[1]
            // self.item3 = AppModel.deliveryNodes[2]
        }
        self.completed = true
    }
}
