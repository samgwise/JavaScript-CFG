use v6;
use Test;
use lib 'lib';
use JavaScript::CFG;

plan 1; # just see if our collection is usable

my JavaScript::CFG::String $test-string .= new( :name<testString>, :value('Test String') );

my JavaScript::CFG::Number $test-number .= new( :name<testNumber>, :value(42) );

my $js = q:to/ENDJS/;
console.log( "test JavaScript" + testString() + ' the meaning of life: ' + testNumber() );
ENDJS

my JavaScript::CFG::Script $test-script .= new(
  :constants(
    $test-string,
    $test-number
  ),
  :js($js)
);

is $test-script.build, qq:to/ENDJS/, 'build test';
{ $test-string.build-function }
{
  $test-number.build-function
}{ $js.chomp }
ENDJS
