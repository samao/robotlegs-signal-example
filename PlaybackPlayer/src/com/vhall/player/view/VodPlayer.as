/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.vhall.com		
 * Created:	Jun 24, 2016 3:20:40 PM
 * ===================================
 */

package com.vhall.player.view
{
	import com.vhall.framework.media.video.VideoPlayer;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import org.osflash.signals.Signal;
	
	public class VodPlayer extends Sprite
	{
		private var _updateFlashvarsSingal:Signal = new Signal();
		
		private var _resizeSingal:Signal = new Signal();
		
		private var _video:VideoPlayer;
		
		public function VodPlayer()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,onAdded);
		}
		
		public function get resizeSingal():Signal
		{
			return _resizeSingal;
		}

		public function get updateFlashvarsSingal():Signal
		{
			return _updateFlashvarsSingal;
		}

		protected function onAdded(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAdded);
			
			_updateFlashvarsSingal.dispatch(stage.loaderInfo.parameters);
			
			_video = VideoPlayer.create();
			addChild(_video);
			
			stage.addEventListener(Event.RESIZE,resizeHandler);
			
			resizeHandler();
		}
		
		protected function resizeHandler(event:Event = null):void
		{
			_resizeSingal.dispatch(stage.stageWidth,stage.stageHeight);
			_video.viewPort = new Rectangle(0,0,stage.stageWidth,stage.stageHeight);
		}
	}
}