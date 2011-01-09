
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Puts the context\'s current user into your Catalyst::Model::DBIC::Schema schema.',
  'AUTHOR' => 'Amiri Barksdale <amiri@arisdottle.net>',
  'BUILD_REQUIRES' => {
    'Catalyst::Component' => '0',
    'Catalyst::Model::DBIC::Schema' => '0',
    'DBIx::Class::Schema' => '0',
    'Moose' => '0',
    'Scalar::Util' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0',
    'namespace::autoclean' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Catalyst-TraitFor-Model-DBIC-Schema-WithCurrentUser',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Catalyst::TraitFor::Model::DBIC::Schema::WithCurrentUser',
  'PREREQ_PM' => {
    'Catalyst::Component::InstancePerContext' => '0',
    'Moose::Role' => '0'
  },
  'VERSION' => '0.02',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



