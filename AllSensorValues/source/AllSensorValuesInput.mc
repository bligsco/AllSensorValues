using Toybox.System;
using Toybox.WatchUi;

class AllSensorValuesInput extends WatchUi.InputDelegate {

    function initialize() {
    	System.println("inputDelegate init");
        InputDelegate.initialize();
    }
    function onKey(keyEvent) {
        System.println("input delegate "+keyEvent.getKey());         // e.g. KEY_MENU = 7
        return false;
    }
    function onHold(clickEvent) {
        System.println("input delegate "+clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
        return false;
    }

    function onTap(clickEvent) {
        System.println("input delegate "+clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
        return false;
    }

    function onSwipe(swipeEvent) {
        System.println("input delegate "+swipeEvent.getDirection()); // e.g. SWIPE_DOWN = 2
        return false;
    }
}