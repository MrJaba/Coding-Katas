import scala.io.Source;
import scala.collection.mutable;

class Anagrams(file:String){
	
	private val combinations = mutable.Map.empty[String, List[String]];
	
	def run() : List[List[String]] = {
		for( word <- Source.fromFile(file).getLines ){
			val characterStr = sortByChars(word.trim);
			val appendTo = combinations.getOrElseUpdate(characterStr,List());
			combinations(characterStr) = word::appendTo
		}
		return combinations.values.toList filter ( _.length > 1 )
	}
	
	def sortByChars(str:String) : String = {
		return str.toList.sort( (a,b) => a > b ).mkString;
	}
	
}

val a = new Anagrams( "/usr/share/dict/words" );
println( a.run() );