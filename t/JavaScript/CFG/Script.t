use v6;
use Test;
use lib 'lib';
use JavaScript::CFG::Script;

plan 2;

my JavaScript::CFG::Script $test-script;
lives-ok {
  $test-script .= new()
}, 'Instantiate JavaScript::CFG::Script';

my $js = q:to/ENDJS/;
console.log("test JavaScript");
ENDJS

$test-script.js.push($js);

is $test-script.build, $js, 'Basic build with single js element';
