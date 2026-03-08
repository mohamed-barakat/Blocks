# SPDX-License-Identifier: GPL-2.0-or-later
# Blocks: Tools for block theory
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "Blocks",
Subtitle := "Tools for block theory",
Version := "2026.03-01",

Date := (function ( ) if IsBound( GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE ) then return GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE; else return Concatenation( ~.Version{[ 1 .. 4 ]}, "-", ~.Version{[ 6, 7 ]}, "-01" ); fi; end)( ),
License := "GPL-2.0-or-later",

Persons := [
  rec( 
    LastName      := "Barakat",
    FirstNames    := "Mohamed",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "mohamed.barakat@rwth-aachen.de",
    WWWHome       := "http://www.mathematik.uni-kl.de/~barakat/",
    PostalAddress := Concatenation( [
                       "Lehrstuhl B fuer Mathematik, RWTH Aachen\n",
                       "Templergraben 64\n",
                       "52062 Aachen\n",
                       "Germany" ] ),
    Place         := "Aachen",
    Institution   := "RWTH Aachen University"
  ),
  
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/Blocks",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/Blocks",
PackageInfoURL  := "https://homalg-project.github.io/Blocks/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/Blocks/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/Blocks/releases/download/v", ~.Version, "/Blocks-", ~.Version ),
# END URLS

ArchiveFormats := ".tar.gz .zip",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "Blocks",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Tools for block theory",
),

Dependencies := rec(
  GAP := ">= 4.13.0",
  NeededOtherPackages := [
                   [ "homalg", ">= 2013.09.03" ],
                   [ "Modules", ">= 2015.01.13" ],
                   [ "RingsForHomalg", ">= 2013.08.22" ],
                   [ "GaussForHomalg", ">= 2013.06.26" ],
                   [ "MatricesForHomalg", ">= 2013.10.27" ],
                   [ "ctblocks", ">= 0.9.1" ],
                   [ "LAGUNA", ">= 3.6.3" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

Keywords := [ "block", "defect group" ],

TestFile := "tst/testall.g",

));
