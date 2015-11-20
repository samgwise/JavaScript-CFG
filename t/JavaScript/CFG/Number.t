use v6;
use Test;
use lib 'lib';
use JavaScript::CFG::Number;

plan 2;

my JavaScript::CFG::Number $test-number;
lives-ok {
  $test-number .= new( :name<testNumber>, :value(42) )
}, 'Instantiate JavaScript::CFG::Number';

is $test-number.build-function, q:to/ENDJS/, 'build-function';
function testNumber() {
  return 42;
}

ENDJS
