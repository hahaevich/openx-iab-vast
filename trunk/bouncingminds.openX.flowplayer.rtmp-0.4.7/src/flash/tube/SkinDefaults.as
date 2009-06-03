package {
    import flash.display.DisplayObject;

    public class SkinDefaults {

        public static function get values():Object {
            return {
                bottom: 0, left: 0, height: 30, width: "100%", zIndex: 2,
                backgroundColor: "#929292",
                backgroundGradient: "high",
                border: "0px", borderRadius: "0px",
                timeColor: "#B1E0FC",
                durationColor: "#ffffff",

                // scrubber slider background color
                sliderColor: "#C9C9C9",
                // gradient used in the scrubber slider background
                sliderGradient: "none",

                // volume slider background color
                volumeSliderColor: '#D00000',

                // volume slider background gradient
                volumeSliderGradient: "none",

                buttonColor: "#000000",
                buttonOverColor: "#FF0000",
                progressColor: "#D00000",
                progressGradient: "none",
                bufferColor: "#C78F8E",
                bufferGradient: "none",
                tooltipColor: "#C9C9C9",
                tooltipTextColor: "#D00000",
                // border radius of the time display. 0 means square corners, larger values mean more rounded corners.
                timeBorderRadius: 0,
                timeBgColor: '#262626',

                // border radius of the scrubber bar
                scrubberBorderRadius: 0,

                // border radius of the voluma bar
                volumeBorderRadius: 0,

                // how much the scrubber handle should take of the controlbar total height
                scrubberHeightRatio: 0.7,
                // how much the scrubber horizontal bar should take of the scrubber total height
                scrubberBarHeightRatio: 0.4,

                // how much the volume slider handle should take of the controlbar total height
                volumeSliderHeightRatio: 0.4,
                // how much the horizontal volume bar should take of the volume slider total height
                volumeBarHeightRatio: 1.1,

                // how much the time view colored box is of the total controlbar height
                timeBgHeightRatio: 0.6

            }
        }

        public static function getSpaceAfterWidget(widget:DisplayObject, widgetIsOnRightEdge:Boolean):Number {
            if (widget.name == "time") return 0;
//            if (widget.name == "mute") return 4;
//            if (widget.name == "volume") return 4;
            if (widget.name == "scrubber") return 0;
            // we don't have any margins after any of the widgets
            return widgetIsOnRightEdge ? 0 : 1;
        }

        public static function get margins():Array {
            return [0, 0, 0, 0];
        }
    }
}