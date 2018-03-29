procedure 'Get Alert Ids', description: 'A GET request that returns the total number of Alerts, and a list of their Alert IDs for a specified Alert filter and a limit', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get Alert Ids',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get Alert Ids');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
