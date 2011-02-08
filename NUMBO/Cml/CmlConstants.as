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
	 *Commonly required constant values for CML
	 */	
	public class CmlConstants
	{
		public static const AddElectron:String = "+e-";
		public static const AddHdot:String = "+H.";
		public static const AddProton:String = "+H+";
		
		/**
		 * The CML dictionary namespace
		 * This is the base dictionary which nodes not contain many specific
		 * entries (ie it defines things like melting point and molecular mass) 
		 */		
		public static const CmlDictNS:String = "http://www.xml-cml.org/dictionary/cml/";
		
		/**
		 * The prefix associated with the CML dictionary.
		 */		
		public static const CmlDictPrefix:String = "cmlDict";
		
		/**
		 * The CML namespace 
		 */		
		public static const Cmlns:String = "http://www.xml-cml.org/schema";
		
		/**
		 * The CMLX dictionary namespace.
		 * Uncontrolled (semi-controlled) vocabulary for CML extensions 
		 */		
		public static const CmlxNS:String = "http://www.xml-cml.org/dictionary/cmlx/";
		
		/**
		 * The prefix associated with the CMLX 
		 */		
		public static const CmlxPrefix:String = "cmlx";
		
		/**
		 * The cmlx attribute indicating warnings 
		 */		
		public static const CmlxWarning:String = "warning";
		
		/**
		 * The tolerance to use for double comparison (1.0E-10) 
		 */		
		public static const Epsilon:Number = 1.0e-10;
		
		/**
		 * cmlx attribute local name indicating change was forced rather than suggested 
		 */		
		public static const ForcedChange:String = "forcedChange";
		
		/**
		 * The Name dictionary namespace. 
		 */		
		public static const NameDictNS:String = "http://www.xml-cml.org/dictionary/cml/name/";
		
		/**
		 * the prefix associated with the name dictionary. 
		 */		
		public static const NameDictPrefix:String = "nameDict";
		
		public static const RemoveElectron:String = "-e-";
		public static const RemoveHdot:String = "-H.";
		public static const RemoveProton:String = "-H+";
		public static const SColon:String = ":";
		
		public static const UnusualCharge:String = "unusual charge";
		public static const UnusualCoordinationNumber:String = "unusual coordinationNumber";
		public static const UnusualSpinMultiplicity:String = "unusual spinMultiplicity";
		public static const UnusualValenceElectronCount:String = "unusual valenceElectronCount";
		
		/**
		 * The xmlns prefix 
		 */		
		public static const Xmlns = "xmlns";
		
		/**
		 * The CML namespace as an XML Namespace to use in LINQ (linq?) 
		 */		
		public static var CmlxNamespace:Namespace = new Namespace(Cmlns);
		
		/**
		 * The CMLX Xnamespace for Linq (linq again, no 'selda'?)
		 */		
		public static var CmlxXNamespace = new Namespace(CmlxNS);
		
		public static string Outdated = "outdated";
		
		/**
		 * Erroring constructor to curb public constructor initialization
		 */		
		public function CmlConstants()
		{
			throw new Error("CmlConstants should not be constructed");
		}
	}
}