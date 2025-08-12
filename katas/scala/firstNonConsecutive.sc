@annotation.tailrec
def firstNonConsecutive(values: Seq[Int]): Option[Int] = {
  values match {
    case Seq(a, b, rest*) if a + 1 != b => Some(b)
    case Seq(_, b, rest*) => firstNonConsecutive(b +: rest)    
    case Seq(_) | Seq() => None
  }
}


println(firstNonConsecutive(Seq(1, 3, 4)))
