package NUMBO.Cml.Helpers
{
	import NUMBO.Cml.CmlAttribute;
	import NUMBO.Cml.CmlBond;

	public class BondOrder
	{
		public static const Aromatic:BondOrder = new BondOrder(CmlBond.Aromatic, 1.5);
		public static const Double:BondOrder = new BondOrder(CmlBond.Double, 2.0);
		public static const Other:BondOrder = new BondOrder(CmlBond.Other, 0.0);
		public static const Single:BondOrder = new BondOrder(CmlBond.Single, 1.0);
		public static const Triple:BondOrder = new BondOrder(CmlBond.Triple, 3.0);
		public static const Unknown:BondOrder = new BondOrder(CmlBond.Unknown, 0.0);
		private var cmlBondOrder:String;
		private var order:OrderEnum;  // hate you chem4word... the enum was at the bottom... was looking everywhere for what the c# class for Order was =P
		private var numericBondOrder:Number = NaN;
		
		/**
		 * create BondOrder
		 * if value is Unknown, order = OrderEnum.Unknown; 
		 * @param value
		 * @param p_numericBondOrder
		 * 
		 */		
		public function BondOrder(value:String, p_numericBondOrder:Number)
		{
			numericBondOrder = p_numericBondOrder; // c'mon chem4word ^_^
			cmlBondOrder = value;
			order = OrderEnum.Unknown;
			if( p_numericBondOrder == 1 )
			{
				order = OrderEnum.S;
			}
			if( p_numericBondOrder == 2 )
			{
				order = OrderEnum.D;
			}
			if( p_numericBondOrder == 3 )
			{
				order = OrderEnum.T;
			}
			if( p_numericBondOrder == 1.5 )
			{
				order = OrderEnum.A;
			}
			
		}
		
		public function get IntegerBondOrder():int
		{
			var o:int = NaN;
			if( !isNaN(numericBondOrder))
			{
				o = int(numericBondOrder);
				if( Math.abs( numericBondOrder - o) > 0.01 )
				{
					o = NaN;
				}
			}
			return o;
		}
		
		public function get NumericBondOrder():Number
		{
			return numericBondOrder;
		}
		
		public function get CmlBondOrder():String
		{
			return cmlBondOrder;
		}
		
		/**
		 * return order in bond 
		 * @param bond (either cmlbond or int)
		 * @return Single, Double, Triple, Aromatic, Unknown or null
		 * 
		 */		
		public static function GetBondOrder(bond:Object):BondOrder
		{
			var result:BondOrder = null;
			
			if( bond is CmlBond )
			{
				var att:XMLList = bond.DelegateElement.@[CmlAttribute.Order];
				var value:String = (att.length() == 0) ? null : att[0].toString();
				result = (value == null) ? Unknown : GetBondOrderFromCmlOrder(value);
			}
			else if( bond is int )
			{
				switch (bond)
				{
					case 1:
						result = Single;
						break;
					case 2:
						result = Double;
						break;
					case 3:
						result = Triple;
						break;
				}
			}
			else
			{
				throw new ArgumentError("bond must be CmlBond or int type");
			}
			
			return result;
		}
		
		/**
		 * get BondOrder for string value
		 * if value = CMLBond.Single, Double, Triple, Aromatic returns BondOrder else Unknown 
		 * normalizes deprecated values (1,2,3)
		 * @param value 
		 * @return 
		 * 
		 */		
		public static function GetBondOrderFromCmlOrder(value:String):BondOrder
		{
			var bondOrder:BondOrder = Unknown;
			if( value == null )
			{ /*empty set*/ }
			else if( value == CmlBond.Single || value == "1" ) // guessing this is the equive to value.Equals(1)
			{
				bondOrder = Single;
			}
			else if( value == CmlBond.Double || value == "2" )
			{
				bondOrder = Double;
			}
			else if( value == CmlBond.Triple || value == "3" )
			{
				bondOrder = Triple;
			}
			else if( value == CmlBond.Aromatic )
			{
				bondOrder = Aromatic;
			}
			else if( value == CmlBond.Unknown )
			{
				bondOrder = Unknown;
			}
			else if( value == CmlBond.Other )
			{
				bondOrder = Other;
			}
			
			return bondOrder;
		}
		
		public override function toString():String
		{
			
			return   String("cml: " + cmlBondOrder + " Order: " + order + " numeric: " + numericBondOrder );
		}
	}
}