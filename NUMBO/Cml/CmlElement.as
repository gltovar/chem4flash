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
	import dotnet.utils.HashCode;

	/**
	 *Superclass of all CML element classes
	 * this class delegates to an XML  
	 */
	public class CmlElement
	{
		// TODO change these to cmlx later
		private const var Deleted:String = "deleted";
		private const var True:String = "true";
		protected const var XsdDouble:String = "xsd:double";
		
		protected const var XsdInteger:String = "xsd:integer";
		
		protected const var XsdString:String = "xsd:string";
		
		// TODO need a log solution
		//private static const 
		
		public function CmlElement(element:Object) 
		{
			if(element is XML)
			{
				_DelegateElement = element as XML;
				if( CmlConstants.CmlxNamespace.toString() != _DelegateElement.namespace().toString() )
				{
					throw new Error("must be from CML namespace");
				}
				if( _DelegateElement.localName().toString() != GetTag() )
				{
					throw new Error("inconsistent local name: " + _DelegateElement.localName().toString() + " != " + GetTag() );
				}
			}
			else if(element is CmlElement)
			{
				_DelegateElement = new XML( (element as CmlElement).DelegateElement );
			}
			else
			{
				throw new Error("Object passed in needs to be XML or CmlElement");
			}
			
		}
		
		private var _DelegateElement:XML;
		public function get DelegateElement():XML
		{
			return _DelegateElement;
		}
		
		//private var _Id:String;
		public function get Id():String
		{
			var att:XMLList = DelegateElement['@'+CmlAttribute.ID];
			return ( !att.length() ) ? null : att[0].toString();
		}
		public function set Id(value:String):void
		{
			if(value == null || value == "")
			{
				throw new Error("the value of an id attribute must not be null or empty");
			}
			DelegateElement['@'+CmlAttribute.ID] = value;
		}
		
		public function GetFirstCmlChild(localName:String):CmlElement
		{
			var elems:XMLList = DelegateElement.descendants(CmlConstants.CmlxNamespace + localName);
			return elems.length() == 0 ? null : CreateElement( new XML(DelegateElement.elements( CmlConstants.CmlxNamespace + localName).child(0).toXMLString()) );
		}
		
		public function GetTag():String
		{
			throw new Error("GetTag() must be over ridden");
			return "";
		}
		
		// TODO FINISH!
		public static function CreateElement(element:XML):CmlElement
		{
			var cmlElement:CmlElement = null;
			
			var elementName:String = element.localName().toString();
			
			
			
			return cmlElement;
		}
		
		public function Equals(cmlElement:CmlElement):Boolean
		{
			return DelegateElement == cmlElement.DelegateElement;
		}
		
		public function GetHashCode():int
		{
			return HashCode.GetHashCodeInt(DelegateElement);
		}
		
		public function DeleteSimple(mark:Boolean):void
		{
			if( IsDeleted() )
			{
				// log output
				trace( "WARN: trying to delete previously deleted CMLElement " + GetTag() );
			}
			else
			{
				if( this.DelegateElement.parent() != null )
				{
					delete this.DelegateElement.parent().children()[this.DelegateElement.childIndex()];
					if( mark )
					{
						MarkAsDeleted(this.DelegateElement);
					}
				}
			}
		}
		
		public function CleanDecendantDeletedAttributes():void
		{
			CleanDeletedAttribute( this.DelegateElement );
			var descendants:XMLList = this.DelegateElement.descendants('*');
			var i:int;
			for( i = 0; i < descendants.length(); i++)
			{
				CleanDeletedAttribute( descendants[i] as XML );
			}
			
		}
		
		internal function AddCmlxAttribute(localName:String, value:String):void
		{
			default xml namespace = CmlConstants.CmlxNamespace;
			var att:XMLList = this.DelegateElement['@' + localName];
			if( att.length() != 0 )
			{
				delete this.DelegateElement['@' + localName];
			}
			this.DelegateElement['@' + localName] = value;
		}
		
		private function CleanDeletedAttribute(element:XML):void
		{
			var att:XMLList = element.['@' + Deleted];
			if( att.length() )
			{
				delete element['@' + Deleted][0];
			}
		}
		
		private function MarkAsDeleted(delegateElement:XML):void
		{
			delegateElement['@'+Deleted] = True;
		}
		
		private function IsDeleted():Boolean
		{
			var deleted:Boolean = false;
			var att:XMLList = this.DelegateElement['@'+Deleted];
			if(att.length() != 0)
			{
				deleted = att[0].toString() == True; // comparing to string not literial
			}
			return deleted;
		}
		
		public override function toString():String
		{
			return DelegateElement.toXMLString(); // c# XElements return their full xml
		}
	}
}