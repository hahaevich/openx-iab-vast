/*    
 *    Copyright 2008, 2009 Flowplayer Oy
 *
 *    This file is part of FlowPlayer.
 *
 *    FlowPlayer is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    FlowPlayer is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with FlowPlayer.  If not, see <http://www.gnu.org/licenses/>.
 */

package org.flowplayer.controls {
	/**
	 * @author api
	 */
	internal class WidgetBooleanStates {
		private var _values:Object = new Object();
		private var _properties:Array = ["play", "stop", "mute", "volume", "time", "scrubber", "playlist", "fullscreen"];

		public function reset():void {
			_values = new Object();
		}
		
		protected function value(prop:String, defaultVal:Boolean = true):Boolean {
			if (_values[prop] == undefined) return defaultVal;
			return _values[prop];
		}
		
		public function get play():Boolean {
			return value("play");
		}

		public function set play(play:Boolean):void {
			_values["play"] = play;
		}

		public function get volume():Boolean {
			return value("volume");
		}

		public function set volume(volume:Boolean):void {
			_values["volume"] = volume;
		}
		
		public function get mute():Boolean {
			return value("mute");
		}

		public function set mute(mute:Boolean):void {
			_values["mute"] = mute;
		}

		public function get time():Boolean {
			return value("time");
		}

		public function set time(time:Boolean):void {
			_values["time"] = time;
		}
		
		public function get scrubber():Boolean {
			return value("scrubber");
		}

		public function set scrubber(scrubber:Boolean):void {
			_values["scrubber"] = scrubber;
		}

		public function get stop():Boolean {
			return value("stop", false);
		}

		public function set stop(stop:Boolean):void {
			_values["stop"] = stop;
		}
		
		public function get playlist():Boolean {
			return value("playlist", false);
		}

		public function set playlist(playlist:Boolean):void {
			_values["playlist"] = playlist;
		}
		
		public function get fullscreen():Boolean {
			return value("fullscreen");
		}

		public function set fullscreen(fullscreen:Boolean):void {
			_values["fullscreen"] = fullscreen;
		}
		
		public function set all(visible:Boolean):void {
			for (var i:Number = 0;i < _properties.length; i++) {
				if (_values[_properties[i]] == undefined) {
					_values[_properties[i]] = visible;
				}
			}
		}
	}
}
