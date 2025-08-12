val geese = Array("African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher")

val gs = geese.toSet

def gooseFilter(birds: List[String]): List[String] = birds.filter(bird => !gs.contains(bird))

val newList = gooseFilter(geese.toList)

// Other
def gooseFilter2(birds: List[String]): List[String] = birds diff geese

def gooseFilter3(birds: List[String]): List[String] = birds.filterNot(geese.contains)
