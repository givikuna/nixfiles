#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Long qw(GetOptions);
use Pod::Usage qw(pod2usage);

my $default_if = '';
my $default_of = '/dev/sda';
my $default_bs = '4M';
my $status     = 1;

my $if_file;
my $of_dev;
my $bs_size;
my $help;
my $no_status;

GetOptions(
    'if=s'       => \$if_file,
    'of=s'       => \$of_dev,
    'bs=s'       => \$bs_size,
    'status!'    => \$status,
    'no-status'  => sub { $status = 0 },
    'help'       => \$help,
) or pod2usage(2);

pod2usage(1) if $help;

$if_file  //= $default_if;
$of_dev   //= $default_of;
$bs_size  //= $default_bs;

unless (-f $if_file) {
    die "ERROR: input file '$if_file' not found.\n";
}

if ($< != 0) {
    exec('sudo', $0, @ARGV) or die "failed to re-execute with sudo: $!\n";
}

print "WARNING: this will overwrite the entire device $of_dev with data from $if_file!\n";
print "type 'y' to continue: ";
my $answer = <STDIN>;
chomp $answer;
unless ($answer eq 'y') {
    print "aborted.\n";
    exit 0;
}

my @cmd = ('dd', "if=$if_file", "of=$of_dev", "bs=$bs_size");
push @cmd, 'status=progress' if $status;

print "running: @cmd\n";
exec(@cmd) or die "failed to execute dd: $!\n";

__END__

=head1 NAME

dd-k.pl - dd wrapper

=head1 SYNOPSIS

dd-k.pl [options]

    Options:
        --if=<file>         Input ISO file
        --of=<device>       Output device (default: /dev/sda)
        --bs=<size>         Block size (default: 4M)
        --status            Show progress (default:on)
        --no-status         Disable progress
        --help              Show this help

=head1 EXAMPLES

dd-k.pl
dd-k.pl --if=some.iso --of=/dev/sdb --bs=1M
dd-k.pl --no-status

=cut
