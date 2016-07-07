/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.vhall.com		
 * Created:	Jun 24, 2016 2:56:11 PM
 * ===================================
 */

package
{
	import com.vhall.player.AppConfig;
	import com.vhall.player.view.VodPlayer;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	import robotlegs.bender.framework.impl.Context;
	
	public class PlaybackPlayer extends Sprite
	{
		private var _content:IContext;
		
		public function PlaybackPlayer()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAdded);
		}
		
		protected function onAdded(event:Event):void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_content = new Context().install(MVCSBundle,SignalCommandMapExtension)
				.configure(AppConfig)
				.configure(new ContextView(this));
			
			_content.logLevel = LogLevel.DEBUG;
			
			this.addChild(new VodPlayer());
		}
	}
}