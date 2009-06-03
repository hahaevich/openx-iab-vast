/*
 * This file is part of Flowplayer, http://flowplayer.org
 *
 * By: Anssi Piirainen, <support@flowplayer.org>
 *Copyright (c) 2008, 2009 Flowplayer Oy
 *
 * Released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */

package org.flowplayer.controls {
    import flash.display.DisplayObject;
    import org.flowplayer.controls.button.SkinClasses;
import org.flowplayer.util.Arrange;
	import org.flowplayer.view.AbstractSprite;
	import org.flowplayer.view.Flowplayer;
	
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;	

	/**
	 * @author api
	 */
	public class TimeView extends AbstractSprite {
		public static const EVENT_REARRANGE:String = "onRearrange";
		private var _config:Config;


        private var _top:DisplayObject;
        private var _bottom:DisplayObject;
        private var _left:DisplayObject;
        private var _right:DisplayObject;
        private var _timeText:TextField;
        private var _durationText:TextField;

        private var _prevTextLength:Number = "00:00".length;
        private var _player:Flowplayer;

        public function TimeView(config:Config, player:Flowplayer) {
            _config = config;
            _player = player;
            createTimeText();
            createDurationText();
            _left = addChild(SkinClasses.getTimeLeft());
            _right = addChild(SkinClasses.getTimeRight());
            _top = addChild(SkinClasses.getTimeTop());
            _bottom = addChild(SkinClasses.getTimeBottom());

            duration = 0;
            time = 0;
        }


        private function get borderRadius():Number {
            return _config.style.timeBorderRadius >= 0 ? _config.style.timeBorderRadius : Math.floor(height / 2);
        }

        override public function get name():String {
            return "time";
        }
		
		public function redraw(_config:Config):void {
            _config = _config;
			_timeText.textColor = _config.style.timeColor;
			if (_durationText) {
				_durationText.textColor = _config.style.durationColor;
			}
            drawBackground();
		}
		
		public function set time(value:Number):void {
			_timeText.text = TimeUtil.formatSeconds(value);
			if (_durationText) {
				_timeText.appendText("/");
			}
			onResize();
			
			var textLength:Number = _timeText.text.length + (_durationText ? _durationText.text.length : 0);
			if (textLength != _prevTextLength)
				dispatchEvent(new Event(EVENT_REARRANGE));
			_prevTextLength = textLength;
		}
		
		public function set duration(value:Number):void {
			if (value == -1 && _durationText) {
				removeChild(_durationText);
				_durationText = null;
				onResize();
				dispatchEvent(new Event(EVENT_REARRANGE));
				return;
			} else if (value > 0 && ! _durationText) {
				createDurationText();
				onResize();
				dispatchEvent(new Event(EVENT_REARRANGE));
			}
			if (_durationText) {
				var text:String = TimeUtil.formatSeconds(value);
				if (text == _durationText.text)
					return;
				resizeFont(text.length);
				_durationText.text = text;
			}
		}
		
		private function resizeFont(durationLength:int):void {
			var fontSize:Number = durationLength > "00:00".length ? 9 : 11;
			
			initField(_durationText, _config.style.durationColor, fontSize);
			initField(_timeText, _config.style.timeColor, fontSize);
			onResize();
		}

		override protected function onResize():void {
            _left.y = _top.height;
            _left.height = height - _top.height - _bottom.height;

            _timeText.x = _left.width + Math.max(borderRadius, 2);

            Arrange.center(_timeText, 0, height);
            if (_durationText) {
                _durationText.x = _timeText.x + _timeText.textWidth + 2;
                Arrange.center(_durationText, 0, height);
            }
            drawBackground();

            _top.x = 0;
            _top.width = width;

            _right.x = width - _right.width;
            _right.y = _top.height;
            _right.height = height - _top.height - _bottom.height;

            _bottom.x = 0;
            _bottom.width = width;
            _bottom.y = height - _bottom.height;
        }

        private function drawBackground():void {
            graphics.clear();
            graphics.lineStyle(1, 0, .3);
            graphics.beginFill(_config.style.timeBgColor, 1);
            var bgWidth:Number = (_durationText ? (_durationText.x + _durationText.textWidth) : (_timeText.x + _timeText.textWidth)) + borderRadius;
            var bgHeight:Number = height * _config.style.timeBgHeightRatio
//            log.debug("_left.width " + _left.width);
//            log.debug("height/2 " + height/2);
//            log.debug("bgheight " + bgHeight);

            graphics.drawRoundRect(_left.width, height/2 - bgHeight/2, bgWidth, bgHeight, borderRadius, borderRadius);
            graphics.endFill();

            // reset the manged width value
            _width = bgWidth + _left.width + _right.width;
        }

		private function createDurationText():void {
			_durationText = _player.createTextField();
			initField(_durationText, _config.style.durationColor);
			addChild(_durationText);
		}
		private function createTimeText():void {
			_timeText = _player.createTextField();
			initField(_timeText, _config.style.timeColor);
			addChild(_timeText);
		}

		private function initField(field:TextField, color:Number, size:Number = 13):void {
			if (! field) return;
			field.textColor = color;
			field.selectable = false;
			field.autoSize = TextFieldAutoSize.LEFT;
			var format:TextFormat = field.defaultTextFormat;
			format.size = size;
			field.defaultTextFormat = format;
		}
	}
}
