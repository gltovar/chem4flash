package NUMBO.Cml.Helpers
{
	import NUMBO.Cml.Helpers.Element;
	
	import flash.text.engine.EastAsianJustifier;
	import flash.utils.Dictionary;
	
	import flashx.textLayout.elements.InlineGraphicElement;

	public class PeriodicTable
	{
		/**
		 * Dictionary of elements, indexed by atomicSymbol 
		 */		
		public static var PTable:Dictionary;
		
		/**
		 * finds static element from element class
		 * @param elementType
		 * @return 
		 */		
		public static function GetElement(elementType:String):Element
		{
			return Element[elementType] as Element;
		}
		
		/**
		 * Converts the string representation of a Chemical Element to its Element equivalent.
		 * A return value indicates whether the conversion succeeded or failed. 
		 * @param s  A string containing a Chemical Element to convert.
		 * @param element  When this method returns, element contianes a Element equivalent to the symbol contained in s
		 * if the conversion succeeded, or Element.Null if the conversion failed. The conversion fails if the s peramater is null 
		 * @return true if s was converted successfully; otherwise false.
		 */		
		public static function TryParseElement(s:String, element:Element):Boolean
		{
			var ok:Boolean = false;
			
			if( Element[s] )
			{
				element = Element[s];
				ok = true;
			}
			else
			{
				element = Element.Null;
			}
			
			return ok;
		}
		
		public static function GetPeriodicTableIndexedByElement():Dictionary
		{
			if(PTable == null)
			{
				PTable = new Dictionary(false);
				
				PTable[Element.R] = new ChemicalElement("R", 0, 0.0);
				PTable[Element.Du] = new ChemicalElement("Du", 0, 0.0);
				PTable[Element.H] = new ChemicalElement("H", 1, 1.00794);
				PTable[Element.He] = new ChemicalElement("He", 2, 4.002602);
				PTable[Element.Li] = new ChemicalElement("Li", 3, 6.941);
				PTable[Element.Be] = new ChemicalElement("Be", 4, 9.012182);
				PTable[Element.B] = new ChemicalElement("B", 5, 10.811);
				PTable[Element.C] = new ChemicalElement("C", 6, 12.0107);
				PTable[Element.N] = new ChemicalElement("N", 7, 14.0067);
				PTable[Element.O] = new ChemicalElement("O", 8, 15.9994);
				PTable[Element.F] = new ChemicalElement("F", 9, 18.9984032);
				PTable[Element.Ne] = new ChemicalElement("Ne", 10, 20.1797);
				PTable[Element.Na] = new ChemicalElement("Na", 11, 22.98977);
				PTable[Element.Mg] = new ChemicalElement("Mg", 12, 24.305);
				PTable[Element.Al] = new ChemicalElement("Al", 13, 26.981538);
				PTable[Element.Si] = new ChemicalElement("Si", 14, 28.0855);
				PTable[Element.P] = new ChemicalElement("P", 15, 30.973761);
				PTable[Element.S] = new ChemicalElement("S", 16, 32.065);
				PTable[Element.Cl] = new ChemicalElement("Cl", 17, 35.453);
				PTable[Element.Ar] = new ChemicalElement("Ar", 18, 39.948);
				PTable[Element.K] = new ChemicalElement("K", 19, 39.0983);
				PTable[Element.Ca] = new ChemicalElement("Ca", 20, 40.078);
				PTable[Element.Sc] = new ChemicalElement("Sc", 21, 44.95591);
				PTable[Element.Ti] = new ChemicalElement("Ti", 22, 47.867);
				PTable[Element.V] = new ChemicalElement("V", 23, 50.9415);
				PTable[Element.Cr] = new ChemicalElement("Cr", 24, 51.9961);
				PTable[Element.Mn] = new ChemicalElement("Mn", 25, 54.938049);
				PTable[Element.Fe] = new ChemicalElement("Fe", 26, 55.845);
				PTable[Element.Co] = new ChemicalElement("Co", 27, 58.9332);
				PTable[Element.Ni] = new ChemicalElement("Ni", 28, 58.6934);
				PTable[Element.Cu] = new ChemicalElement("Cu", 29, 63.546);
				PTable[Element.Zn] = new ChemicalElement("Zn", 30, 65.409);
				PTable[Element.Ga] = new ChemicalElement("Ga", 31, 69.723);
				PTable[Element.Ge] = new ChemicalElement("Ge", 32, 72.64);
				PTable[Element.As] = new ChemicalElement("As", 33, 74.9216);
				PTable[Element.Se] = new ChemicalElement("Se", 34, 78.96);
				PTable[Element.Br] = new ChemicalElement("Br", 35, 79.904);
				PTable[Element.Kr] = new ChemicalElement("Kr", 36, 83.798);
				PTable[Element.Rb] = new ChemicalElement("Rb", 37, 85.4678);
				PTable[Element.Sr] = new ChemicalElement("Sr", 38, 87.62);
				PTable[Element.Y] = new ChemicalElement("Y", 39, 88.90585);
				PTable[Element.Zr] = new ChemicalElement("Zr", 40, 91.224);
				PTable[Element.Nb] = new ChemicalElement("Nb", 41, 92.90638);
				PTable[Element.Mo] = new ChemicalElement("Mo", 42, 95.94);
				PTable[Element.Tc] = new ChemicalElement("Tc", 43, 98.0);
				PTable[Element.Ru] = new ChemicalElement("Ru", 44, 101.07);
				PTable[Element.Rh] = new ChemicalElement("Rh", 45, 102.9055);
				PTable[Element.Pd] = new ChemicalElement("Pd", 46, 106.42);
				PTable[Element.Ag] = new ChemicalElement("Ag", 47, 107.8682);
				PTable[Element.Cd] = new ChemicalElement("Cd", 48, 112.411);
				PTable[Element.In] = new ChemicalElement("In", 49, 114.818);
				PTable[Element.Sn] = new ChemicalElement("Sn", 50, 118.71);
				PTable[Element.Sb] = new ChemicalElement("Sb", 51, 121.76);
				PTable[Element.Te] = new ChemicalElement("Te", 52, 127.6);
				PTable[Element.I] = new ChemicalElement("I", 53, 126.90447);
				PTable[Element.Xe] = new ChemicalElement("Xe", 54, 131.293);
				PTable[Element.Cs] = new ChemicalElement("Cs", 55, 132.90545);
				PTable[Element.Ba] = new ChemicalElement("Ba", 56, 137.327);
				PTable[Element.La] = new ChemicalElement("La", 57, 138.9055);
				PTable[Element.Ce] = new ChemicalElement("Ce", 58, 140.116);
				PTable[Element.Pr] = new ChemicalElement("Pr", 59, 140.90765);
				PTable[Element.Nd] = new ChemicalElement("Nd", 60, 144.24);
				PTable[Element.Pm] = new ChemicalElement("Pm", 61, 145.0);
				PTable[Element.Sm] = new ChemicalElement("Sm", 62, 150.36);
				PTable[Element.Eu] = new ChemicalElement("Eu", 63, 151.964);
				PTable[Element.Gd] = new ChemicalElement("Gd", 64, 157.25);
				PTable[Element.Tb] = new ChemicalElement("Tb", 65, 158.92534);
				PTable[Element.Dy] = new ChemicalElement("Dy", 66, 162.5);
				PTable[Element.Ho] = new ChemicalElement("Ho", 67, 164.93032);
				PTable[Element.Er] = new ChemicalElement("Er", 68, 167.259);
				PTable[Element.Tm] = new ChemicalElement("Tm", 69, 168.93421);
				PTable[Element.Yb] = new ChemicalElement("Yb", 70, 173.04);
				PTable[Element.Lu] = new ChemicalElement("Lu", 71, 174.967);
				PTable[Element.Hf] = new ChemicalElement("Hf", 72, 178.49);
				PTable[Element.Ta] = new ChemicalElement("Ta", 73, 180.9479);
				PTable[Element.W] = new ChemicalElement("W", 74, 183.84);
				PTable[Element.Re] = new ChemicalElement("Re", 75, 186.207);
				PTable[Element.Os] = new ChemicalElement("Os", 76, 190.23);
				PTable[Element.Ir] = new ChemicalElement("Ir", 77, 192.217);
				PTable[Element.Pt] = new ChemicalElement("Pt", 78, 195.078);
				PTable[Element.Au] = new ChemicalElement("Au", 79, 196.96655);
				PTable[Element.Hg] = new ChemicalElement("Hg", 80, 200.59);
				PTable[Element.Tl] = new ChemicalElement("Tl", 81, 204.3833);
				PTable[Element.Pb] = new ChemicalElement("Pb", 82, 207.2);
				PTable[Element.Bi] = new ChemicalElement("Bi", 83, 208.98038);
				PTable[Element.Po] = new ChemicalElement("Po", 84, 209.0);
				PTable[Element.At] = new ChemicalElement("At", 85, 210.0);
				PTable[Element.Rn] = new ChemicalElement("Rn", 86, 222.0);
				PTable[Element.Fr] = new ChemicalElement("Fr", 87, 223.0);
				PTable[Element.Ra] = new ChemicalElement("Ra", 88, 226.0);
				PTable[Element.Ac] = new ChemicalElement("Ac", 89, 227.0);
				PTable[Element.Th] = new ChemicalElement("Th", 90, 232.0381);
				PTable[Element.Pa] = new ChemicalElement("Pa", 91, 231.03588);
				PTable[Element.U] = new ChemicalElement("U", 92, 238.02891);
				PTable[Element.Np] = new ChemicalElement("Np", 93, 237.0);
				PTable[Element.Pu] = new ChemicalElement("Pu", 94, 244.0);
				PTable[Element.Am] = new ChemicalElement("Am", 95, 243.0);
				PTable[Element.Cm] = new ChemicalElement("Cm", 96, 247.0);
				PTable[Element.Bk] = new ChemicalElement("Bk", 97, 247.0);
				PTable[Element.Cf] = new ChemicalElement("Cf", 98, 251.0);
				PTable[Element.Es] = new ChemicalElement("Es", 99, 252.0);
				PTable[Element.Fm] = new ChemicalElement("Fm", 100, 257.0);
				PTable[Element.Md] = new ChemicalElement("Md", 101, 258.0);
				PTable[Element.No] = new ChemicalElement("No", 102, 259.0);
				PTable[Element.Lr] = new ChemicalElement("Lr", 103, 262.0);
				PTable[Element.Rf] = new ChemicalElement("Rf", 104, 261.0);
				PTable[Element.Db] = new ChemicalElement("Db", 105, 262.0);
				PTable[Element.Sg] = new ChemicalElement("Sg", 106, 266.0);
				PTable[Element.Bh] = new ChemicalElement("Bh", 107, 264.0);
				PTable[Element.Hs] = new ChemicalElement("Hs", 108, 269.0);
				PTable[Element.Mt] = new ChemicalElement("Mt", 109, 268.0);
				PTable[Element.Ds] = new ChemicalElement("Ds", 110, 271.0);
				PTable[Element.Rg] = new ChemicalElement("Rg", 111, 272.0);
				PTable[Element.Uub] = new ChemicalElement("Uub", 112, 285.0);
				PTable[Element.Uut] = new ChemicalElement("Uut", 113, 284.0);
				PTable[Element.Uuq] = new ChemicalElement("Uuq", 114, 289.0);
				PTable[Element.Uup] = new ChemicalElement("Uup", 115, 288.0);
				PTable[Element.Uuh] = new ChemicalElement("Uuh", 116, 292.0);
				PTable[Element.Uus] = new ChemicalElement("Uus", 117, 294.0);
				
				AddIsotopes();
			}
			
			return PTable;
		}
		
		private static function AddIsotopes(el:Element = null, masses:Vector.<int> = null):void
		{
			if( !el && !masses )
			{
				AddIsotopes(Element.H, new <int>[1, 2, 3]);
				AddIsotopes(Element.He, new <int>[3, 4]);
				
				AddIsotopes(Element.B, new <int>[9, 11]);
				AddIsotopes(Element.C, new <int>[11, 12, 13, 14]);
				AddIsotopes(Element.N, new <int>[14, 15]);
				AddIsotopes(Element.O, new <int>[16, 17, 18]);
				AddIsotopes(Element.F, new <int>[19]);
				
				AddIsotopes(Element.Cl, new <int>[35, 37]);
			}
			else
			{
				var chemicalElement:ChemicalElement;
				chemicalElement = PTable[el] as ChemicalElement;
				if(chemicalElement)
				{
					chemicalElement.IsotopeMasses = masses;
				}
			}
		}
		
		/**
		 * GET Group
		 * 
		 * Not all elements are done yet (lacking lanthanides and actinides and 104+ ) 
		 * @param element
		 * @return -1 if not in list
		 * 
		 */		
		public static function GetGroup(element:Element):int
		{
			var group:int = -1;
			switch(element)
			{
				case (Element.H):
					group = 1;
					break;
				case (Element.He):
					group = 18;
					break;
				case (Element.Li):
					group = 1;
					break;
				case (Element.Be):
					group = 2;
					break;
				case (Element.B):
					group = 13;
					break;
				case (Element.C):
					group = 14;
					break;
				case (Element.N):
					group = 15;
					break;
				case (Element.O):
					group = 16;
					break;
				case (Element.F):
					group = 17;
					break;
				case (Element.Ne):
					group = 18;
					break;
				case (Element.Na):
					group = 1;
					break;
				case (Element.Mg):
					group = 2;
					break;
				case (Element.Al):
					group = 13;
					break;
				case (Element.Si):
					group = 14;
					break;
				case (Element.P):
					group = 15;
					break;
				case (Element.S):
					group = 16;
					break;
				case (Element.Cl):
					group = 17;
					break;
				case (Element.Ar):
					group = 18;
					break;
				case (Element.K):
					group = 1;
					break;
				case (Element.Ca):
					group = 2;
					break;
				case (Element.Sc):
					group = 3;
					break;
				case (Element.Ti):
					group = 4;
					break;
				case (Element.V):
					group = 5;
					break;
				case (Element.Cr):
					group = 6;
					break;
				case (Element.Mn):
					group = 7;
					break;
				case (Element.Fe):
					group = 8;
					break;
				case (Element.Co):
					group = 9;
					break;
				case (Element.Ni):
					group = 10;
					break;
				case (Element.Cu):
					group = 11;
					break;
				case (Element.Zn):
					group = 12;
					break;
				case (Element.Ga):
					group = 13;
					break;
				case (Element.Ge):
					group = 14;
					break;
				case (Element.As):
					group = 15;
					break;
				case (Element.Se):
					group = 16;
					break;
				case (Element.Br):
					group = 17;
					break;
				case (Element.Kr):
					group = 18;
					break;
				case (Element.Rb):
					group = 1;
					break;
				case (Element.Sr):
					group = 2;
					break;
				case (Element.Y):
					group = 3;
					break;
				case (Element.Zr):
					group = 4;
					break;
				case (Element.Nb):
					group = 5;
					break;
				case (Element.Mo):
					group = 6;
					break;
				case (Element.Tc):
					group = 7;
					break;
				case (Element.Ru):
					group = 8;
					break;
				case (Element.Rh):
					group = 9;
					break;
				case (Element.Pd):
					group = 10;
					break;
				case (Element.Ag):
					group = 11;
					break;
				case (Element.Cd):
					group = 12;
					break;
				case (Element.In):
					group = 13;
					break;
				case (Element.Sn):
					group = 14;
					break;
				case (Element.Sb):
					group = 15;
					break;
				case (Element.Te):
					group = 16;
					break;
				case (Element.I):
					group = 17;
					break;
				case (Element.Xe):
					group = 18;
					break;
				case (Element.Cs):
					group = 1;
					break;
				case (Element.Ba):
					group = 2;
					break;
				case (Element.La):
					group = 3;
					break;
				case (Element.Hf):
					group = 4;
					break;
				case (Element.Ta):
					group = 5;
					break;
				case (Element.W):
					group = 6;
					break;
				case (Element.Re):
					group = 7;
					break;
				case (Element.Os):
					group = 8;
					break;
				case (Element.Ir):
					group = 9;
					break;
				case (Element.Pt):
					group = 10;
					break;
				case (Element.Au):
					group = 11;
					break;
				case (Element.Hg):
					group = 12;
					break;
				case (Element.Tl):
					group = 13;
					break;
				case (Element.Pb):
					group = 14;
					break;
				case (Element.Bi):
					group = 15;
					break;
				case (Element.Po):
					group = 16;
					break;
				case (Element.At):
					group = 17;
					break;
				case (Element.Rn):
					group = 18;
					break;
				case (Element.Fr):
					group = 1;
					break;
				case (Element.Ra):
					group = 2;
					break;
				case (Element.Ac):
					group = 3;
					break;
				default:
					group = -1;
					break;
			}
			
			return group;
		}
		
		/**
		 * GET valence electroins
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @return -1 for non-selected elements
		 * 
		 */		
		public static function GetRow(var element:Element):int
		{
			var row:int = -1;
			switch (element)
			{
				case (Element.H):
					row = 0;
					break;
				case (Element.He):
					row = 0;
					break;
				case (Element.Li):
					row = 1;
					break;
				case (Element.Be):
					row = 1;
					break;
				case (Element.B):
					row = 1;
					break;
				case (Element.C):
					row = 1;
					break;
				case (Element.N):
					row = 1;
					break;
				case (Element.O):
					row = 1;
					break;
				case (Element.F):
					row = 1;
					break;
				case (Element.Ne):
					row = 1;
					break;
				case (Element.Na):
					row = 2;
					break;
				case (Element.Mg):
					row = 2;
					break;
				case (Element.Al):
					row = 2;
					break;
				case (Element.Si):
					row = 2;
					break;
				case (Element.P):
					row = 2;
					break;
				case (Element.S):
					row = 2;
					break;
				case (Element.Cl):
					row = 2;
					break;
				case (Element.Ar):
					row = 2;
					break;
				case (Element.K):
					row = 3;
					break;
				case (Element.Ca):
					row = 3;
					break;
				case (Element.Sc):
					row = 3;
					break;
				case (Element.Ti):
					row = 3;
					break;
				case (Element.V):
					row = 3;
					break;
				case (Element.Cr):
					row = 3;
					break;
				case (Element.Mn):
					row = 3;
					break;
				case (Element.Fe):
					row = 3;
					break;
				case (Element.Co):
					row = 3;
					break;
				case (Element.Ni):
					row = 3;
					break;
				case (Element.Cu):
					row = 3;
					break;
				case (Element.Zn):
					row = 3;
					break;
				case (Element.Ga):
					row = 3;
					break;
				case (Element.Ge):
					row = 3;
					break;
				case (Element.As):
					row = 3;
					break;
				case (Element.Se):
					row = 3;
					break;
				case (Element.Br):
					row = 3;
					break;
				case (Element.Kr):
					row = 3;
					break;
				case (Element.Rb):
					row = 4;
					break;
				case (Element.Sr):
					row = 4;
					break;
				case (Element.Y):
					row = 4;
					break;
				case (Element.Zr):
					row = 4;
					break;
				case (Element.Nb):
					row = 4;
					break;
				case (Element.Mo):
					row = 4;
					break;
				case (Element.Tc):
					row = 4;
					break;
				case (Element.Ru):
					row = 4;
					break;
				case (Element.Rh):
					row = 4;
					break;
				case (Element.Pd):
					row = 4;
					break;
				case (Element.Ag):
					row = 4;
					break;
				case (Element.Cd):
					row = 4;
					break;
				case (Element.In):
					row = 4;
					break;
				case (Element.Sn):
					row = 4;
					break;
				case (Element.Sb):
					row = 4;
					break;
				case (Element.Te):
					row = 4;
					break;
				case (Element.I):
					row = 4;
					break;
				case (Element.Xe):
					row = 4;
					break;
				case (Element.Cs):
					row = 5;
					break;
				case (Element.Ba):
					row = 5;
					break;
				case (Element.La):
					row = 5;
					break;
				case (Element.Hf):
					row = 5;
					break;
				case (Element.Ta):
					row = 5;
					break;
				case (Element.W):
					row = 5;
					break;
				case (Element.Re):
					row = 5;
					break;
				case (Element.Os):
					row = 5;
					break;
				case (Element.Ir):
					row = 5;
					break;
				case (Element.Pt):
					row = 5;
					break;
				case (Element.Au):
					row = 5;
					break;
				case (Element.Hg):
					row = 5;
					break;
				case (Element.Tl):
					row = 5;
					break;
				case (Element.Pb):
					row = 5;
					break;
				case (Element.Bi):
					row = 5;
					break;
				case (Element.Po):
					row = 5;
					break;
				case (Element.At):
					row = 5;
					break;
				case (Element.Rn):
					row = 5;
					break;
				case (Element.Fr):
					row = 6;
					break;
				case (Element.Ra):
					row = 6;
					break;
				case (Element.Ac):
					row = 6;
					break;
				default:
					row = -1;
					break;
			}
			return row;
		}

		/**
		 *GET valence electrons
		 * only for selected elements 
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return -1 for non-selected elements
		 */		
		public static function GetMinChargeWhenBonded(element:Element):int
		{
			var count:int = -1;
			switch (element)
			{
				case (Element.H):
					count = 1;
					break;
				case (Element.B):
					count = 3;
					break;
				case (Element.C):
					count = 4;
					break;
				case (Element.Si):
					count = 4;
					break;
				case (Element.Ge):
					count = 4;
					break;
				case (Element.N):
					count = 5;
					break;
				case (Element.P):
					count = 5;
					break;
				case (Element.As):
					count = 5;
					break;
				case (Element.O):
					count = 6;
					break;
				case (Element.S):
					count = 6;
					break;
				case (Element.Se):
					count = 6;
					break;
				case (Element.F):
					count = 7;
					break;
				case (Element.Cl):
					count = 7;
					break;
				case (Element.Br):
					count = 7;
					break;
				case (Element.I):
					count = 7;
					break;
				default:
					count = -1;
					break;
			}
			return count;
		}
		
		/**
		 * GET minimum charge when bonded
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param Element
		 * @param element
		 * @return returns -99 for for non-selected elements
		 * 
		 */		
		public static function GetMinChargeWhenBonded(Element element):int
		{
			var charge:int = -99;
			switch (element)
			{
				case (Element.H):
					charge = 0;
					break;
				case (Element.B):
					charge = -1;
					break;
				case (Element.C):
					charge = -1;
					break;
				case (Element.Si):
					charge = 0;
					break;
				case (Element.Ge):
					charge = 0;
					break;
				case (Element.N):
					charge = -1;
					break;
				case (Element.P):
					charge = 0;
					break;
				case (Element.As):
					charge = 0;
					break;
				case (Element.O):
					charge = -1;
					break;
				case (Element.S):
					charge = -1;
					break;
				case (Element.Se):
					charge = -1;
					break;
				case (Element.F):
					charge = 0;
					break;
				case (Element.Cl):
					charge = 0;
					break;
				case (Element.Br):
					charge = 0;
					break;
				case (Element.I):
					charge = 0;
					break;
				default:
					charge = -99;
					break;
			}
			return charge;
		}
		
		/**
		 * GET minimum charge when bonded
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return -99 for non-selected elements
		 * 
		 */		
		public static function GetMaxChargeWhenBonded(element:Element):int
		{
			var charge:int = -99;
			switch (element)
			{
				case (Element.H):
					charge = 0;
					break;
				case (Element.B):
					charge = 0;
					break;
				case (Element.C):
					charge = 1;
					break;
				case (Element.Si):
					charge = 0;
					break;
				case (Element.Ge):
					charge = 0;
					break;
				case (Element.N):
					charge = 1;
					break;
				case (Element.P):
					charge = 1;
					break;
				case (Element.As):
					charge = 0;
					break;
				case (Element.O):
					charge = 1;
					break;
				case (Element.S):
					charge = 1;
					break;
				case (Element.Se):
					charge = 0;
					break;
				case (Element.F):
					charge = 0;
					break;
				case (Element.Cl):
					charge = 0;
					break;
				case (Element.Br):
					charge = 0;
					break;
				case (Element.I):
					charge = 0;
					break;
				default:
					charge = -99;
					break;
			}
			return charge;
		}
		
		/**
		 * GET minimum charge
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return -99 for non-selected elements
		 * 
		 */		
		public static function GetMinCharge(element:Element):int
		{
			var charge:int = - 99;
			switch (element)
			{
				case (Element.H):
					charge = -1;
					break;
				case (Element.B):
					charge = -1;
					break;
				case (Element.C):
					charge = -1;
					break;
				case (Element.Si):
					charge = 0;
					break;
				case (Element.Ge):
					charge = 0;
					break;
				case (Element.N):
					charge = -1;
					break;
				case (Element.P):
					charge = 0;
					break;
				case (Element.As):
					charge = 0;
					break;
				case (Element.O):
					charge = -1;
					break;
				case (Element.S):
					charge = -1;
					break;
				case (Element.Se):
					charge = -1;
					break;
				case (Element.F):
					charge = -1;
					break;
				case (Element.Cl):
					charge = -1;
					break;
				case (Element.Br):
					charge = -1;
					break;
				case (Element.I):
					charge = -1;
					break;
				default:
					charge = -9;
					break;
			}
			return charge;
		}
		
		/**
		 * GET minimum charge when bonded
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return -99 for non-selected elements
		 * 
		 */		
		public static function GetMaxCharge(element:Element):int
		{
			var charge:int = -99;
			switch (element)
			{
				case (Element.H):
					charge = 0;
					break;
				case (Element.B):
					charge = 0;
					break;
				case (Element.C):
					charge = 1;
					break;
				case (Element.Si):
					charge = 0;
					break;
				case (Element.Ge):
					charge = 0;
					break;
				case (Element.N):
					charge = 1;
					break;
				case (Element.P):
					charge = 1;
					break;
				case (Element.As):
					charge = 0;
					break;
				case (Element.O):
					charge = 1;
					break;
				case (Element.S):
					charge = 1;
					break;
				case (Element.Se):
					charge = 0;
					break;
				case (Element.F):
					charge = 0;
					break;
				case (Element.Cl):
					charge = 0;
					break;
				case (Element.Br):
					charge = 0;
					break;
				case (Element.I):
					charge = 0;
					break;
				default:
					charge = -99;
					break;
			}
			return charge;
		}
		
		
		/**
		 * GET minimum coordination number
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return -1 for non-selected elements
		 */		
		public static function GetMinCoordinationNumber(element:Element):int
		{
			var coordinationNumber = -1;
			switch (element)
			{
				case (Element.H):
					coordinationNumber = 0;
					break;
				case (Element.B):
					coordinationNumber = 2;
					break;
				case (Element.C):
					coordinationNumber = 1;
					break;
				case (Element.Si):
					coordinationNumber = 4;
					break;
				case (Element.Ge):
					coordinationNumber = 4;
					break;
				case (Element.N):
					coordinationNumber = 1;
					break;
				case (Element.P):
					coordinationNumber = 3;
					break;
				case (Element.As):
					coordinationNumber = 3;
					break;
				case (Element.O):
					coordinationNumber = 1;
					break;
				case (Element.S):
					coordinationNumber = 1;
					break;
				case (Element.Se):
					coordinationNumber = 2;
					break;
				case (Element.F):
					coordinationNumber = 0;
					break;
				case (Element.Cl):
					coordinationNumber = 0;
					break;
				case (Element.Br):
					coordinationNumber = 0;
					break;
				case (Element.I):
					coordinationNumber = 0;
					break;
				default:
					coordinationNumber = -1;
					break;
			}
			return coordinationNumber;
		}
		
		
		/**
		 * GET maximum coordination number
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return -1 for non-selected elements
		 */		
		public static function GetMaxCoordinationNumber(element:Element):int
		{
			var coordinationNumber = -1;
			switch (element)
			{
				case (Element.H):
					coordinationNumber = 1;
					break;
				case (Element.B):
					coordinationNumber = 4;
					break;
				case (Element.C):
					coordinationNumber = 4;
					break;
				case (Element.Si):
					coordinationNumber = 6;
					break;
				case (Element.Ge):
					coordinationNumber = 4;
					break;
				case (Element.N):
					coordinationNumber = 4;
					break;
				case (Element.P):
					coordinationNumber = 6;
					break;
				case (Element.As):
					coordinationNumber = 6;
					break;
				case (Element.O):
					coordinationNumber = 3;
					break;
				case (Element.S):
					coordinationNumber = 6;
					break;
				case (Element.Se):
					coordinationNumber = 4;
					break;
				case (Element.F):
					coordinationNumber = 1;
					break;
				case (Element.Cl):
					coordinationNumber = 4;
					break;
				case (Element.Br):
					coordinationNumber = 5;
					break;
				case (Element.I):
					coordinationNumber = 7;
					break;
				default:
					coordinationNumber = 99;
					break;
			}
			return coordinationNumber;
		}
		
		/**
		 * GET maximum value of order of any bond
		 * only for selected elements 
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I,
		 * @param element
		 * @return 99 for non-selected elements
		 * 
		 */		
		public static function GetMaxAllowedLigandBondOrder(element:Element):int
		{
			var maxBondOrder = 99;
			switch (element)
			{
				case (Element.H):
					maxBondOrder = 1;
					break;
				case (Element.B):
					maxBondOrder = 1;
					break;
				case (Element.C):
					maxBondOrder = 3;
					break;
				case (Element.Si):
					maxBondOrder = 1;
					break;
				case (Element.Ge):
					maxBondOrder = 1;
					break;
				case (Element.N):
					maxBondOrder = 3;
					break;
				case (Element.P):
					maxBondOrder = 1;
					break;
				case (Element.As):
					maxBondOrder = 1;
					break;
				case (Element.O):
					maxBondOrder = 2;
					break;
				case (Element.S):
					maxBondOrder = 2;
					break;
				case (Element.Se):
					maxBondOrder = 1;
					break;
				case (Element.F):
					maxBondOrder = 1;
					break;
				case (Element.Cl):
					maxBondOrder = 1;
					break;
				case (Element.Br):
					maxBondOrder = 1;
					break;
				case (Element.I):
					maxBondOrder = 1;
					break;
				default:
					maxBondOrder = 99;
					break;
			}
			return maxBondOrder;
		}
		
		/**
		 * GET minimum valence electron count
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return -1 for non-selected elements
		 * 
		 */		
		public static function GetMinValenceElectronCount(element:Element):int
		{
			var electronCount = -1;
			switch (element)
			{
				case (Element.H):
					electronCount = 0;
					break;
				case (Element.B):
					electronCount = 6;
					break;
				case (Element.C):
					electronCount = 6;
					break;
				case (Element.Si):
					electronCount = 8;
					break;
				case (Element.Ge):
					electronCount = 8;
					break;
				case (Element.N):
					electronCount = 8;
					break;
				case (Element.P):
					electronCount = 8;
					break;
				case (Element.As):
					electronCount = 8;
					break;
				case (Element.O):
					electronCount = 8;
					break;
				case (Element.S):
					electronCount = 8;
					break;
				case (Element.Se):
					electronCount = 8;
					break;
				case (Element.F):
					electronCount = 8;
					break;
				case (Element.Cl):
					electronCount = 8;
					break;
				case (Element.Br):
					electronCount = 8;
					break;
				case (Element.I):
					electronCount = 8;
					break;
				default:
					electronCount = 0; // TODO: find out if this needs to be -1
					break;
			}
			return electronCount;
		}
		
		/**
		 * GET maximum valence electron count
		 * only for selected elements
		 * H, B, C, Si, Ge, N, P, As, O, S, Se, F, Cl, Br, I, 
		 * @param element
		 * @return 
		 * 
		 */		
		public static function GetMaxValenceElectronCount(element:Element):int
		{
			var electronCount = -1;
			switch (element)
			{
				case (Element.H):
					electronCount = 2;
					break;
				case (Element.B):
					electronCount = 8;
					break;
				case (Element.C):
					electronCount = 8;
					break;
				case (Element.Si):
					electronCount = 12;
					break;
				case (Element.Ge):
					electronCount = 8;
					break;
				case (Element.N):
					electronCount = 8;
					break;
				case (Element.P):
					electronCount = 12;
					break;
				case (Element.As):
					electronCount = 12;
					break;
				case (Element.O):
					electronCount = 8;
					break;
				case (Element.S):
					electronCount = 12;
					break;
				case (Element.Se):
					electronCount = 12;
					break;
				case (Element.F):
					electronCount = 8;
					break;
				case (Element.Cl):
					electronCount = 10;
					break;
				case (Element.Br):
					electronCount = 12;
					break;
				case (Element.I):
					electronCount = 14;
					break;
				default:
					electronCount = 99; // TODO: find out if this should be 18
					break;
			}
			return electronCount;
		}

		public static function CalculateCommonGroupDifference(thisElement:Element, newElement:Element):int
		{
			var thisGroup:int = GetGroup(thisElement);
			// H is special
			if( Element.H == thisElement )
			{
				thisGroup = 17;
			}
			
			var newGroup:int = GetGroup(newElement);
			// H is special
			if( Element.H == newElement )
			{
				newGroup = 17;
			}
			return newGroup - thisGroup;
		}
		
		private static const V1:Vector.<int> = new <int>[1];
		private static const V2:Vector.<int> = new <int>[2];
		private static const V3:Vector.<int> = new <int>[3];
		private static const V4:Vector.<int> = new <int>[4];
		private static const V35:Vector.<int> = new <int>[3, 5];
		private static const V246:Vector.<int> = new <int>[2, 4, 6];
		private static const V012:Vector.<int> = new <int>[0, 1, 2];
		
		public static function GetAllowedValencies(element:Element):Vector.<int>
		{
			var valencies:Vector.<int>;
			switch (element)
			{
				case Element.Du:
					valencies = V012;
					break;
				case Element.B:
					valencies = V3;
					break;
				case Element.C:
					valencies = V4;
					break;
				case Element.N:
					valencies = V35;
					break;
				case Element.O:
					valencies = V2;
					break;
				case Element.P:
					valencies = V35;
					break;
				case Element.S:
					valencies = V246;
					break;
				case Element.F:
				case Element.Cl:
				case Element.Br:
				case Element.I:
					valencies = V1;
					break;
				default:
					valencies = V1;
					break;
			}
			
			return valencies;
		}
		
		// TODO: make sure this is equiv to c# code
		public static function GetValence(element:Element, sumOfChargeAndBondOrder:int):int
		{
			var allowedValencies:Vector.<int> = GetAllowedValencies(element);
			
			for( var i:int = 0; i < allowedValencies.length; i++)
			{
				var valency:int = allowedValencies[i];
				if(valency >= sumOfChargeAndBondOrder)
				{
					return valency;
				}
			}
			
			return -1;
		}
	}
}