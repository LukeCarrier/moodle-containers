<?php // Moodle configuration file

// Boilerplate
unset($CFG);
global $CFG;
$CFG = new stdClass();

// Database server
    // MySQL
    //$CFG->dbtype    = 'mysqli';
    //$CFG->dblibrary = 'native';
    //$CFG->dbhost    = '192.168.120.155';
    //$CFG->dbname    = 'moodle';
    //$CFG->dbuser    = 'moodle';
    //$CFG->dbpass    = 'Password123';
    //$CFG->prefix    = 'mdl_';
    //$CFG->dboptions = array (
    //    'dbpersist' => 0,
    //    'dbport'    => 3306,
    //    'dbsocket'  => '',
    //);

    // PostgreSQL
    //$CFG->dbtype    = 'pgsql';
    //$CFG->dblibrary = 'native';
    //$CFG->dbhost    = '192.168.120.150';
    //$CFG->dbname    = 'vagrant';
    //$CFG->dbuser    = 'vagrant';
    //$CFG->dbpass    = 'gibberish';
    //$CFG->prefix    = 'mdl_';
    //$CFG->dboptions = array (
    //    'dbpersist' => 0,
    //    'dbport'    => 5432,
    //    'dbsocket'  => '',
    //);

    // SQL Server
    $CFG->dbtype    = 'sqlsrv';
    $CFG->dblibrary = 'native';
    $CFG->dbhost    = 'tcp:database,1433';
    $CFG->dbname    = 'moodle';
    $CFG->dbuser    = 'moodle';
    $CFG->dbpass    = 'P4$$word';
    $CFG->prefix    = 'mdl_';
    $CFG->dboptions = array(
        'dbpersist' => 0,
        'dbsocket'  => '',
    );

// Base URLs
$_SERVER['SERVER_PORT'] = 8080; // Prevent a redirect loop caused by the Docker proxying
$CFG->wwwroot = 'http://localhost:8080';
$CFG->admin   = 'admin';

// Data directory
$CFG->dataroot             = '/data/base';
$CFG->directorypermissions = 0770;

// Send mails via MailCatcher on mail-debug
$CFG->smtphosts = '192.168.120.200:1025';

// Enable debugging
//$CFG->debug        = E_ALL;
//$CFG->debugdisplay = true;

// Common developer options
//$CFG->debugstringids = true;
//$CFG->langstringcache = false;
//$CFG->cachejs = false;
//$CFG->themedesignermode = true;

// Behat testing environment
$CFG->behat_prefix        = 'b_';
$CFG->behat_dataroot      = '/data/behat';
$CFG->behat_faildump_path = '/data/behat-faildump';
$CFG->behat_wwwroot       = 'http://localhost:8080/behat';
$CFG->behat_profiles = array(
    'chrome' => array(
        'extensions' => array(
            'Behat\MinkExtension' => array(
                'selenium2' => array(
                    'browser' => 'chrome',
                    'capabilities' => array(
                        'browser' => 'chrome',
                        'browserName' => 'chrome',
                    ),
                ),
            ),
        ),
    ),
    'firefox' => array(
        'extensions' => array(
            'Behat\MinkExtension' => array(
                'selenium2' => array(
                    'browser' => 'firefox',
                    'capabilities' => array(
                        'browser' => 'firefox',
                        'browserName' => 'firefox',
                    ),
                ),
            ),
        ),
    ),
    'iexplore' => array(
        'extensions' => array(
            'Behat\MinkExtension' => array(
                'selenium2' => array(
                    'browser' => 'iexplore',
                    'capabilities' => array(
                        'browser' => 'iexplore',
                        'browserName' => 'iexplore',
                    ),
                ),
            ),
        ),
    ),
);
$CFG->behat_config = array_merge(array(
    'default' => array(
        'extensions' => array(
            'Behat\MinkExtension' => array(
                'selenium2' => array(
                    'wd_host' => 'http://selenium-hub:4444/wd/hub',
                    'capabilities' => array(
                        'deviceType'        => 'ANY',
                        'name'              => 'ANY',
                        'deviceOrientation' => 'ANY',
                        'ignoreZoomSetting' => 'ANY',
                        'platform'          => 'ANY',
                    ),
                ),
            ),
        ),
    ),
), $CFG->behat_profiles);

// PHPUnit testing environment
$CFG->phpunit_prefix   = 'phpu_';
$CFG->phpunit_dataroot = '/data/phpunit';

// Bootstrap Moodle
require_once __DIR__ . '/lib/setup.php';
