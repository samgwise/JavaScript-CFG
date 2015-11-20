use v6;
use Test;
use lib 'lib';
use JavaScript::CFG::Script;

plan 1;

my JavaScript::CFG::Script $test-script;
lives-ok {
  $test-script .= new()
}, 'Instantiate JavaScript::CFG::Script';
