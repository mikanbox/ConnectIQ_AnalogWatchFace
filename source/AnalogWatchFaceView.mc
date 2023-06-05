using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.WatchUi as WatchUi;
using Toybox.Math as Math;

class AnalogWatchFaceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Gfx.Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Gfx.Dc) as Void {
        View.onUpdate(dc);

        
        var center = [ dc.getWidth() / 2, dc.getHeight() / 2 ];
        var radius = dc.getWidth() < dc.getHeight()?  dc.getWidth() /2 : dc.getHeight()/2;

        dc.clear();
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);

        var currentTime = Sys.getClockTime();
        
        var hoursAngle = ((currentTime.hour % 12) + currentTime.min / 60.0) * (360.0 / 12.0);
        var minutesAngle = currentTime.min * (360.0 / 60.0);
        var secondsAngle = currentTime.sec * (360.0 / 60.0);

        var radiansPerDegree = Math.PI / 180.0;
        
        dc.drawLine(center[0], center[1], center[0] + (radius * 0.5) * Math.sin(hoursAngle * radiansPerDegree), center[1] - (radius * 0.5) * Math.cos(hoursAngle * radiansPerDegree));
        dc.drawLine(center[0], center[1], center[0] + (radius * 0.7) * Math.sin(minutesAngle * radiansPerDegree), center[1] - (radius * 0.7) * Math.cos(minutesAngle * radiansPerDegree));
        dc.drawLine(center[0], center[1], center[0] + (radius * 0.9) * Math.sin(secondsAngle * radiansPerDegree), center[1] - (radius * 0.9) * Math.cos(secondsAngle * radiansPerDegree));


        
    }

    function onHide() as Void {
    }

    function onExitSleep() as Void {
    }

    function onEnterSleep() as Void {
    }

}
