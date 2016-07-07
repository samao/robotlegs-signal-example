/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.vhall.com		
 * Created:	Jun 24, 2016 3:12:03 PM
 * ===================================
 */

package com.vhall.player.common.commands
{
	import com.vhall.player.common.models.api.IFlashVars;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	public class FlashVarsUpdateCommand implements ICommand
	{
		[Inject]
		public var data:Object;
		
		[Inject]
		public var flashvars:IFlashVars;
		
		public function FlashVarsUpdateCommand()
		{
		}
		
		public function execute():void
		{
			flashvars.update(data);
		}
	}
}