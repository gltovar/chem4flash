package NUMBO.Cml
{
	import Euclid.IHasCentroid2;
	
	import NUMBO.Cml.Helpers.Element;
	import NUMBO.Cml.Helpers.PeriodicTable;
	
	import dotnet.utils.StringBuilder;
	import dotnet.utils.XmlUtils;
	
	import flash.geom.Point;

	public class CmlUtils
	{
		// logger here
		
		
		/**
		 * iterates though list of atoms to find the first H one 
		 * @param atoms
		 * @return null is none
		 * 
		 */		
		public static function GetFirstH( atoms:Vector.<CmlAtom> ):CmlAtom
		{
			var firstAtom:CmlAtom = null;
			if( atoms != null )
			{
				for each(var atom:CmlAtom in atoms)
				{
					if( Element.H == PeriodicTable.GetElement( atom.ElementType ) )
					{
						firstAtom = atom;
						break;
					}
				}
			}
			return firstAtom;
		}
		
		/**
		 * iterates though list of atoms to find the first non-H one
		 * @param atoms
		 * @return null if none
		 * 
		 */		
		public static function GetFirstNonH(atoms:Vector.<CmlAtom>):CmlAtom
		{
			var firstAtom:CmlAtom = null;
			if( atoms != null )
			{
				for each(var atom:CmlAtom in atoms)
				{
					if( !Element.H == Element.H == PeriodicTable.GetElement( atom.ElementType ) )
					{
						firstAtom = atom;
						break;
					}
				}
			}
			return firstAtom;
		}
		
		/**
		 * checks that all atoms are H
		 * @param atoms list of atoms
		 * @return true if list is non-null and contains no H (could be zero-length)
		 */		
		public static function AreAllH( atoms:Vector.<CmlAtom> ):Boolean
		{
			var allH:Boolean = false;
			if( atoms != null )
			{
				allH = true;
				for each( var atom:CmlAtom in atoms )
				{
					if( Element.H != PeriodicTable.GetElement(atom.ElementType) )
					{
						allH = false;
						break;
					}
				}
			}
			return allH;
		}
		
		/**
		 * checks that no atoms are H 
		 * @param atoms list of atoms
		 * @return true if list is non-null and contains no H(could be zero-length)
		 * 
		 */
		public static function ContainNoH( atoms:Vector.<CmlAtom> ):Boolean
		{
			var noH:Boolean = false;
			if( atoms != null )
			{
				noH = true;
				for each( var atom:CmlAtom in atoms )
				{
					if( Element.H == PeriodicTable.GetElement( atom.ElementType ) )
					{
						noH = false;
						break;
					}
				}
			}
			return noH;
		}
		
		/**
		 * gets number of H atoms 
		 * @param atoms array of atoms
		 * @return  0 if null array; else count
		 */		
		public static function GetHCount(atoms:Vector.<CmlAtom>)
		{
			var count:int = 0;
			if( atoms != null )
			{
				for each( var atom:CmlAtom in atoms )
				{
					if( Element.H == PeriodicTable.GetElement( atom.ElementType ) )
					{
						count++;
					}
				}
			}
			return count;
		}
		
		/**
		 * gets number of non-H atoms 
		 * @param atoms array of atoms
		 * @return  0 if null array; else count
		 */		
		public static function GetNonHCount(atoms:Vector.<CmlAtom>)
		{
			var count:int = 0;
			if( atoms != null )
			{
				for each( var atom:CmlAtom in atoms )
				{
					if( Element.H != PeriodicTable.GetElement(atom.ElementType) )
					{
						count++;
					}
				}
			}
			
			return count;
		}
		
		/**
		 * concatinates values in an array with single whitespace
		 * leaves result trimmed. 
		 * @param strings
		 * @return concatenated string
		 * 
		 */		
		public static function Concatenate(strings:Vector.<String>):String
		{
			if( strings == null )
			{
				throw new Error( "strings cannot be null" );
			}
			var builder:StringBuilder = new StringBuilder();
			for( var i:int = 0; i < strings.length; i++ )
			{
				if( i > 0 )
				{
					builder.Append(" ");
				}
				builder.Append(strings[i]);
			}
			
			return builder.ToString();
		}
		
		/**
		 * Gets the first CMLMolecule at or below the container passed in or null if no CMLMolecules are found. 
		 * @param container The XDocument of XElement to search in/below for a CMLMolecule
		 * @return  The first CMLMolecule below or at the XContainer or null
		 * @exception if contianer is null
		 */		
		public static function GetFirstDecendentMolecule( container:XML ):CmlMolecule
		{
			if( container == null )
			{
				throw new ArgumentError("container cannot be null");
			}
			var element:XML;
			element = container;  // its all xml in flash this is just for show
			
			var moleculeXElement:XML = null;
			
			default xml namespace = CmlConstants.CmlxNamespace;
			
			if( element.localName().toString() == (CmlMolecule.Tag) )
			{
				moleculeXElement = element;
			}
			else if( element.descendants(CmlMolecule.Tag).length() )
			{
				moleculeXElement = element.descendants(CmlMolecule.Tag)[0]; 
			}
			
			//var moleculeXElement:XMLList = element.descendants(CmlConstants.CmlxNamespace + CmlMolecule.Tag);
			return (moleculeXElement == null) ? null : new CmlMolecule(moleculeXElement);
		}
		
		/**
		 * Get the first ancestor molecule of this element of null if it does not exist 
		 * @param xElement the object to get the ancestor molecule of
		 * @return the first ancestor molecule or null if xElement == null or does not exist
		 * @exception if xElement is null
		 */		
		public static function GetFirstAncestorMolecule(xElement:XML):CmlMolecule
		{
			var molecule:CmlMolecule = null;
			
			//default xml namespace = CmlConstants.Cmlns; TODO: not sure why i need to use the uri here!
			
			var moleculeXElement:XML = XmlUtils.getFirstAncestorOfNodeType(xElement, CmlConstants.CmlxNamespace, CmlMolecule.Tag);
			
			if( moleculeXElement != null )
			{
				molecule = new CmlMolecule(moleculeXElement);
			}
			else
			{
				// log no ancestor
			}
			return molecule;
		}
		
		/**
		 * Get the first ancestor molecule of this element of null if it does not exist 
		 * @param cmlElement the object to get the ancestor molecule of
		 * @return first ancestor molecule or null if cmlElement == null or ancestor does not exist
		 */		
		public static function GetFirstAncestorMolecule(cmlElement:CmlElement):CmlMolecule
		{
			var molecule = null;
			if( cmlElement != null )
			{
				molecule = GetFirstAncestorMolecule(cmlElement.DelegateElement);
			}
			return molecule;
		}
		
		/**
		 * Removes trailing zeros from a 'double' containing decimal point // not really a big deal in flash
		 * and will remove decimal point if all characters following it are noughts
		 * @param d the double to truncate // =p
		 * @return string without trailing zeros
		 * 
		 */		
		public static function TruncateTrailingZeros(d:Number):String
		{
			var s:String = d.toString();
			while (s.charAt(s.length-1) == "0" && s.search(".") != -1)
			{
				s = s.substring(0, s.length-1);
			}
			if( s.charAt(s.length-1) == '.' )
			{
				s = s.substring(0, s.length-1);
			}
			
			return s;
		}
		
		public static function Add(cmlElement:CmlElement, child:CmlElement):void
		{
			if( child is CmlAtom )
			{
				throw new ArgumentError("cannot use add(atom); use molecule.AddAtom(atom)");
			}
			if( child is CmlBond )
			{
				throw new ArgumentError("cannot use add(bond); use molecule.AddBond(bond)");
			}
			
			
		}
		
		public static function Remove(cmlElement:CmlElement):void
		{
			if( cmlElement == null )
			{
				throw new ArgumentError("cmlElement cannot be null");
			}
			if( cmlElement.DelegateElement.parent() != null )
			{
				delete cmlElement.DelegateElement.parent().children()[cmlElement.DelegateElement.childIndex()];
			}
		}
		
		public static function GetCentroid(subCentroids:Vector.<IHasCentroid2>):Point
		{
			var centroid:Point = null;
			if( subCentroids != null && subCentroids.length > 0 )
			{
				centroid = new Point();
				var i:int;
				for( i = 0; i < subCentroids.length; i++)
				{
					var subCentroid:IHasCentroid2 = subCentroids[i];
					if( subCentroid == null )
					{
						centroid = null;
						break;
					}
					
					var point:Point = subCentroid.GetCentroid();
					if( point == null )
					{
						centroid = null;
						break;
					}
					centroid = centroid.add(point);
				}
			}
			if( centroid != null )
			{
				centroid.x *= 1/subCentroids.length;
				centroid.y *= 1/subCentroids.length;
			}
			
			return centroid;
		}
		
		public function CmlUtils()
		{
			
		}
	}
}