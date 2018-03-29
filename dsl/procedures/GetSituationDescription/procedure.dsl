procedure 'Get Situation Description', description: 'A GET request that returns the description for a specified Situation', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get Situation Description',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get Situation Description');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
