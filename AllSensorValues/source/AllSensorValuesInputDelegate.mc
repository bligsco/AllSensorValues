using Toybox.System;
using Toybox.WatchUi;

//
class AllSensorValuesInputDelegate extends WatchUi.InputDelegate {

    function initialize() {
    	System.println("inputDelegate init");
        InputDelegate.initialize();
    }
    function onKey(keyEvent) {
        System.println("input delegate onKey "+keyEvent.getKey());         // e.g. KEY_MENU = 7
        return false;
    }
    function onHold(clickEvent) {
        System.println("input delegate onHold "+clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
        return false;
    }

    function onTap(clickEvent) {
        System.println("input delegate onTap "+clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
        return false;
    }

    function onSwipe(swipeEvent) {
        System.println("input delegate onSwipe "+swipeEvent.getDirection()); // e.g. SWIPE_DOWN = 2
        return false;
    }
}