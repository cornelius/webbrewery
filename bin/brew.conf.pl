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
# brew.conf.pl - include file for brew.conf
#

# Automatic extraction of destination directories from Makefile
open MAKEFILE,"Makefile" or die "Couldn�t find 'Makefile'\n";
while (<MAKEFILE>) {
  if (/OUTPUTDIR\s+=\s+\"?(\S+)\"?/) {
    $outputdir = $1;
    break;
  }
}
if (!$outputdir) { 
  die "Couldn�t find variable OUTPUTDIR in Makefile\n";
}

# return TRUE
1;
