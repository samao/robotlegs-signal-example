/**
 * ===================================
 * Author:	iDzeir
 * Email:	qiyanlong@wozine.com
 * Company:	http://www.vhall.com
 * Created:	Jun 24, 2016 3:02:47 PM
 * ===================================
 */

package com.vhall.player 
{
	import com.vhall.framework.media.video.VideoPlayer;
	import com.vhall.player.common.commands.FlashVarsUpdateCommand;
	import com.vhall.player.common.signals.FlashVarsUpdateSignal;
	import com.vhall.player.common.commands.ResizeCommand;
	import com.vhall.player.common.signals.ResizeSignal;
	import com.vhall.player.common.models.impl.FlashVars;
	import com.vhall.player.common.models.api.IFlashVars;
	import com.vhall.player.view.VideoPlayerMediator;
	import com.vhall.player.view.VodPlayer;
	import com.vhall.player.view.VodPlayerMediator;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	public class AppConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;

		[Inject]
		public var signalMap:ISignalCommandMap;

		[Inject]
		public var mediaMap:IMediatorMap;

		public function AppConfig()
		{

		}

		public function configure():void
		{
			//singleton mapping
			injector.map(IFlashVars).toSingleton(FlashVars);

			//mediator mapping
			mediaMap.map(VodPlayer).toMediator(VodPlayerMediator);
			mediaMap.map(VideoPlayer).toMediator(VideoPlayerMediator);

			//signal mapping
			signalMap.map(FlashVarsUpdateSignal).toCommand(FlashVarsUpdateCommand);
			signalMap.map(ResizeSignal).toCommand(ResizeCommand);
		}
	}
}

