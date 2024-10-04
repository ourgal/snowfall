# Change to a directory seen in the current tmux pane.
#
# Free for everyone for everything good, according to the author,
# jaggz.h {who is at} gmail.com.  2022-04-30
#
# https://gist.github.com/dcfdabf1f3c5576a476c283379df04c4
# Screenshot: https://i.imgur.com/22iV7j7.png
#
# Setup:
#  1. Put this script in your path (call it find-buffer-path.pl, or
#     something else, and edit the shell function accordingly).
#  2. Add a shell function to your .bashrc or whatever:
#     Bash example 'cdb':
#     cdb () {
#       local dir="$(find-buffer-path.pl)";
#       if [[ -n $dir ]]; then cd "$dir"; else echo 'No dirs found'>&2; fi;
#     }

# Dependencies
#  1. Perl
#  2. Perl's List::MoreUtils (ex: apt install liblist-moreutils-perl)

# How it works:
# This script outputs a directory name [maybe], used by the shell function.
# (The shell function is needed because it has to do the chdir.)

# How the directory is chosen:
#  1. This script loads the current tmux pane's text, and looks for all things
#  that seem like directories.  It's pretty lenient in the initial selection,
#  but filters it down.
#
#  2. If only one directory is found, it prints it to STDOUT (and cdb ()
#  will chdir there).  If multiple are found, it lists them so you can choose.

use v5.24;
use strict;
use warnings;
use List::MoreUtils qw(distinct);

# Some prettiness
my $yel  = "\033[33;1m";
my $cya  = "\033[;36m";
my $rst  = "\033[;m";
my $bbla = "\033[0;1m";

#OIFS="$IFS"
#IFS=","
my $pane = `tmux capture-pane -p -J`;
my @candies;
my $verbose = 0;
my %filedirmap;
my %filedirfound;
select STDERR;
push @candies, ( $pane =~ m#(\S*/(?:\S|/)+)#sg );
say "Initial:" if $verbose > 0;
print STDRR map { " $_\n" } @candies if $verbose > 0;
@candies = map { $_ = path_to_dir($_); } @candies;
@candies = reverse distinct reverse @candies;
@candies = grep { -d "$_" } @candies;
say STDRR "Final:"            if $verbose > 0;
print map { "$_\n" } @candies if $verbose > 0;
exit                          if @candies < 1;

if ( @candies == 1 ) {
    say STDOUT "$candies[0]";
    exit;
}
say "Dirs (", scalar(@candies), "):";
for my $i ( 0 .. $#candies ) {
    my $fnmap = $filedirmap{ $candies[$i] };
    if ( !defined $fnmap ) {
        printf "(%d) %s\n", $i + 1, $candies[$i];
    }
    else {
        my $cnt = 0;
        for my $fpart ( @{$fnmap} ) {
            printf "%s(%d)%s $yel%s/$cya%s$rst\n",
              $cnt ? $bbla : '', $i + 1,
              $cnt ? $rst : '',
              $candies[$i], $fpart;
            $cnt++;
        }
    }
}
print "Choose or (q)uit: ";
$| = 1;
my $ans = <STDIN>;
$ans =~ s/\s+$//s;
exit if $ans eq '' || $ans eq 'q' || $ans =~ /^\033/;
if ( $ans !~ /^\d\s*$/ ) {
    say "I don't understand '$ans'";
    exit 1;
}
if ( !defined $candies[ $ans - 1 ] ) {
    say "Invalid entry '$ans'";
    exit 1;
}
say STDOUT $candies[ $ans - 1 ];

sub path_to_dir {
    my $f = shift;
    say "WORKING ON PATH {$f}" if $verbose > 1;
    return $f                  if -d $f;
    my $isfile = 1             if -f "$f";
    my $d;
    ( $d, $f ) = ( $f =~ m#^(.*/)([^/]+)$# );
    if ( -d $d ) {
        $d =~ s#/+$##;
        if ( !exists $filedirfound{"$d/$f"} ) {
            say "ADDED {$d / $f}" if $verbose > 1;
            $filedirfound{"$d/$f"} = 1;
            $filedirmap{$d} = [] if !exists $filedirmap{$d};
            push @{ $filedirmap{$d} }, $f;
            return $d;
        }
    }
    return '';
}
