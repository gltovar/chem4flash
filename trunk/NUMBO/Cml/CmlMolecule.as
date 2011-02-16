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
				default xml namespace = CmlConstants.CmlxNamespace;
				
				super( new XML('<' Tag + '/>') );
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
		
		public function get Chirality():String
		{
			var chir:XMLList = DelegateElement['@'+CmlAttribute.Chirality];
			
			return ( chir.length() != 0 ) 
					? chir[0].toString()
					: null;
		}
		public function set Chirality(value:String):void
		{
			DelegateElement['@'+CmlAttribute.Chirality] = value;
		}
		
		public function get Count():Number
		{
			var countAttribute:XMLList = DelegateElement['@'+CmlAttribute.Count];
			return (countAttribute.length() == 0 || countAttribute[0] == null || countAttribute[0].toString() == "")
					?
						NaN
					:	Number( countAttribute[0].toString() );
		}
		public function set Count(value:Number):void
		{
			DelegateElement['@'+CmlAttribute.Count] = value.toString();
		}
		
		
		public function get FormalCharge():int	{ return CmlAttribute.GetFormalCharge( DelegateElement ); }
		public function set FormalCharge(value:int):void
		{
			var fc:int = CmlAttribute.GetFormalCharge(DelegateElement);
			var charge:int = ( !isNaN(fc) ) ? fc : 0;
			var delta:int;
			if( !isNaN(value) )
			{
				delta = value - charge;
				CmlAttribute.SetFormalCharge(DelegateElement, value);
			}
			else
			{
				delta = -charge;
			}
			
			var parent:CmlMolecule = Cm ;
		}
		
		
		public function GetCentroid():Point
		{
			
			return null;
		}
		
		public function GetSubCentroids():Vector
		{
			
			return null;
		}
		
		/**
		 * significantly sifferent from chem4word since AS3 doesn't have linq 
		 * @param id
		 * @return 
		 * 
		 */		
		public function GetAtomById(id:String):CmlAtom
		{
			if( id == null )
			{
				throw new ArgumentError("id -- cannot get atom with null id");
			}
			
			default xml namespace = CmlConstants.CmlxNamespace;
			var atomsList:XMLList = DelegateElement.descendants( CmlAtom.Tag );
			var atoms:Vector.<XML> = new Vector.<XML>;
			var atomItem:XML;
			var i:int;
			for( i = 0; i < atomsList.length(); i++ )
			{
				atomItem = atomsList[i] as XML;
				if( ( atomItem['@'+CmlAttribute.ID] as XMLList ).length() != 0 && ( atomItem['@'+CmlAttribute.ID] as XMLList )[0].toString() == id )
				{
					atoms.push( atomItem );
				}
			}
			
			var atom:CmlAtom = null;
			if( atoms.length == 0 )
			{/* empty set */}
			else if( atoms.length > 1 )
			{
				throw new Error("duplicate atom id");
			}
			else if( atoms.length == 1 )
			{
				atom = new CmlAtom( atoms[0] );
			}
			return atom;
		}
	}
}