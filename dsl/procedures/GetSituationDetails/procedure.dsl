procedure 'Get Situation Details', description: 'A GET request that returns the details of a specified Situation', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get Situation Details',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get Situation Details');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
