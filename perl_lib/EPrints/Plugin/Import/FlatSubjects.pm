=head1 NAME

EPrints::Plugin::Import::FlatSubjects

=cut


package EPrints::Plugin::Import::FlatSubjects;

use EPrints::Plugin::Import::TextFile;
use strict;

our @ISA = qw/ EPrints::Plugin::Import::TextFile /;

sub new
{
	my( $class, %params ) = @_;

	my $self = $class->SUPER::new( %params );

	$self->{name} = "Flat Subjects";
	$self->{visible} = "all";
	$self->{produce} = [ 'list/subject' ];

	return $self;
}

sub input_text_fh
{
	my( $plugin, %opts ) = @_;

	my $fh = $opts{fh};
	binmode( $fh, ":utf8" );

	my @ids = ();
	my $input_data;
	while( defined($input_data = <$fh>) ) 
	{
		my $epdata = $plugin->convert_input( $input_data );

		next unless( defined $epdata );
		
		my $dataobj = $plugin->epdata_to_dataobj( $opts{dataset}, $epdata );
		if( defined $dataobj )
		{
			push @ids, $dataobj->get_id;
		}
	}
	
	return EPrints::List->new( 
		dataset => $opts{dataset}, 
		session => $plugin->{session},
		ids=>\@ids );
}

sub convert_input 
{
	my ( $plugin, $input_data ) = @_;

	return if $input_data =~ m/^\s*(#|$)/;
	chomp $input_data;
	my @vals = split /:/ , $input_data;

	# percent-decode "%3A" to ":"
	@vals = map { ( my $s = $_ ) =~ s/%3A/:/g; $s } @vals;

	my @parents = split( ",", $vals[2] );

	my $lang = $plugin->{session}->get_repository->get_conf( "defaultlanguage" );

	my $epdata = {
			subjectid   => $vals[0],
			name_name   => [$vals[1]],
			name_lang   => [$lang],
			parents     => \@parents,					
		        depositable => ($vals[3]?"TRUE":"FALSE"),
		 };
	return $epdata;
}

1;

=head1 COPYRIGHT

=for COPYRIGHT BEGIN

Copyright 2019 University of Southampton.
EPrints 3.4 is supplied by EPrints Services.

http://www.eprints.org/eprints-3.4/

=for COPYRIGHT END

=for LICENSE BEGIN

This file is part of EPrints 3.4 L<http://www.eprints.org/>.

EPrints 3.4 and this file are released under the terms of the
GNU Lesser General Public License version 3 as published by
the Free Software Foundation unless otherwise stated.

EPrints 3.4 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with EPrints 3.4.
If not, see L<http://www.gnu.org/licenses/>.

=for LICENSE END

