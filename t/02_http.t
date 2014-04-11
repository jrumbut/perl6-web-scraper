#!/usr/bin/env perl6

use Web::Scraper;
use Test;
my $scraper = scraper {
  process 't', 'tarray[]' => {
    name => 'TEXT',
    id   => '@id'
  };
}
plan 0;
#$scraper.scrape('http://www.w3schools.com/html/html_intro.asp');

#$scraper.d.say;
qw{{
plan 20;
for 0 .. 3 -> $e {
  ok $scraper.d<tarray>[$e]<name> eq "test{1+$e}", 'tarray hash equality';
  ok $scraper.d<tarray>[$e]<id> eq "{1+$e}", 'tarray hash equality';
  ok $scraper.d<ttext>[$e] eq "test{1+$e}", 'ttext array equality';
}

for 0 .. 1 -> $e {
  ok $scraper.d<e>[$e] eq "etest$e", 'text from subroutine equality';
}

my $c = 0;
for @($scraper.d<nested>) -> $e {
  ok $e<id> eq "{$c == 0 ?? '1' !! '2'}", 'nested scrapers';
  ok $e<val> eq "{$c == 0 ?? '50' !! '30'}", 'nested scrapers';
  ok $e<svals>.join("\t") eq "{$c == 0 ?? [1,2,3,43].join("\t") !! [2,3,5,47].join("\t") }", 'nested scrapers';
  $c++;
}
}}
