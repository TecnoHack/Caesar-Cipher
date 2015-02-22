 #!/usr/bin/perl

  print "Hello. What's your name?\n";
  $nombre=<STDIN>;
 
  chop($nombre);

  if ($nombre eq "")
  {
    print STDERR 'What s up?'."\n";
  }
  else 
  {
    print STDOUT "Hello $nombre, first, let's sum, then, you can encrypt and decrypt.. \n";
  } 

#Una suma, por si las moscas....

if ( $#ARGV == 0 ) {
die "Args: a b\n";
}
elsif ( $#ARGV == 1 ) {
$a = $ARGV[0];
$b = $ARGV[1];
}
else {
print "value a = ";
$a = <STDIN>; chop $a;
print "value b = ";
$b = <STDIN>; chop $b;
}
$c = $a + $b;
print "$a + $b = $c\n";

#Cifrado Cesar 

head();
menu();
copyright();
 
# Functions
 
sub head {
    print "\n-- == Caesar Cipher == --\n";
}
 
sub copyright {
    print "\n\n-- == Do you really think this needs TecnoHack? == --\n";
}
 
sub menu {
    print qq(
==============
= Menu       =
==============
1 - Encode   =
2 - Decode   =
3 - Exit     =
==============
);
 
    print "\n[+] Option : ";
    chomp( my $op = <stdin> );
 
    if ( $op eq "3" ) {
        copyright();
        <stdin>;
        exit(1);
    }
 
    print "\n[+] Enter text : ";
    chomp( my $text = <stdin> );
 
    print "\n[+] Result ...\n\n";
 
    if ( $op eq "1" ) {
        print cifrado_cesar($text);
        <stdin>;
        menu();
    }
    elsif ( $op eq "2" ) {
        print descifrado_cesar($text);
        <stdin>;
        menu();
    }
    else {
        menu();
    }
 
}
 
sub cifrado_cesar {
 
    my @re;
 
    @letras = split( //, $_[0] );
 
    for my $letra (@letras) {
 
        if ( $letra ne " " ) {
 
            $letrafinal = chr( ord($letra) + 3 );
 
            $letrafinal =~ s/{/a/;
            $letrafinal =~ s/\|/b/;
            $letrafinal =~ s/}/c/;
 
            push( @re, $letrafinal );
 
        }
        else {
            push( @re, " " );
        }
    }
 
    return @re;
 
}
 
sub descifrado_cesar($texto) {
 
    my @re;
 
    @letras = split( //, $_[0] );
 
    for my $letra (@letras) {
 
        if ( $letra ne " " ) {
 
            $letrafinal = chr( ord($letra) - 3 );
 
            $letrafinal =~ s/\^/x/;
            $letrafinal =~ s/_/y/;
            $letrafinal =~ s/`/z/;
 
            push( @re, $letrafinal );
 
        }
        else {
            push( @re, " " );
        }
    }
 
    return @re;
 
}
 
# TecnoHack :)
