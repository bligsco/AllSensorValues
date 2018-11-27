//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

var last_key = null;
var last_behavior = null;

//it extends inputDelegate
class AllSensorValuesBehaviorDelegate extends WatchUi.BehaviorDelegate {

    enum {
        ON_NEXT_PAGE,
        ON_PREV_PAGE,
        ON_MENU,
        ON_BACK,
        ON_NEXT_MODE,
        ON_PREV_MODE,
        ON_SELECT
    }

    function initialize() {
    	System.println("behaviorDelegate init");
        BehaviorDelegate.initialize();
    }

    function onNextPage() {
        last_behavior = ON_NEXT_PAGE;
    	System.println("ON_NEXT_PAGE");
        return false;
    }

    function onPreviousPage() {
        last_behavior = ON_PREV_PAGE;
    	System.println("ON_PREV_PAGE");
    	
    	
    	//TEST
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return false;
    }

    function onMenu() {
        last_behavior = ON_MENU;
    	System.println("ON_MENU");
    	
    	//test
    	var view = new View2();
        var delegate = new AllSensorValuesInputDelegate();
        
        //WatchUi.pushView(view, delegate, WatchUi.SLIDE_IMMEDIATE);
    	
    	
        return false;
    }

    function onBack() {
    	System.println("ON_BACK");
        if (ON_BACK == last_behavior) {
            System.exit();
        }
        last_behavior = ON_BACK;
        return false;
    }

    function onNextMode() {
    	System.println("ON_NEXT_MODE");
        last_behavior = ON_NEXT_MODE;
        return false;
    }

    function onPreviousMode() {
    	System.println("ON_PREV_MODE");
        last_behavior = ON_PREV_MODE;
        return false;
    }

    function onSelect() {
    	System.println("ON_SELECT");
        last_behavior = ON_SELECT;
        return false;
    }

    function onTap(evt) {
    	System.println("onTap");
        return false;//
    }

    function onHold(evt) {
    	System.println("onHold");
        return false;//
    }

    function onRelease(evt) {
    	System.println("onRelease");
        return false;//
    }

    function onSwipe(evt) {
        var swipe = evt.getDirection();

        if (swipe == SWIPE_UP) {
    		System.println("Swipe u");
        } else if (swipe == SWIPE_RIGHT) {
    		System.println("swipe r");
        } else if (swipe == SWIPE_DOWN) {
    		System.println("swipe d");
        } else if (swipe == SWIPE_LEFT) {
    		System.println("swipe l");
        }

        return false;//
    }

    function onKey(evt) {
        var key = evt.getKey();
        var keyString = getKeyString( key );

        if( keyString != null ) {
        }

        if (key == KEY_ESC) {
            if (last_key == KEY_ESC) {
                System.exit();
            }
        }

        last_key = key;

        return false;//
    }

    function onKeyPressed(evt) {
        var keyString = getKeyString( evt.getKey() );
        if( keyString != null ) {
        }

        return false;//
    }

    function onKeyReleased(evt) {
        var keyString = getKeyString( evt.getKey() );
        if( keyString != null ) {
        }

        return false;//
    }

    function getKeyString(key) {
        if (key == KEY_POWER) {
            return "KEY_POWER";
        } else if (key == KEY_LIGHT) {
            return "KEY_LIGHT";
        } else if (key == KEY_ZIN) {
            return "KEY_ZIN";
        } else if (key == KEY_ZOUT) {
            return "KEY_ZOUT";
        } else if (key == KEY_ENTER) {
            return "KEY_ENTER";
        } else if (key == KEY_ESC) {
            return "KEY_ESC";
        } else if (key == KEY_FIND) {
            return "KEY_FIND";
        } else if (key == KEY_MENU) {
            return "KEY_MENU";
        } else if (key == KEY_DOWN) {
            return "KEY_DOWN";
        } else if (key == KEY_DOWN_LEFT) {
            return "KEY_DOWN_LEFT";
        } else if (key == KEY_DOWN_RIGHT) {
            return "KEY_DOWN_RIGHT";
        } else if (key == KEY_LEFT) {
            return "KEY_LEFT";
        } else if (key == KEY_RIGHT) {
            return "KEY_RIGHT";
        } else if (key == KEY_UP) {
            return "KEY_UP";
        } else if (key == KEY_UP_LEFT) {
            return "KEY_UP_LEFT";
        } else if (key == KEY_UP_RIGHT) {
            return "KEY_UP_RIGHT";
        } else if (key == KEY_PAGE) {
            return "KEY_PAGE";
        } else if (key == KEY_START) {
            return "KEY_START";
        } else if (key == KEY_LAP) {
            return "KEY_LAP";
        } else if (key == KEY_RESET) {
            return "KEY_RESET";
        } else if (key == KEY_SPORT) {
            return "KEY_SPORT";
        } else if (key == KEY_CLOCK) {
            return "KEY_CLOCK";
        } else if (key == KEY_MODE) {
            return "KEY_MODE";
        }

        return null;
    }
}
