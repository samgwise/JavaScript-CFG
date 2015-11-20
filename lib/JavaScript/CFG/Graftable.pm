use v6;

#| The base roll for JavaScript::CFG types
role JavaScript::CFG::Graftable {
  has Str $.name  = die "name is required!";
  #has     $.value = die "value is required!";

  method value() {  } #should be  ... but causing a wierd conflict so we'll ignore that for now

  method build-function() returns Str {  } #should be  ... but causing a wierd conflict so we'll ignore that for now
}
