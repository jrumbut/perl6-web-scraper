#!/usr/bin/env perl6

use Web::Scraper;
use Test;
my $scraper = scraper {
  process 'a', 'tarray[]' => {
    href => sub ($e) {
      #say $e.attribs;
      return $e.attribs<href> if $e.attribs<href>.defined && $e.attribs<href> !~~ Nil;
      #'return Any'.say;
      return Any;
    },
    meta => 'TEXT',
  };
}

$scraper.scrape('http://perlcabal.org/syn/S05.html');

$scraper.d<tarray>[0].say;
#for $scraper.d<tarray> -> $t {
#  $t<href>.say;
#}

#$scraper.d.say;

plan 1;

ok $scraper.d<tarray>[0]<href> eq "https://github.com/perl6/specs/", "tarray contains correct link";
