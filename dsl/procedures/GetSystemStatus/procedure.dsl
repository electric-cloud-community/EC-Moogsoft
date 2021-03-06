procedure 'Get System Status', description: 'Performs a GET request that returns current system status information for all processes', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get System Status',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get System Status');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
