procedure 'Get Alert Details', description: 'A GET request that returns details (such as Description, Severity, etc.) of a specified Alert', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get Alert Details',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get Alert Details');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
