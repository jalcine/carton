use strict;
use Test::More;
use xt::CLI;
use Cwd;

my $cwd = Cwd::cwd();

{
    my $app = cli();

    $app->run("config", "cpanm.mirror", "$cwd/xt/mirror");
    $app->run("config", "cpanm.mirror");
    $app->run("install", "Hash::MultiValue");

    $app->run("list");
    is $app->output, "Hash-MultiValue-0.08\n";
}

done_testing;



