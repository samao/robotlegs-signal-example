/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.vhall.com		
 * Created:	Jun 24, 2016 3:21:17 PM
 * ===================================
 */

package com.vhall.player.view
{
	import com.vhall.player.common.signals.FlashVarsUpdateSignal;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class VodPlayerMediator extends Mediator
	{
		[Inject]
		public var view:VodPlayer;
		
		[Inject]
		public var flashvarsUpdateSignal:FlashVarsUpdateSignal;
		
		public function VodPlayerMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			view.updateFlashvarsSingal.add(update);
			view.resizeSingal.add(resize);
		}
		
		private function resize(w:Number,h:Number):void
		{
			
		}
		
		private function update(value:Object):void
		{
			flashvarsUpdateSignal.dispatch(value);
		}
		
		override public function destroy():void
		{
			view.updateFlashvarsSingal.remove(update);
			super.destroy();
		}
	}
}