use v6;
use JavaScript::CFG::Graftable;

#| JavaScript::CFG::Number takes a Numeric as a value and builds a JavaScript function, wrapping a number
class JavaScript::CFG::Number does JavaScript::CFG::Graftable {
  has Numeric $.value = die "value is required!";
  method build-function() returns Str {
    qq:to/ENDJS/;
    function { $!name }() \{
      return { $!value };
    \}

    ENDJS
  }
}
