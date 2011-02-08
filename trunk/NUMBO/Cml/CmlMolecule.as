package NUMBO.Cml
{
	import Euclid.IHasCentroid2;
	
	import NUMBO.Cml.Helpers.Element;
	
	import flash.geom.Point;
	
	
	public class CmlMolecule extends CmlElement implements IHasCentroid2
	{
		public static const Tag = "molecule";
		// another log spot 
		
		public static const CommonElementSet:Vector.<Element> = new Vector.<Element>;
		
		public static const NextCommonElementSet:Vector.<Element> = new Vector.<Element>;
		
		private static var hasBeenInit:Boolean = false;
		
		/**
		 * Looked over the c# documentation and figured this is the best way to emulate a static constructor. 
		 * need to make sure any static functions and constructors call this init.
		 * http://msdn.microsoft.com/en-us/library/k9x6w0hc(v=vs.80).aspx
		 */		
		private static function InitCmlMolecule():void
		{
			if(!hasBeenInit)
			{
				CommonElementSet.push( Element.C );
				CommonElementSet.push( Element.N );
				CommonElementSet.push( Element.O );
				CommonElementSet.push( Element.F );
				CommonElementSet.push( Element.Cl );
				CommonElementSet.push( Element.Br );
				CommonElementSet.push( Element.I );
				
				NextCommonElementSet.push( Element.B );
				NextCommonElementSet.push( Element.Si );
				NextCommonElementSet.push( Element.P );
				NextCommonElementSet.push( Element.S );
				
				hasBeenInit = true;
			}
		}
		
		/**
		 * Emulating the multiple constructors from c# 
		 * @param element
		 * 
		 */		
		public function CmlMolecule(element:Object = null)
		{
			InitCmlMolecule();
			
			if( element == null )
			{
				super( new XML('<' + CmlConstants.CmlxNamespace + Tag + '/>') );
			}
			else if( element is XML )
			{
				super( element );
			}
			else if( element is CmlMolecule )
			{
				super( element );
			}
			
		}
		
		
		
		public function GetCentroid():Point
		{
			
			return null;
		}
		
		public function GetSubCentroids():Vector
		{
			
			return null;
		}
	}
}