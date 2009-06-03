/*    
 *    Copyright (c) 2009 Bouncing Minds - Option 3 Ventures Limited
 *
 *    This file is part of the Open X VAST Plug-in for Flowplayer.
 *
 *    The Open X VAST Plug-in is free software: you can redistribute it 
 *    and/or modify it under the terms of the GNU General Public License 
 *    as published by the Free Software Foundation, either version 3 of 
 *    the License, or (at your option) any later version.
 *
 *    The Open X VAST Plug-in is distributed in the hope that it will be 
 *    useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with the plug-in.  If not, see <http://www.gnu.org/licenses/>.
 */
 package com.bouncingminds.flowplayer.streamer {
	import com.bouncingminds.util.DebugObject;
	import com.bouncingminds.util.Timestamp;
	
	/**
	 * @author Paul Schulz
	 */
	public class StreamConfig extends DebugObject {
		private var _filename:String;
		private var _duration:String = "00:00:00";
		private var _reduceLength:Boolean = false;
		private var _isLive:Boolean = false;
		
		public function StreamConfig(filename:String, duration:String, reduceLength:Boolean=false) {
			if(filename.indexOf("(live)") > -1) {
				_filename = filename.substr(filename.lastIndexOf("(live)") + 6);
				_isLive = true;
			}
			else _filename = filename;
			_duration = duration;
			_reduceLength = reduceLength;
		}

		public function set filename(filename:String):void {
			_filename = filename;
		}
		
		public function get filename():String {
			return _filename;
		}
		
		public function set duration(duration:String):void {
			_duration = duration;
		}
		
		public function get duration():String {
			return _duration;
		}
		
		public function getDurationAsInt():int {
			return Timestamp.timestampToSeconds(duration);
		}

		public function set reduceLength(reduceLength:Boolean):void {
			_reduceLength = reduceLength;
		}
		
		public function get reduceLength():Boolean {
			return _reduceLength;
		}
		
		public function isLive():Boolean {
			return _isLive;
		}
	}
}