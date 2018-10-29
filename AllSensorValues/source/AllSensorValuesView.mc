using Toybox.WatchUi;
using Toybox.Sensor; //will be used later (can't be used with watch face)
using Toybox.System;//for battery and memory state

class AllSensorValuesView extends WatchUi.View {

    function initialize() {
        View.initialize();
        //will be used later
        Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE,Sensor.SENSOR_TEMPERATURE]);
    	Sensor.enableSensorEvents(method(:onSensor));
    }
    
    function onSensor(sensorInfo) {
    	System.println("-----------------------------------");
    	System.println("batt [%]:" + System.getSystemStats().battery + " ("+System.getSystemStats().charging+")");
    	System.println("mem [kB]:" + System.getSystemStats().usedMemory/1024.0 + "/"+System.getSystemStats().totalMemory/1024.0);
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
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
