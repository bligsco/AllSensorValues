using Toybox.WatchUi;
using Toybox.Position;
using Toybox.Sensor; //will be used later (can't be used with watch face)
using Toybox.System;//for battery and memory state
using Toybox.Time.Gregorian;

class AllSensorValuesView extends WatchUi.View {

    function initialize() {
        View.initialize();
        //will be used later
        //Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE,Sensor.SENSOR_TEMPERATURE]);
    	//Sensor.enableSensorEvents(method(:onSensor));
    	//Position.enableLocationEvents(Position.LOCATION_ONE_SHOT, method(:onPosition));
    	//Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
    	
    }
    function onPosition(info) {
    	var date = Gregorian.info(info.when, Time.FORMAT_SHORT);
    	System.println("-------------GPS-------------------");
    	System.println("accuracy : "+(info.accuracy==4?"Good":info.accuracy==3?"Usable":info.accuracy==2?"Poor":info.accuracy==1?"Last known":"Not available"));
    	System.println("altitude : "+info.altitude);
    	System.println("heading  : "+info.heading);
    	System.println("position : lat:"+info.position.toDegrees()[0]+" lng:"+info.position.toDegrees()[1]);
    	System.println("speed    : "+info.speed);
    	System.println("when     : "+date.day + "."+date.month + "."+date.year + " "+date.hour+":"+date.min+":"+date.sec);
    	System.println("-----------------------------------");
	}
    
    function onSensor(sensorInfo) {
    	System.println("-----------------------------------");
    	System.println("hr [bpm]: " + sensorInfo.heartRate);
    	System.println("tp [C]  : " + sensorInfo.temperature);
    	System.println("cad[rpm]: " + sensorInfo.cadence);
    	System.println("alt [m] : " + sensorInfo.altitude);
    	System.println("pr [hPa]: " + (sensorInfo.pressure != null ? sensorInfo.pressure/100 : "n/a"));
    	System.println("sp [m/s]: " + sensorInfo.speed + "("+sensorInfo.speed*3.6 + "[kmh])");
    	System.println("hd [deg]: " + Math.toDegrees(sensorInfo.heading));
    	//System.println("acc [g] x:"+Sensor.getInfo().accel[0]/1000.0+" y:"+Sensor.getInfo().accel[1]/1000.0+" z:"+Sensor.getInfo().accel[2]/1000.0);
    	//System.println("mag [G] x:"+Sensor.getInfo().mag[0]/1000.0+" y:"+Sensor.getInfo().mag[1]/1000.0+" z:"+Sensor.getInfo().mag[2]/1000.0);
	}

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        dc.drawText(120,120,Graphics.FONT_MEDIUM,"TEST",Graphics.TEXT_JUSTIFY_CENTER);
        
        
    	System.println("batt [%]:" + System.getSystemStats().battery + " ("+System.getSystemStats().charging+")");
    	System.println("mem [kB]:" + System.getSystemStats().usedMemory/1024.0 + "/"+System.getSystemStats().totalMemory/1024.0);
    	System.println("-----------------------------------");
    	System.println("activityTrackingOn : " + System.getDeviceSettings().activityTrackingOn);
    	System.println("alarmCount         : " + System.getDeviceSettings().alarmCount);
    	System.println("connectionAvailable: " + System.getDeviceSettings().connectionAvailable);
    	if(System.getDeviceSettings().connectionInfo.hasKey(:bluetooth)){
    		System.println("BT state: " + (System.getDeviceSettings().connectionInfo[:bluetooth].state==2?"Connected":System.getDeviceSettings().connectionInfo[:bluetooth].state==1?"Not connected":"Not initialized"));
    	}else{
    		System.println("BT state: No capability");
    	}
    	if(System.getDeviceSettings().connectionInfo.hasKey(:wifi)){
    		System.println("WIFIstat: " + (System.getDeviceSettings().connectionInfo[:wifi].state==2?"Connected":System.getDeviceSettings().connectionInfo[:wifi].state==1?"Not connected":"Not initialized"));
    	}else{
    		System.println("Wifistat: No capability");
    	}
    	System.println("doNotDisturb     : " + System.getDeviceSettings().doNotDisturb);
    	System.println("firmwareVersion  : " + Lang.format("$1$.$2$",System.getDeviceSettings().firmwareVersion));
    	System.println("inputButtons     : " + System.getDeviceSettings().inputButtons);
    	System.println("isTouchScreen    : " + System.getDeviceSettings().isTouchScreen);
    	System.println("monkeyVersion  : " + Lang.format("$1$.$2$.$3$",System.getDeviceSettings().monkeyVersion));
    	System.println("notificationCount: " + System.getDeviceSettings().notificationCount);
    	System.println("phoneConnected   : " + System.getDeviceSettings().phoneConnected);
    	System.println("screen(h,w,s): " + System.getDeviceSettings().screenHeight+"x"+System.getDeviceSettings().screenWidth+", "+(System.getDeviceSettings().screenShape==3?"Rect":System.getDeviceSettings().screenShape==2?"Semi R":"Round"));
    	System.println("tonesOn     : " + System.getDeviceSettings().tonesOn);
    	System.println("vibrateOn   : " + System.getDeviceSettings().vibrateOn);
    	
    	
    	
    	/*
    	if (Attention has :backlight) {
    		Attention.backlight(true);
		}
		*/
		
		//see: https://developer.garmin.com/downloads/connect-iq/monkey-c/doc/Toybox/Attention.html
		//if (Attention has :playTone) {
		//   Attention.playTone(TONE_LOUD_BEEP);
		//}
    	
    	var vibeData = null;
    	if (Attention has :vibrate) {
		    vibeData =
		    [
		        new Attention.VibeProfile(50, 2000), // On for two seconds
		        new Attention.VibeProfile(0, 2000),  // Off for two seconds
		        new Attention.VibeProfile(50, 2000), // On for two seconds
		        new Attention.VibeProfile(0, 2000),  // Off for two seconds
		        new Attention.VibeProfile(50, 2000)  // on for two seconds
		    ];
		}
		//Attention.vibrate(vibeData);
    	
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
