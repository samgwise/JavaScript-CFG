use v6;
use Test;
use lib 'lib';
use JavaScript::CFG::String;

plan 1;

my JavaScript::CFG::String $test-string;
lives-ok {
  $test-string .= new( :name<testString>, :value('Testing, testing, 123...') )
}, 'Instantiate JavaScript::CFG::String';
