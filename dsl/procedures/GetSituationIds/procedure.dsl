procedure 'Get Situation Ids', description: 'A GET request that that returns the total number of Situations, and a list of their Situation IDs for a specified situation filter and a limit', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get Situation Ids',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get Situation Ids');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
