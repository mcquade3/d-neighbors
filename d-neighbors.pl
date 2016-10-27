#!/usr/local/bin/perl
# Mike McQuade
# BA1N.pl
# Generates all the d-Neighbors of a given string.

use strict;
use warnings;

# Initialize variables
my ($str,$d,@dneighbors,@strArray);
my @alphabet = ('A','C','G','T');

# Open the file to read
open(my $fh,"<ba1n.txt") or die $!;

# Store the values from the file into
# variables
$str = <$fh>;
$d = <$fh>;
chomp($str);
chomp($d);

# Replaces each letter in the string
# with each letter in the DNA alphabet.
# The results are stored in an array.
for (my $iteration = 1; $iteration <= $d; $iteration++) {
	if ($iteration == 1) {@strArray = ($str);}
	else {@strArray = @dneighbors;}
	
	foreach my $arrayStr (@strArray){
		for (my $i = 0; $i < length($str); $i++){
			foreach my $letter (@alphabet){
				my $distinct = $arrayStr;
				substr($distinct,$i,1) = $letter;
		
				# Only distinct strings are added to
				# the array. If the string is already
				# in the array, it does not get added
				# again.
				if (!grep(/^$distinct$/,@dneighbors)){
					push @dneighbors,$distinct;
				}
			}
		}
	}
}

# Print out all the values in the d-neighborhood
foreach my $neighbor (@dneighbors){
	print $neighbor."\n";
}

# Close the file
close($fh) || die "Couldn't close file properly";