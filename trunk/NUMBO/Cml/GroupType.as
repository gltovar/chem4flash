package NUMBO.Cml
{	
	// hope these as3 grouptypes will honor the dictionary the grouptype enum honors
	public final class GroupType
	{
		private var _index:int;
		private var _description:String;
		public function GroupType(index:int, description:String)
		{
			
		}
		
		public override function valueOf():Object
		{
			return _index;
		}
		
		public override function toString():String
		{
			return _description;
		}
		
		// atoms
		public static const MonovalentSingle:GroupType = new GroupType(0, "MonovalentSingle");
		public static const RGroupMonovalentSingle:GroupType = new GroupType(1, "RGroupMonovalentSingle");
		public static const DivalentSingle:GroupType = new GroupType(2, "DivalentSingle");
		public static const AminoAcid:GroupType = new GroupType(3, "AminoAcid");
		// bonds
		public static const AcyclicSingle:GroupType = new GroupType(4, "AcyclicSingle");
		public static const CyclicSingle:GroupType = new GroupType(5, "CyclicSingle");
		public static const AcyclicDouble:GroupType = new GroupType(6, "AcyclicDouble");
		public static const CyclicDouble:GroupType = new GroupType(7, "CyclicDouble");
		public static const Unknown:GroupType = new GroupType(8, "Unknown");
	}
}