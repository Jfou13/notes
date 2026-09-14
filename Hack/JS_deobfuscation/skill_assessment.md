# Skill Assessment

## Once you find the JavaScript code, try to run it to see if it does any interesting functions. Did you get something in return?

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ touch eval(function (p, a, c, k, e, d) { e = function (c) { return c.toString(36) }; if (!''.replace(/^/, String)) { while (c--) { d[c.toString(a)] = k[c] || c.toString(a) } k = [function (e) { return d[e] }]; e = function () { return '\\w+' }; c = 1 }; while (c--) { if (k[c]) { p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]) } } return p }('t 5(){6 7=\'1{n\'+\'8\'+\'9\'+\'a\'+\'b\'+\'c!\'+\'}\',0=d e(),2=\'/4\'+\'.g\';0[\'f\'](\'i\',2,!![]),0[\'k\'](l)}m[\'o\'](\'1{j\'+\'p\'+\'q\'+\'r\'+\'s\'+\'h\'+\'3}\');', 30, 30, 'xhr|HTB|_0x437f8b|k3y|keys|apiKeys|var|flag|3v3r_|run_0|bfu5c|473d_|c0d3|new|XMLHttpRequest|open|php|n_15_|POST||send|null|console||log|4v45c|r1p7_|3num3|r4710|function'.split('|'), 0, {}))
                                                                                
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ vi api.min.js
                                                                                
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ node api.min.js                   
HTB{j4v45cr1p7_snip_15_k3y}
```

## As you may have noticed, the JavaScript code is obfuscated. Try applying the skills you learned in this module to deobfuscate the code, and retrieve the 'flag' variable.

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ cat api.min.js                                    
eval(function (p, a, c, k, e, d) { e = function (c) { return c.toString(36) }; if (!''.replace(/^/, String)) { while (c--) { d[c.toString(a)] = k[c] || c.toString(a) } k = [function (e) { return d[e] }]; e = function () { return '\\w+' }; c = 1 }; while (c--) { if (k[c]) { p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]) } } return p }('t 5(){6 7=\'1{n\'+\'8\'+\'9\'+\'a\'+\'b\'+\'c!\'+\'}\',0=d e(),2=\'/4\'+\'.g\';0[\'f\'](\'i\',2,!![]),0[\'k\'](l)}m[\'o\'](\'1{j\'+\'p\'+\'q\'+\'r\'+\'s\'+\'h\'+\'3}\');', 30, 30, 'xhr|HTB|_0x437f8b|k3y|keys|apiKeys|var|flag|3v3r_|run_0|bfu5c|473d_|c0d3|new|XMLHttpRequest|open|php|n_15_|POST||send|null|console||log|4v45c|r1p7_|3num3|r4710|function'.split('|'), 0, {}))
```
on remplace le `eval` par `console.log`

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ cat console.api.min.js      
console.log(function (p, a, c, k, e, d) { e = function (c) { return c.toString(36) }; if (!''.replace(/^/, String)) { while (c--) { d[c.toString(a)] = k[c] || c.toString(a) } k = [function (e) { return d[e] }]; e = function () { return '\\w+' }; c = 1 }; while (c--) { if (k[c]) { p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]) } } return p }('t 5(){6 7=\'1{n\'+\'8\'+\'9\'+\'a\'+\'b\'+\'c!\'+\'}\',0=d e(),2=\'/4\'+\'.g\';0[\'f\'](\'i\',2,!![]),0[\'k\'](l)}m[\'o\'](\'1{j\'+\'p\'+\'q\'+\'r\'+\'s\'+\'h\'+\'3}\');', 30, 30, 'xhr|HTB|_0x437f8b|k3y|keys|apiKeys|var|flag|3v3r_|run_0|bfu5c|473d_|c0d3|new|XMLHttpRequest|open|php|n_15_|POST||send|null|console||log|4v45c|r1p7_|3num3|r4710|function'.split('|'), 0, {}))
```

unpack sur https://matthewfl.com/unPacker.html

```shell


function apiKeys()
	{
	var flag='HTB
		{
		n'+'3v3r_'+'run_0'+'bfu5c'+'473d_'+'c0d3!'+'
	}
	',xhr=new XMLHttpRequest(),_0x437f8b='/keys'+'.php';
	xhr['open']('POST',_0x437f8b,!![]),xhr['send'](null)
}
console['log']('HTB
	{
	j'+'4v45c'+'r1p7_'+'3num3'+'r4710'+'n_15_'+'k3y
}
');
```

ou sinon

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ node console.api.min.js| npx js-beautify
function apiKeys() {
    var flag = 'HTB{n' + '3v3r_' + 'run_0' + 'bfu5c' + '473d_' + 'c0d3!' + '}',
        xhr = new XMLHttpRequest(),
        _0x437f8b = '/keys' + '.php';
    xhr['open']('POST', _0x437f8b, !![]), xhr['send'](null)
}
```

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ python3 -c "print('HTB{n' + '3v3r_' + 'run_0' + 'bfu5c' + '473d_' + 'c0d3!' + '}')"
HTB{snip!}
```

## Try to Analyze the deobfuscated JavaScript code, and understand its main functionality. Once you do, try to replicate what it's doing to get a secret key. What is the key?

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ node console.api.min.js | npx js-beautify -o clean.js

┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ cat clean.js 
function apiKeys() {
    var flag = 'HTB{n' + '3v3r_' + 'run_0' + 'bfu5c' + '473d_' + 'c0d3!' + '}',
        xhr = new XMLHttpRequest(),
        _0x437f8b = '/keys' + '.php';
    xhr['open']('POST', _0x437f8b, !![]), xhr['send'](null)
}
console['log']('HTB{j' + '4v45c' + 'r1p7_' + '3num3' + 'r4710' + 'n_15_' + 'k3y}');  
```

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ npx terser clean.js --compress evaluate=true,sequences=false --format beautify=true,comments=all
function apiKeys() {
    var xhr = new XMLHttpRequest;
    xhr.open("POST", "/keys.php", !0), xhr.send(null);
}

console.log("HTB{j4v45cr1p7_snip_15_k3y}");
```

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ curl -s http://154.57.164.76:30536/keys.php -X POST
4150495f70336e5f37333537316e365f31355f66756e   
```

## Once you have the secret key, try to decide it's encoding method, and decode it. Then send a 'POST' request to the same previous page with the decoded key as "key=DECODED_KEY". What is the flag you got?

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ echo 4150495f70336e5f37333537316e365f31355f66756e | xxd -p -r
API_p3n_73571n6_15_snip
```

```shell
┌──(kali㉿kali)-[~/htb/academy/deobfuscation]
└─$ curl -s http://154.57.164.76:30536/keys.php -X POST -d "key=API_p3n_73571n6_15_snip"
HTB{r34dy_70_h4ck_my_w4y_1n_2_snip}
```
