package dotnet.utils
{
	public class XmlUtils
	{
		public static function getFirstAncestorOfNodeType( p_xml:XML, p_namespace:String = null, p_nodename:String = null ):XML
		{
			var result = p_xml;
			var nodeString:String = "";
			
			if(p_namespace)
			{
				default xml namespace = p_nodename;
			}
			
			while((result != null || result.parent() != undefined) && (result.parent() as XML).localName().toString() == p_nodename)
			{
				result = result.parent() as XML;
			}
			
			return (result == p_xml) ? null : result;
		}
	}
}