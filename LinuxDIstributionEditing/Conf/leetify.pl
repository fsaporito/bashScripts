#!/usr/bin/env perl

use strict;
use warnings;
my %permution = (
"a" => [ "a", "A", "4", "@", "&" ];
"b" => [ "b", "B", "8" ];
"c" => ["c", "C"];
"d" => [ "d", "D", "|)" ];
"e" => [ "e", "E", "3" ];
"f" => [ "f", "F" ];
"g" => [ "g", "G", "9" ];
"h" => [ "h", "H" ];
"i" => [ "i", "I", "!", "|", "1", "l" ];
"j" => [ "j" , "J" ];
"k" => [ "k", "K", "|<" ];
"l" => [ "l", "L", "!", "!_", "7", "1", "|", "|_" ];
"m" => [ "m", "M" ];
"n" => [ "n", "N" ];
"o" => [ "o", "O", "0", "()" ];
"p" => [ "p", "P" ];
"q" => ["q", "Q" ];
"r" => [ "r", "R", "|2" ];
"s" => [ "s", "S", "5", "\$" ];
"t" => ["t", "T", "7", "1", "+"];
"u" => ["u", "U"];
"v" => [ "v", "V" ];
"w" => ["w", "W" ];
"x" => [ "x", "X" ];
"y" => [ "y", "Y" ];
"z" => ["z", "Z", "2" ];
);
# End config

while (my $word = <>) {
chomp $word;
my @string = split //, lc($word);
permute(0, @string);
}
sub permute {
my $num = shift;
my @str = @_;
my $len = @str;
if ($num >= $len) {
foreach my $char (@str) {
print $char;
}
print "\n";
return;
}
my $per = $permution{$str[$num]};
if ($per) {
my @letters = ();
if (ref($per) eq ''ARRAY'') {
@letters = @$per;
} else {
@letters = split //, $per;
}
$per = "";
foreach $per (@letters) {
my $s = "";
for (my $i = 0; $i < $len; ++$i) {
if ($i eq 0) {
if ($i eq $num) {
$s = $per;
} else {
$s = $str[0];
}
} else {
if ($i eq $num) {
$s .= $per;
} else {
$s .= $str[$i];
}
}
}
my @st = split //, $s;
permute(($num + 1), @st);
}
} else {
permute(($num + 1), @str);
}
}
