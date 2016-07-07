/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.vhall.com		
 * Created:	Jun 24, 2016 3:07:06 PM
 * ===================================
 */

package com.vhall.player.common.models.impl
{
	import robotlegs.bender.framework.api.ILogger;
	import com.vhall.player.common.models.api.IFlashVars;

	public class FlashVars implements IFlashVars
	{
		[Inject]
		public var logger:ILogger;
		
		private var _streamName:String;
		
		public function FlashVars()
		{
		}
		
		public function get streamname():String
		{
			return _streamName;
		}
		
		public function update(value:Object):void
		{
			logger.debug("flashvars:"+JSON.stringify(value));
			_streamName = value.streamname.indexOf("http:")==0?value.streamname:"http:"+value.streamname;
		}
	}
}