package dotnet.utils
{
	/**
	 * Special Shout out to Diney Bomfim
	 * http://stackoverflow.com/questions/1343282/how-can-i-get-an-instances-memory-location-in-actionscript
	 * @author gltovar85
	 * 
	 * hope you chem4work guys don't use this too often.... its freaking expensive for me!!!!!!
	 * 
	 */	
	public class HashCode
	{
		
		public static function GetHashCodeString(object:Object):String
		{
			var result:String;
			
			try
			{
				FakeClass(object);
			}
			catch (e:Error)
			{
				result = String(e).replace(/.*([@|\$].*?) to .*$/gi, '$1');
			}
			
			return result;
		}
		
		/**
		 * GetHashCodeString will return a better has for xml (i think) 
		 * @param object
		 * @return 
		 * 
		 */		
		public static function GetHashCodeInt(object:Object):int
		{
			var hashString:String = GetHashCodeString( object );
			hashString = hashString.split(/[\s]+/)[0];
			hashString = hashString.substring(1); // get rid of first char
			return int("0x"+hashString);
		}		
	
	}
	
	internal final class FakeClass { }
}