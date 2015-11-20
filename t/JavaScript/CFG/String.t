use v6;
use Test;
use lib 'lib';
use JavaScript::CFG::String;

plan 2;

my JavaScript::CFG::String $test-string;
lives-ok {
  $test-string .= new( :name<testString>, :value('Testing, testing, 123...') )
}, 'Instantiate JavaScript::CFG::String';

is $test-string.build-function, q:to/ENDJS/, 'build-function';
function testString() {
  return "Testing, testing, 123...";
}

ENDJS
