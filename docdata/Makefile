# Makefile of the web brewery package
# Written by Cornelius Schumacher

### Edit the variables below to adapt to your needs.

# Output directory for local version of created pages
OUTPUTDIR = "../doc"

# Output directory for public version of pages
PUBLICDIR = ~/public_html/webbrewerydoc

# Name of content file
CONTENTFILE = webbrewerydoc.content

#Name of data description file
DATAFILE = webbrewerydoc.data

### Below this line there are normally no changes necessary

message:
	@echo "This is the Makefile of the WebBrewery. Documentation about "
	@echo "the WebBrewery can be found in the directory doc."         
	@echo "This Makefile provides the following targets:\n"
	@echo " all          - make a local version of the web pages\n"
	@echo "   html       - make only the local html pages\n"
	@echo "   data       - make only the local data directory\n"
	@echo " public       - make the public version of the pages"
	@echo "   publichtml - make only the public html pages\n"
	@echo "   publicdata - make only the public data directory\n"

debug:
	echo Outputdir: $(OUTPUTDIR)

all: data html

public: publicdata publichtml

.Makedata/content.d: $(CONTENTFILE) $(WEBBREWERYDIR)/bin/brewmake \
                     brew.conf Makefile
	perl $(WEBBREWERYDIR)/bin/brewmake $(CONTENTFILE) $(OUTPUTDIR) html .Makedata/content.d

.Makedata/publiccontent.d: $(CONTENTFILE) $(WEBBREWERYDIR)/bin/brewmake \
                           brew.conf Makefile
	perl $(WEBBREWERYDIR)/bin/brewmake $(CONTENTFILE) $(PUBLICDIR) publichtml .Makedata/publiccontent.d

.Makedata/data.d: $(DATAFILE) $(WEBBREWERYDIR)/bin/brewdata \
                  brew.conf Makefile
	perl $(WEBBREWERYDIR)/bin/brewdata $(DATAFILE) $(OUTPUTDIR) data .Makedata/data.d
        
.Makedata/publicdata.d: $(DATAFILE) $(WEBBREWERYDIR)/bin/brewdata brew.conf \
                        Makefile
	perl $(WEBBREWERYDIR)/bin/brewdata $(DATAFILE) $(PUBLICDIR) publicdata .Makedata/publicdata.d
        
include .Makedata/content.d
include .Makedata/data.d
include .Makedata/publiccontent.d
include .Makedata/publicdata.d
