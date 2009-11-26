import scala.io.Source;
import scala.collection.mutable;

class Bloom( file : String, hashFunctions : List[(String) => Int] ){
	private val words = mutable.Map.empty[Int, Int];
	def initialize() : Unit = {
		populateBitmap();
	}
	
	def populateBitmap() : Unit = {
		for( line <- Source.fromFile(file).getLines ){
			for( func <- hashFunctions ){
				words( func(line.trim().toLowerCase()) ) = 1;
			}
		}
	}	
	
	def testWord(word:String) : Boolean = {
		var present = true;
		for( func <- hashFunctions ){
			present &&= words.contains( func(word) );
		}
		return present;
	}
}

def hash(x:String) : Int = {
	val len = x.length;
	var hash_val = 1315423911;
	for( i <- 0 to len-1 ){
	  hash_val ^= ( ( hash_val << 5 ) + x(i) + ( hash_val >> 2 ) )
	}
	return hash_val
}


val b = new Bloom("/usr/share/dict/words", List( (x) => x.hashCode(), hash ));
b.initialize();
println( b.testWord("mafasdfds") );
println( b.testWord("cheese") );