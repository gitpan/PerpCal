package PerpCal;

use diagnostics;
use strict;
use warnings;
use Carp;
use Exporter;
use vars qw($VERSION @EXPORT @ISA);
$VERSION = '1.0';
@ISA = ('Exporter');
@EXPORT = qw(dow);

sub dow
{
    my ($year, $month, $numdate) = @_;
    my @M = (0, 0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5);

    return ($M[$month] + $numdate + ($year % 100) + (int(($year %
        100)/4)) + (2 * (3 - ((int($year/100) % 4)))) - ((($month < 3)
        && (($year % 400 == 0) || ((!($year % 100 == 0)) && ($year %
        4 == 0)))) ? 1 : 0)) % 7;
}

1;

__END__

=head1 NAME

PerpCal

=head1 EXAMPLE

    #!/usr/local/bin/perl

    use diagnostics;
    use strict;
    use warnings;
    use PerpCal;
    use Getopt::Long;

    my ($year, $month, $numdate);
    GetOptions("year=i" => \$year, "month=i" => \$month,
        "date=i" => \$numdate);

    sub usage
    {
        print "USAGE: $0 --year=YYYY --month=MM --date=DD\n";
        print "example: $0 --year=1972 --month=2 --date=7";
        print "    (should be Monday)\n";
        exit 0;
    }

    &usage if (!defined($year) or !defined($month) or
               !defined($numdate));

    my $result = dow($year, $month, $numdate);

    print "Sunday\n" if ($result == 0);
    print "Monday\n" if ($result == 1);
    print "Tuesday\n" if ($result == 2);
    print "Wednesday\n" if ($result == 3);
    print "Thursday\n" if ($result == 4);
    print "Friday\n" if ($result == 5);
    print "Saturday\n" if ($result == 6);

=head1 DESCRIPTION

This is another implementation of a perpetual calendar. However, dates
prior to September 3, 1752 (the Gregorian Reformation) were not taken
into consideration, thus, the day of week for them would be incorrectly
reported.

A return value of 0 means that the day of week is "Sunday". A return
value of 1 is "Monday", 2 is "Tuesday", 3 is "Wednesday", 4 is
"Thursday", 5 is "Friday", and 6 is "Saturday".

=head1 REFERENCE

"A Mental Calendar" by Michael Keith, Journal of Recreational
Mathematics, 1975-1976.

=head1 LICENSE

This program is free software; you can redistribute it or modify it
under the terms of the GNU General Public License. 

=head1 AUTHOR

Julius C. Duque <jcduque (AT) lycos (DOT) com>

=cut

