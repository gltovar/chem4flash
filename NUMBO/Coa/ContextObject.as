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

package NUMBO.Coa
{
	import dotnet.interfaces.ICloneable;

	/**
	 * 
	 * A container for CML and ChemSS (global and ChemistryZone specific)
	 * 
	 */
	public class ContextObject implements ICloneable
	{
		/**
		 * 
		 * @param cml
		 * 
		 */		
		public function ContextObject(cml:XML)
		{
			_Cml = cml;
			StubScaleFactor = 1/3;
		}
		
		/**
		 * 
		 */		
		private var _Cml:XML;
		public function get Cml():XML
		{
			return _Cml;
		}
		
		/**
		 * TODO define ChemSS 
		 */		
		
		/**
		 * TODO should come from ChemSS 
		 */		
		private var _StubScaleFactor:Number;
		public function get StubScaleFactor():Number{ return _StubScaleFactor;}
		public function set StubScaleFactor(value:Number):void
		{
			_StubScaleFactor = value;
		}
		
		// TODO: Just a stub. We need to be able to change this on a per chemzone basis
		
		private var _DisplayHydrogenIsotopeNumber:Boolean;
		public function get DisplayHydrogenIsotopeNumber():Boolean{	return _DisplayHydrogenIsotopeNumber;}
		public function set DisplayHydrogenIsotopeNumber(value:Boolean):void
		{
			_DisplayHydrogenIsotopeNumber = value;
		}

		/**
		 * Clones to ContextObject 
		 * @return a deep clone of this ContextObject
		 * 
		 */		
		public function Clone():Object
		{
			var result:ContextObject = new ContextObject( new XML( Cml.toXMLString() ) );
			result.DisplayHydrogenIsotopeNumber = this.DisplayHydrogenIsotopeNumber;
			
			return result;
		}
	}
}