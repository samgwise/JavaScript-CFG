# JavaScript::CFG
*JavaScript Constant Function Grafter*

**A perl6 module for grafting constant functions into JavaScript source code.**

Grafting functions to JavaScript provides a simple solution for adding information to a scripts environment. This is an alternative to substituting placeholders with values from the server.
By passing our values via a JavaScript function we allow the script to use the values as any other function might be used in the language. In addition it provides a structured interface
for providing values to a JavaScript.

**Why might I use this?**
* To provide additional environment information to a client side script
* Combine multiple chunks of JavaScript code together

**Examples**

Generate a constant function to return a WebSocket url:
```perl6
use v6;
use JavaScript::CFG;

my $ws-url = JavaScript::CFG::String.new(
    :name<wsUrl>,
    :value('ws://mydomainname.com/wsTalkBack'),
);

say $ws-url.build-function;
```

This will give us the following JavaScript:

```javascript
function wsUrl() {
  return "ws://mydomainname.com/wsTalkBack";
}
```

To mix our function into our JavaScript client, we continue with:
```perl6
my $client-script = JavaScript::CFG::Script.new(
    :constants($ws-url),
    :js('my-websocket-client.js'.IO.slurp)
);

say $client-script.build;
```

This will place our function before the contents of our script. Allowing us to call wsUrl() in the script allowing us to know where to connect our WebSocket.

**JavaScript::CFG classes**

*JavaScript::CFG* is a simple wrapper for bringing in the various classes that make up the whole.

*JavaScript::CFG::Graftable* is the base role which our types implement. If you'd like to roll your own type, just pull it in and provide a value and function-build methods for your class.

*JavaScript::CFG::String* as shown in the above examples this Graftable type's build-function method returns a JavaScript function returning a string. The vlaue property is a perl6 Str class.

*JavaScript::CFG::Number* similar in operation to the String class this Graftable type returns a JavaScript function which returns a number. The value property is a perl6 Numeric role.

*JavaScript::CFG::Script* as shown in the example above, this class operates as a collection of constants and JavaScript. This class is not Graftable.
