import scala.collection.mutable.HashSet
import scala.util.control.Breaks._

def isIsogram(s: String): Boolean = {
  var m = HashSet[Char]()

  breakable {
    for (letter <- s) {
      val l = letter.toLower
      if (m.contains(l)) {
        return false
      } else {
        m.add(l)
      }
    }
  }
  true
}

println(isIsogram("moose"))

// we'll want premature termination (meaning foldl, etc, is overkill)
// lowercase sensitive, meaning we eitehr convert prior, or as we iterate.
// for simplcifiy, we will lowercase before though its not optimal

// def isIsogram(s: String): Boolean =
//   val t = s.toLowerCase
//   t == t.distinct
