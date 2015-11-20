use v6;
use JavaScript::CFG::Graftable;

#| JavaScript::CFG::String takes a Str as a value and builds a JavaScript function, wrapping a string
class JavaScript::CFG::String does JavaScript::CFG::Graftable {
  has Str $.value = die "value is required!";
  method build-function() returns Str {
    qq:to/ENDJS/;
    function { $!name }() \{
      return "{ $!value }";
    \}

    ENDJS
  }
}
