procedure 'Get Situation Hosts', description: 'A GET request that returns a list of host names for a specified Situation, either for all the Alerts in the Situation or just for the unique Alerts.Hosts are the names (defined in the alerts.source field in the database) for the sources of Events', { // [PROCEDURE]
    // [REST Plugin Wizard step]

    step 'Get Situation Hosts',
        command: """
\$[/myProject/scripts/preamble]
use EC::RESTPlugin;
EC::RESTPlugin->new->run_step('Get Situation Hosts');
""",
        errorHandling: 'failProcedure',
        exclusiveMode: 'none',
        releaseMode: 'none',
        shell: 'ec-perl',
        timeLimitUnits: 'minutes'
    
    // [REST Plugin Wizard step ends]

}
