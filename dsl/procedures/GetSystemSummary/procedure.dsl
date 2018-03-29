procedure 'Get System Summary', description: 'A GET request that returns a summary of current Alerts and Situations in Moogsoft AIOps', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get System Summary',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get System Summary');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
