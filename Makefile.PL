use ExtUtils::MakeMaker;

WriteMakefile (
    'AUTHOR' => 'Julius C. Duque',
    'ABSTRACT' => 'A perpetual calendar',
    'NAME' => 'PerpCal',
    'VERSION_FROM' => 'PerpCal.pm',
    'LIBS' => [''],
    'DEFINE' => '',
    'INC' => '',
    'dist' => {'COMPRESS' => 'gzip -9f', 'SUFFIX' => 'gz'}
);

