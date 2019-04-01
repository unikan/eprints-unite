
# Generic Plugin Options

# To disable the plugin "Export::BibTeX":
# $c->{plugins}->{"Export::BibTeX"}->{params}->{disable} = 1;

# To enable the plugin "Export::LocalThing":
# $c->{plugins}->{"Export::LocalThing"}->{params}->{disable} = 0;

# Screen Plugin Configuration
# (Disabling a screen will also remove it and it's actions from all lists)

# To add the screen Screen::Items to the key_tools list at postion 200:
# $c->{plugins}->{"Screen::Items"}->{appears}->{key_tools} = 200;

# To remove the screen Screen::Items from the key_tools list:
# $c->{plugins}->{"Screen::Items"}->{appears}->{key_tools} = undef;


# Screen Actions Configuration

# To disable action "blah" of Screen::Items 
# (Disabling an action will also remove it from all lists)
# $c->{plugins}->{"Screen::Items"}->{actions}->{blah}->{disable} = 1;

# To add action "blah" of Screen::Items to the key_tools list at postion 200: 
# $c->{plugins}->{"Screen::Items"}->{actions}->{blah}->{appears}->{key_tools} = 200;

# To remove action "blah" of Screen::Items from the key_tools list
# $c->{plugins}->{"Screen::Items"}->{actions}->{blah}->{appears}->{key_tools} = undef;


# Import/export plugins

# to make a plugin only available to staff
# $c->{plugins}->{"Export::Text"}->{params}->{visible} = "staff";

# to only command line tools
# $c->{plugins}->{"Export::Text"}->{params}->{visible} = "api";

# to prevent a import/export plugin from being shown as an option, but
# not actually disable it.
# $c->{plugins}->{"Export::BibTeX"}->{params}->{advertise} = 0;


# Plugin Mapping

# The following would make the repository use the LocalDC export plugin
# anytime anything asks for the DC plugin - this is a handy way to override
# the behaviour without hacking the existing plugin. 
# $c->{plugin_alias_map}->{"Export::DC"} = "Export::LocalDC";
# This line just means that the LocalDC plugin doesn't appear in addition
# as that would be confusing. 
# $c->{plugin_alias_map}->{"Export::LocalDC"} = undef;
        
# CrossRef registration

# You should replace this with your own CrossRef account username and password.

#$c->{plugins}->{"Import::DOI"}->{params}->{pid} = "ourl_eprintsorg:eprintsorg";
# set the default options for the DOI import plugin - change these to reflect your
# own repository requirements
#$c->{plugins}->{"Import::DOI"}->{params}->{doi_field} = "id_number";
#$c->{plugins}->{"Import::DOI"}->{params}->{use_prefix} = 1;


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

