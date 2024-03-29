/*    
 *    Copyright 2008 Anssi Piirainen
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
	import org.flowplayer.controls.ToolTip;
	
	import flash.display.DisplayObject;	

	/**
	 * @author api
	 */
	public class NullToolTip implements ToolTip {
		public function redraw(config:Config):void {
		}
		
		public function show(p:DisplayObject, title:String, positionToMouse:Boolean = false, content:String = null):void {
		}
		
		public function hide():void {
		}
		
		public function set text(value:String):void {
		}
	}
}
