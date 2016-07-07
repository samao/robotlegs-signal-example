/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.vhall.com		
 * Created:	Jun 24, 2016 4:45:32 PM
 * ===================================
 */

package com.vhall.player.view
{
	import com.vhall.framework.media.provider.MediaProxyType;
	import com.vhall.framework.media.video.VideoPlayer;
	import com.vhall.player.common.models.api.IFlashVars;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class VideoPlayerMediator extends Mediator
	{
		[Inject]
		public var view:VideoPlayer;
		
		[Inject]
		public var flashvars:IFlashVars;
		
		public function VideoPlayerMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			view.connect(MediaProxyType.HLS,flashvars.streamname);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	}
}