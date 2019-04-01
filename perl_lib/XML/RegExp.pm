package XML::RegExp;

use vars qw( $BaseChar $Ideographic $Letter $Digit $Extender 
	     $CombiningChar $NameChar 
	     $EntityRef $CharRef $Reference
	     $Name $NmToken $AttValue
	     $NCNameChar $NCName $Prefix $LocalPart $QName 
	     $VERSION );

$VERSION = '0.02';

$BaseChar = '(?:[a-zA-Z]|\xC3[\x80-\x96\x98-\xB6\xB8-\xBF]|\xC4[\x80-\xB1\xB4-\xBE]|\xC5[\x81-\x88\x8A-\xBE]|\xC6[\x80-\xBF]|\xC7[\x80-\x83\x8D-\xB0\xB4\xB5\xBA-\xBF]|\xC8[\x80-\x97]|\xC9[\x90-\xBF]|\xCA[\x80-\xA8\xBB-\xBF]|\xCB[\x80\x81]|\xCE[\x86\x88-\x8A\x8C\x8E-\xA1\xA3-\xBF]|\xCF[\x80-\x8E\x90-\x96\x9A\x9C\x9E\xA0\xA2-\xB3]|\xD0[\x81-\x8C\x8E-\xBF]|\xD1[\x80-\x8F\x91-\x9C\x9E-\xBF]|\xD2[\x80\x81\x90-\xBF]|\xD3[\x80-\x84\x87\x88\x8B\x8C\x90-\xAB\xAE-\xB5\xB8\xB9]|\xD4[\xB1-\xBF]|\xD5[\x80-\x96\x99\xA1-\xBF]|\xD6[\x80-\x86]|\xD7[\x90-\xAA\xB0-\xB2]|\xD8[\xA1-\xBA]|\xD9[\x81-\x8A\xB1-\xBF]|\xDA[\x80-\xB7\xBA-\xBE]|\xDB[\x80-\x8E\x90-\x93\x95\xA5\xA6]|\xE0(?:\xA4[\x85-\xB9\xBD]|\xA5[\x98-\xA1]|\xA6[\x85-\x8C\x8F\x90\x93-\xA8\xAA-\xB0\xB2\xB6-\xB9]|\xA7[\x9C\x9D\x9F-\xA1\xB0\xB1]|\xA8[\x85-\x8A\x8F\x90\x93-\xA8\xAA-\xB0\xB2\xB3\xB5\xB6\xB8\xB9]|\xA9[\x99-\x9C\x9E\xB2-\xB4]|\xAA[\x85-\x8B\x8D\x8F-\x91\x93-\xA8\xAA-\xB0\xB2\xB3\xB5-\xB9\xBD]|\xAB\xA0|\xAC[\x85-\x8C\x8F\x90\x93-\xA8\xAA-\xB0\xB2\xB3\xB6-\xB9\xBD]|\xAD[\x9C\x9D\x9F-\xA1]|\xAE[\x85-\x8A\x8E-\x90\x92-\x95\x99\x9A\x9C\x9E\x9F\xA3\xA4\xA8-\xAA\xAE-\xB5\xB7-\xB9]|\xB0[\x85-\x8C\x8E-\x90\x92-\xA8\xAA-\xB3\xB5-\xB9]|\xB1[\xA0\xA1]|\xB2[\x85-\x8C\x8E-\x90\x92-\xA8\xAA-\xB3\xB5-\xB9]|\xB3[\x9E\xA0\xA1]|\xB4[\x85-\x8C\x8E-\x90\x92-\xA8\xAA-\xB9]|\xB5[\xA0\xA1]|\xB8[\x81-\xAE\xB0\xB2\xB3]|\xB9[\x80-\x85]|\xBA[\x81\x82\x84\x87\x88\x8A\x8D\x94-\x97\x99-\x9F\xA1-\xA3\xA5\xA7\xAA\xAB\xAD\xAE\xB0\xB2\xB3\xBD]|\xBB[\x80-\x84]|\xBD[\x80-\x87\x89-\xA9])|\xE1(?:\x82[\xA0-\xBF]|\x83[\x80-\x85\x90-\xB6]|\x84[\x80\x82\x83\x85-\x87\x89\x8B\x8C\x8E-\x92\xBC\xBE]|\x85[\x80\x8C\x8E\x90\x94\x95\x99\x9F-\xA1\xA3\xA5\xA7\xA9\xAD\xAE\xB2\xB3\xB5]|\x86[\x9E\xA8\xAB\xAE\xAF\xB7\xB8\xBA\xBC-\xBF]|\x87[\x80-\x82\xAB\xB0\xB9]|[\xB8\xB9][\x80-\xBF]|\xBA[\x80-\x9B\xA0-\xBF]|\xBB[\x80-\xB9]|\xBC[\x80-\x95\x98-\x9D\xA0-\xBF]|\xBD[\x80-\x85\x88-\x8D\x90-\x97\x99\x9B\x9D\x9F-\xBD]|\xBE[\x80-\xB4\xB6-\xBC\xBE]|\xBF[\x82-\x84\x86-\x8C\x90-\x93\x96-\x9B\xA0-\xAC\xB2-\xB4\xB6-\xBC])|\xE2(?:\x84[\xA6\xAA\xAB\xAE]|\x86[\x80-\x82])|\xE3(?:\x81[\x81-\xBF]|\x82[\x80-\x94\xA1-\xBF]|\x83[\x80-\xBA]|\x84[\x85-\xAC])|\xEA(?:[\xB0-\xBF][\x80-\xBF])|\xEB(?:[\x80-\xBF][\x80-\xBF])|\xEC(?:[\x80-\xBF][\x80-\xBF])|\xED(?:[\x80-\x9D][\x80-\xBF]|\x9E[\x80-\xA3]))';

$Ideographic = '(?:\xE3\x80[\x87\xA1-\xA9]|\xE4(?:[\xB8-\xBF][\x80-\xBF])|\xE5(?:[\x80-\xBF][\x80-\xBF])|\xE6(?:[\x80-\xBF][\x80-\xBF])|\xE7(?:[\x80-\xBF][\x80-\xBF])|\xE8(?:[\x80-\xBF][\x80-\xBF])|\xE9(?:[\x80-\xBD][\x80-\xBF]|\xBE[\x80-\xA5]))';

$Digit = '(?:[0-9]|\xD9[\xA0-\xA9]|\xDB[\xB0-\xB9]|\xE0(?:\xA5[\xA6-\xAF]|\xA7[\xA6-\xAF]|\xA9[\xA6-\xAF]|\xAB[\xA6-\xAF]|\xAD[\xA6-\xAF]|\xAF[\xA7-\xAF]|\xB1[\xA6-\xAF]|\xB3[\xA6-\xAF]|\xB5[\xA6-\xAF]|\xB9[\x90-\x99]|\xBB[\x90-\x99]|\xBC[\xA0-\xA9]))';

$Extender = '(?:\xC2\xB7|\xCB[\x90\x91]|\xCE\x87|\xD9\x80|\xE0(?:\xB9\x86|\xBB\x86)|\xE3(?:\x80[\x85\xB1-\xB5]|\x82[\x9D\x9E]|\x83[\xBC-\xBE]))';

$CombiningChar = '(?:\xCC[\x80-\xBF]|\xCD[\x80-\x85\xA0\xA1]|\xD2[\x83-\x86]|\xD6[\x91-\xA1\xA3-\xB9\xBB-\xBD\xBF]|\xD7[\x81\x82\x84]|\xD9[\x8B-\x92\xB0]|\xDB[\x96-\xA4\xA7\xA8\xAA-\xAD]|\xE0(?:\xA4[\x81-\x83\xBC\xBE\xBF]|\xA5[\x80-\x8D\x91-\x94\xA2\xA3]|\xA6[\x81-\x83\xBC\xBE\xBF]|\xA7[\x80-\x84\x87\x88\x8B-\x8D\x97\xA2\xA3]|\xA8[\x82\xBC\xBE\xBF]|\xA9[\x80-\x82\x87\x88\x8B-\x8D\xB0\xB1]|\xAA[\x81-\x83\xBC\xBE\xBF]|\xAB[\x80-\x85\x87-\x89\x8B-\x8D]|\xAC[\x81-\x83\xBC\xBE\xBF]|\xAD[\x80-\x83\x87\x88\x8B-\x8D\x96\x97]|\xAE[\x82\x83\xBE\xBF]|\xAF[\x80-\x82\x86-\x88\x8A-\x8D\x97]|\xB0[\x81-\x83\xBE\xBF]|\xB1[\x80-\x84\x86-\x88\x8A-\x8D\x95\x96]|\xB2[\x82\x83\xBE\xBF]|\xB3[\x80-\x84\x86-\x88\x8A-\x8D\x95\x96]|\xB4[\x82\x83\xBE\xBF]|\xB5[\x80-\x83\x86-\x88\x8A-\x8D\x97]|\xB8[\xB1\xB4-\xBA]|\xB9[\x87-\x8E]|\xBA[\xB1\xB4-\xB9\xBB\xBC]|\xBB[\x88-\x8D]|\xBC[\x98\x99\xB5\xB7\xB9\xBE\xBF]|\xBD[\xB1-\xBF]|\xBE[\x80-\x84\x86-\x8B\x90-\x95\x97\x99-\xAD\xB1-\xB7\xB9])|\xE2\x83[\x90-\x9C\xA1]|\xE3(?:\x80[\xAA-\xAF]|\x82[\x99\x9A]))';

$Letter	=	 "(?:$BaseChar|$Ideographic)";
$NameChar	= "(?:[-._:]|$Letter|$Digit|$CombiningChar|$Extender)";

$Name		= "(?:(?:[:_]|$Letter)$NameChar*)";
$NmToken	= "(?:$NameChar+)";
$EntityRef	= "(?:\&$Name;)";
$CharRef	= "(?:\&#(?:[0-9]+|x[0-9a-fA-F]+);)";
$Reference	= "(?:$EntityRef|$CharRef)";

#?? what if it contains entity references?
$AttValue     = "(?:\"(?:[^\"&<]*|$Reference)\"|'(?:[^\'&<]|$Reference)*')";

#########################################################################
# The following definitions came from the XML Namespaces spec:
#########################################################################

# Same as $NameChar without the ":"
$NCNameChar	= "(?:[-._]|$Letter|$Digit|$CombiningChar|$Extender)";

# Same as $Name without the colons
$NCName		= "(?:(?:_|$Letter)$NCNameChar*)";

$Prefix		= $NCName;
$LocalPart	= $NCName;
$QName		= "(?:(?:$Prefix:)?$LocalPart)";

return 1;

__END__

=head1 NAME

XML::RegExp - Regular expressions for XML tokens

=head1 SYNOPSIS

 use XML::RegExp;

 if ($my_name =~ /^$XML::RegExp::Name$/)
 {
   # $my_name is a valid XML 'Name'
 }

=head1 DESCRIPTION

This package contains regular expressions for the following XML tokens:
BaseChar, Ideographic, Letter, Digit, Extender, CombiningChar, NameChar, 
EntityRef, CharRef, Reference, Name, NmToken, and AttValue.

The definitions of these tokens were taken from the XML spec 
(Extensible Markup Language 1.0) at L<http://www.w3.org/TR/REC-xml>.

Also contains the regular expressions for the following tokens from the
XML Namespaces spec at L<http://www.w3.org/TR/REC-xml-names>:
NCNameChar, NCName, QName, Prefix and LocalPart.

=head1 AUTHOR

Original Author is Enno Derksen <F<enno@att.com>>

Please send bugs, comments and suggestions to T.J. Mather <F<tjmather@tjmather.com>>

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

