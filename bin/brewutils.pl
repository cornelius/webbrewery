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
# brewutils.pl - Utility functions for WebBrewery
#

# Create all non-existing directories in specified path.
sub create_path {
  my $path = $_[0];
  
#  print "Creating path: $path\n";
  
  $path =~ s/\/+/\//g;
  $path =~ s/\/[\w|.]*$//;
#  print "Path to create: $path\n";
  $path = `echo $path`;
  chop $path;
#  print "Path to create, expanded: $path\n";

  my @dirs = split /\//,$path;
  my $dir = "";
  my $createpath = "";
  foreach $dir (@dirs) {
    if ($dir) {
#      print "Dir: `$dir`\n";
      $createpath = $createpath . $dir;
#      print "Creating path $createpath\n";
      if (-e $createpath) {
        if (!-d $createpath) {
          print "Error! Cannot create directory $createpath because there ";
          print "exists a file with this name.\n";
          last;
        }
#        print "It exists\n";
      } else {
#        print "It doesn't exist\n";
        if (!mkdir $createpath,0775) {
          print "Unable to create directory '$createpath'\n";
        } else {
          print "Created directory '$createpath'\n";
        }
      }
    }
    $createpath = $createpath . '/';
  }
}

# return true
1;
