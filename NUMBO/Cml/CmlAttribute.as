// -----------------------------------------------------------------------
//  Copyright (c) 2011, Louis Tovar -- gltovar.com 
//
//  Based on the open source project from:
//
//  Copyright (c) 2011, The Outercurve Foundation.  
//  This software is released under the Apache License, Version 2.0. 
//  The license and further copyright text can be found in the file LICENSE.TXT at
//  the root directory of the distribution.
// -----------------------------------------------------------------------

package NUMBO.Cml
{
	/**
	 * Supports all attributes and types in dotNUMBO
	 * mainly static methods 
	 */	
	public class CmlAttribute
	{
		public static const AtomRefs:String = "atomRefs";
		public static const AtomRefs2:String = "atomRefs2";
		public static const AtomRefs4:String = "atomRefs4";
		public static const BondRefs:String = "bondRefs";
		public static const Chirality:String = "chirality";
		
		public static const Concise:String = "concise";
		public static const Convention:String = "convention";
		
		public static const Count:String = "count";
		public static const DateType:String = "dataType";
		public static const DictRef:String = "dictRef";
		public static const ElementType:String = "elementType";
		
		public static const FormalCharge:String = "formalCharge";
		
		public static const ID:String = "id";
		public static const Inline:String = "inline";
		public static const IsotopeNumber:String = "isotopeNumber";
		public static const Max:String = "max";
		public static const Min:String = "min";
		public static const Namespace:String = "namespace";
		public static const Order:String = "order";
		public static const PeakMultiplicity:String = "peakMultiplicity";
		public static const PeakShape:String = "peakShape";
		public static const Ref:String = "ref";
		
		public static const SpinMultiplicity:String = "spinMultiplicity";
		public static const Term:String = "term";
		public static const Title:String = "title";
		public static const Units:String = "units";
		
		public static const Value:String = "value";
		public static const Version:String = "version";
		public static const X2:String = "x2";
		public static const X3:String = "x3";
		public static const XMax:String = "xMax";
		public static const XMin:String = "xMin";
		public static const XUnits:String = "xUnits";
		public static const XValue:String = "xValue";
		public static const Y2:String = "y2";
		public static const Y3:String = "y3";
		public static const YUnits:String = "yUnits";
		public static const YValue:String = "yValue";
		public static const Z3:String = "y3";
		// ... not complete
		
		/**
		 * 
		 * @param delegateElement
		 * @param value
		 * 
		 */		
		public static function SetFormalCharge(delegateElement:XML, value:int = NaN):void
		{
			if( isNaN(value) )
			{
				// remove attribute
				var attribute:XMLList = delegateElement.@[FormalCharge];
				if( attribute.length() )
				{
					delete delegateElement.@[FormalCharge];
				}
			}
			else
			{
				 delegateElement.@[FormalCharge] = value.toString();
			}
		}
		
		public static function GetFormalCharge(delegateElement:XML):int
		{
			var chargeAttribute:XMLList = delegateElement.@[FormalCharge];
			var ch:int = NaN;
			if( chargeAttribute.length() )
			{
				var v:String = chargeAttribute[0].toString();
				ch = ( v == "" ) ? 0 : int(v);
			}
			
			return ch;
		}
	}
}