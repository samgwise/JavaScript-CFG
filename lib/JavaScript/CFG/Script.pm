use v6;
use JavaScript::CFG::Graftable;

#| JavaScript::CFG::Script prepends it's array of constants to the concatination of it's js array
class JavaScript::CFG::Script {
  has JavaScript::CFG::Graftable  @.constants;
  has Str                         @.js;

  method build returns Str {
    @!constants.map( { $_.build-function } ).join("\n")
    ~
    @!js.join("\n")
  }
}
