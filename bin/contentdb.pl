#
#    This file is part of the WebBrewery
#    Copyright (C) 2000  Cornelius Schumacher
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#    Contact Info:
#      WWW:  http://github.com/cornelius/webbrewery
#      Mail: Cornelius Schumacher <schumacher@kde.org>
#

#
# contentdb.pl - create content database
#
# The content file is read and its entries are stored in the array @contentdb.
# Its subindices address the following information:
#  0 - hierarchy level
#  1 - hidden flag. A value of "-" means: Hide this page in the content.
#  2 - filename of page
#  3 - Name of page (Appears in contents, site map, etc.)
#  4 - template filename
#  5 - file suffix

if (!defined($defaulttemplatefile)) {
  require "brew.conf";
}

&read_contentdb;

sub read_contentdb {
  my @options,$description,$option,$mytemplatefile;

  if (!open CONTENT,"$contentfile") {
    print "Could not open content file ´$contentfile´\n";
    exit;
  } else {
    $i = 0;
    while (<CONTENT>) {
#    print "-- $_";
      if(/^\s*(>*)\s*(-?)\s*([\w|\/]+)\s+(.*)$/) {
        $contentdb[$i][0] = length($1);
        $contentdb[$i][1] = $2;
        $contentdb[$i][2] = $3;
        @options = split /--/,$4;
#      print "++++++++ @options\n";
        $description = shift(@options);
        $description =~ s/\s+$//;
        $contentdb[$i][3] = $description;
        $contentdb[$i][5] = $createext;  # default suffix
        foreach $option (@options) {
          if ($option =~ /TEMPLATE:(.*)/) {
            $mytemplatefile = $1;
            if ($mytemplatefile !~ /$templateext$/) {
              $mytemplatefile .= ".$templateext";
            }
            $contentdb[$i][4] = $mytemplatefile;
          } elsif ($option =~ /SUFFIX:(.*)/) {
            $mysuffix = $1;
            $mysuffix =~ s/^\.//;
            $contentdb[$i][5] = $mysuffix;
          }
        }
        if (!defined($contentdb[$i][4])) {
          $contentdb[$i][4] = $defaulttemplatefile;
        }
        $i++;
      }
    }
  }
  close CONTENT;
  
#&dump_contentdb;
}

sub dump_contentdb {
  print "Content database:\n";
  print "=================\n";
  for ($i=0;$i<@contentdb;++$i) {
    print "-- ",$contentdb[$i][0];
    print " -- ",$contentdb[$i][1];
    print " -- ",$contentdb[$i][2];
    print " -- ",$contentdb[$i][3];
    print " -- ",$contentdb[$i][4];
    print " -- ",$contentdb[$i][5]," --";
    print "\n";
  }
}


# return true
1;
