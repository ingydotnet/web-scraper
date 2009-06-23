use TestML -run, -bridge => 'main';
use base 'TestML::Bridge';

use Web::Scraper;

sub scrape {
    my $self = shift;
    my $html = shift;
    my $s = scraper {
        process $self->value, text => 'TEXT';
        result 'text';
    };
    return $s->scrape($html->value);
}

# use strict;
# use Test::Base;
# 
# use Web::Scraper;
# plan tests => 1 * blocks;
# 
# filters {
#     selector => 'chomp',
#     expected => 'chomp',
# };
# 
# run {
#     my $block = shift;
#     my $s = scraper {
#         process $block->selector, text => 'TEXT';
#         result 'text';
#     };
#     my $text = $s->scrape($block->html);
#     is $text, $block->expected, $block->name;
# };

__DATA__
%TestML: 1.0

$selector.scrape($html) == $expected.Chomp();

===
--- html
<div id="foo">bar</div>
--- selector
div#foo
--- expected
bar

===
--- html
<span><a href="foo">baz</a></span>
--- selector
span a[href]
--- expected
baz

===
--- html
<span><a href="foo">baz</a></span>
--- selector
//span/a
--- expected
baz
