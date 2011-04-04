package NUMBO.Cml
{

	public class CmlCml extends CmlElement
	{
		public const Tag:String = 'cml';
		
		public function CmlCml(element:Object = null)
		{
			if( element == null )
			{
				default xml namespace = CmlConstants.CmlxNamespace;
				
				super( new XML('<' Tag + '/>') );
			}
			else if( element is XML )
			{
				super( element as XML );
			}
		}
		
		public function get Version():String
		{
			return (DelegateElement['@' + CmlAttribute.Version] != null)
					? DelegateElement['@' + CmlAttribute.Version]
					: null;
		}
		public function set Version(value:String):void
		{
			DelegateElement['@' + CmlAttribute.Version] = value;
		}
		
		public function get Convention():String
		{
			return DelegateElement['@' + CmlAttribute.Convention] as String;
		}
		public function set Convention(value:String):void
		{
			DelegateElement['@' + CmlAttribute.Convention ] = value;
		}
		
		public override function GetTag():String
		{
			return Tag;
		}
		
		public static function isCml(element:XML):Boolean
		{
			default xml namespace = CmlConstants.CmlxNamespace;
			return element.localName().toString() == Tag;
		}
	}
}