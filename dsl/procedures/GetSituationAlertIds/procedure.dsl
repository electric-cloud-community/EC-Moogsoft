procedure 'Get Situation Alert Ids', description: 'A GET request that returns the total number of Alerts, and a list of their Alert IDs for a specified Situation. This can be either all Alerts or just those Alerts unique to the Situation', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get Situation Alert Ids',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get Situation Alert Ids');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
