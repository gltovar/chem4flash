package NUMBO.Cml
{
	import Euclid.IHasCentroid2;
	
	import NUMBO.Cml.Helpers.BondOrder;
	
	import flash.geom.Point;
	
	public class CmlBond extends CmlElement implements IHasCentroid2
	{
		// enum is cyclicity class
		// enum is bondtype class
		
		public static const Aromatic:String = "A";
		public static const CmlxCyclic:String = "cyclic";
		
		/* from the schema
		<xsd:restriction base="xsd:string">
		<xsd:enumeration value="S">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Single bond.</h:div>
		<h:div class="description">synonymous with "1.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="1">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Single bond.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="D">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Double bond.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="2">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Double bond.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="T">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Triple bond.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="3">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Triple bond.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="A">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Aromatic bond.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="unknown">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Unknown bond order.</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		<xsd:enumeration value="other">
		<xsd:annotation>
		<xsd:documentation>
		<h:div class="summary">Other bond order.</h:div>
		<h:div class="description">Further information can be given using dictRef</h:div>
		</xsd:documentation>
		</xsd:annotation>
		</xsd:enumeration>
		</xsd:restriction>
		*/
		
		public static const Double:String = "D";
		public static const Hatch:String = "H";
		public static const HatchReverse:String = Hatch + Reverse;
		public static const Other:String = "other";
		
		// commented out vars in chem4word
		
		public static const Reverse:String = "-REV";
		public static const Single:String = "S";
		
		public static const StubScalefactor:Number = 1/3;
		
		public static const Tag:String = "bond";
		public static const Triple:String = "T";
		public static const Unknown:String = "unknown";
		
		public static const Wedge:String = "W";
		public static const WedgeReverse:String = Wedge + Reverse;
		// logger
		public static const DefaultLength:Number = 1.54;
		
		public function CmlBond(element:Object = null)
		{
			if(!element)
			{
				default xml namespace = CmlConstants.CmlxNamespace;
				
				super(new XML( '<' + Tag + '/>'));
			}
			else if( element is XML )
			{
				super( element );
			}
			else if(element is CmlBond)
			{
				super( (element as CmlBond).DelegateElement );
			}
		}
		
		public function get Order():String
		{
			var att:XMLList = DelegateElement['@'+CmlAttribute.Order];
			return (att.length() != 0) ? att[0].toString() : null;
		}
		public function set Order(value:String):void
		{
			DelegateElement['@'+CmlAttribute.Order] = value;
		}
		
		public function get BondOrder():BondOrder
		{
			return BondOrder.GetBondOrder(this);
		}
		
		/**
		 * get centroid of bond as mean of two atom positions 
		 * @return  null if no atoms or atoms do not both have coordinates
		 */		
		public function GetCentroid():Point
		{
			return CmlUtils.GetCentroid( GetSubCentroids() );
		}
		
		/**
		 * returns centrois of atoms 
		 * @return null if no atoms or atoms do not have centroids
		 * 
		 */		
		public function GetSubCentroids():Vector.<IHasCentroid2>
		{
			var centroidList:Vector.<IHasCentroid2> = null;
			var atoms:Vector.<CmlAtom> = GetAtoms();
			if( atoms != null && atoms.length == 2 )
			{
				centroidList = new Vector.<IHasCentroid2>;
				for each( var atom:CmlAtom in atoms )
				{
					if( atom != null )
					{
						var point:Point = atom.GetCentroid();
						if( point == null )
						{
							centroidList = null;
							break;
						}
						centroidList.push(point);
					}
				}
			}
			return centroidList;
		}
		
		/**
		 * set atomRefs2 not checking uniqueness 
		 * @param atomRefs2
		 * 
		 */		
		public function SetAtomRefs2(atomRefs2:Vector.<String>):void
		{
			DelegateElement['@'+CmlAttribute.AtomRefs2] = CmlUtils.Concatenate(atomRefs2);
		}
		
		/**
		 * get atomRefs2 not checking uniqueness 
		 * @return 
		 * 
		 */		
		public function GetAtomRefs2():Vector.<String>
		{
			var att:XMLList = DelegateElement['@'+CmlAttribute.AtomRefs2];
			
			// c# doc says a zero character String.Split() assumes whitespace as delimter, so need to make as3 do that
			return (att.length() == 0) ? null : new Vector.<String>( att[0].toString().split(/[\s]+/) );
		}

		public function SetCyclicIndicator( cyclicity:Cyclicity ):void
		{
			default xml namespace = CmlConstants.CmlxNamespace;
			var cmlxCyclic:XMLList = DelegateElement['@'+CmlxCyclic];
			if( cmlxCyclic.length() != 0 )
			{
				delete DelegateElement['@'+cmlxCyclic][0];
			}
			
		}
	
		public function GetAtoms():Vector.<CmlAtom>
		{
			var atoms:Vector.<CmlAtom> = null;
			var atomIds:Vector.<String> = GetAtomRefs2();
			if( atomIds != null && atomIds.length == 2 )
			{
				var molecule:CmlMolecule = CmlUtils.GetFirstAncestorMolecule(this);
				if( molecule == null )
				{
					throw new Error("Null molecule: " + DelegateElement);
				}
				else
				{
					atoms = new Vector.<CmlAtom>;
					for each(var atomId:String in atomIds)
					{
						var atom:CmlAtom = molecule.GetAtomById(atomId);
						if( atom == null )
						{
							atoms = null;
							break;
						}
						atoms.push( atom );
					}
				}
			}
			return atoms;
		}
	}
}