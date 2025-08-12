def finalGrade(exam: Int, projects: Int): Int = (exam, projects) match {
  case (e, p) if e > 90 || p > 10 => 100
  case (e, p) if e > 75 && p >= 5 => 90
  case (e, p) if e > 50 && p >= 2 => 75
  case (_, _)                     => 0
}

// def boolToWord2(b: Boolean): String = b match {
//   case true => "Yes"
//   case _    => "No"
// }
