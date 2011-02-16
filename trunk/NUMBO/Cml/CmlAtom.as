package NUMBO.Cml
{
	import Euclid.IHasCentroid2;
	
	import dotnet.interfaces.IEquatable;
	
	import flash.geom.Point;
	
	public class CmlAtom extends CmlElement implements IHasCentroid2, IEquatable
	{
		public static const CmlxGroup:String = CmlConstants.CmlxPrefix + ":" + Group;
		public static const CmlxGroupPointer:String = CmlConstants.CmlxPrefix + ":" + GroupPointer;
		public static const Group:String = "group";
		public static const GroupPointer:String = Group + "Pointer";
		public static const IDPrefix:String = "a";
		public static const Tag:String = "atom";
		// log here
		
		public function CmlAtom(element:Object = null)
		{
			if(!element)
			{
				default xml namespace = CmlConstants.CmlxNamespace;
				super( '<' + Tag + '/>';
			}
			else if(element is XML)
			{
				super( element );
			}
		}
		
		/**
		 *Sets ElementType 
		 * @return 
		 * 
		 */		
		public function get ElementType():String
		{
			var att:XMLList = DelegateElement['@'+CmlAttribute.ElementType];
			return (att.length() == 0) ? null : att[0].toString();
		}
		public function set ElementType(value:String):void
		{
			DelegateElement['@'+CmlAttribute.ElementType] = value;
		}
		
		/**
		 * count 
		 * @return 
		 * 
		 */		
		public function get Count():Number
		{
			var countAttribute:XMLList = DelegateElement['@'+CmlAttribute.Count];
			return (countAttribute.length() == 0 || countAttribute[0].toString() == null || 
						countAttribute[0].toString() != "")
							?
								NaN
							:	Number(countAttribute[0].toString()) ;
		}
		public function set Count(value:Number):void
		{
			DelegateElement['@'+CmlAttribute.Count] = value.toString();
		}
		
		/**
		 *formal charge 
		 * @return 
		 * 
		 */		
		public function get FormalCharge():int
		{
			return CmlAttribute.GetFormalCharge(DelegateElement);
		}
		public function set FormalCharge(value:int):void
		{
			var fc:int = CmlAttribute.GetFormalCharge(DelegateElement);
			var charge:int = (!isNaN(fc)) ? fc : 0;
			var delta:int;
			if( !isNaN(value) )
			{
				delta = value - charge;
				CmlAttribute.SetFormalCharge( DelegateElement, value );
			}
			else
			{
				delta = -charge;
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
		
		public function Equals(other:Object):Boolean
		{
			return false;
		}
	}
}