# stat web

## Avoir des stats de temps de réponses sur une centaines d'appels web.

prérequis, installer httpstat

```bash
for i in {1..100};do httpstat https://toto.com >> /tmp/toto.com ; done && grep total /tmp/toto.com | cut -d ':' -f 2 | sed 's/ms//g' | sort -nr > /tmp/toto.com2 && cat /tmp/toto.com2| perl -e 'use List::Util qw(max min sum); @a=();while(<>){$sqsum+=$_*$_; push(@a,$_)}; $n=@a;$s=sum(@a);$a=$s/@a;$m=max(@a);$mm=min(@a);$std=sqrt($sqsum/$n-($s/$n)*($s/$n));$mid=int @a/2;@srtd=sort @a;if(@a%2){$med=$srtd[$mid];}else{$med=($srtd[$mid-1]+$srtd[$mid])/2;};print "records:$n\nsum:$s\navg:$a\nstd:$std\nmed:$med\nmax:$m\min:$mm";'
```
