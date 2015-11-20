#! /usr/bin/env perl6
use v6;
use JavaScript::CFG;

my $ws-url = JavaScript::CFG::String.new(
    :name<wsUrl>,
    :value('ws://mydomainname.com/wsTalkBack'),
);

say $ws-url.build-function;

say "Combined with a script:";
#pt.2
my $client-script = JavaScript::CFG::Script.new(
    :constants($ws-url),
    :js('ws-client.js'.IO.slurp)
);

say $client-script.build;
