package NUMBO.Cml.Helpers
{
	public class ChemicalElement
	{
		
		public function ChemicalElement(symbol:String, atomicNumber:int, atomicWeight:Number)
		{
			
		}
		
		private var _AtomicWeight:Number
		public function get AtomicWeight():Number { return _AtomicWeight; }
		public function set AtomicWeight(value:Number):void
		{
			_AtomicWeight = value;
		}
		
		private var _AtomicNumber:int
		public function get AtomicWeight():int { return _AtomicNumber; }
		public function set AtomicWeight(value:int):void
		{
			_AtomicNumber = value;
		}
		
		private var _Symbol:String;
		public function get Symbol():String { return _Symbol; }
		public function set Symbol(value:String):void
		{
			_Symbol = value;
		}
		
		private var _IsotopeMasses:Vector.<int>;
		public function get IsotopeMasses():Vector.<int> { return _IsotopeMasses; }
		public function set IsotopeMasses(value:Vector.<int>):void
		{
			_IsotopeMasses = value;
		}
		
	}
}