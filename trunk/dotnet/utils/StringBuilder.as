package dotnet.utils
{
	// here is a simple string building util based on what i read here: 
	// http://stackoverflow.com/questions/2815503/stringbuilder-in-flex
	
	public class StringBuilder
	{
		public var buffer:Array = new Array();
		
		public function StringBuilder()
		{
		}
		
		public function Append(str:String):void
		{
			var i:int;
			for( i = 0; i < str.length; i++ )
			{
				buffer.push( str.charCodeAt(i) );
			}
		}
		
		// this is here just in case i make a mistake since C# uses capital letter functions
		public override function toString():String
		{
			return ToString();
		}
		
		public function ToString():String
		{
			return String.fromCharCode.apply( this, buffer );
		}
	}
}