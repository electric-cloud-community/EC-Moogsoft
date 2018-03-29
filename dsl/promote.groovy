import groovy.transform.BaseScript
import com.electriccloud.commander.dsl.util.BasePlugin

//noinspection GroovyUnusedAssignment
@BaseScript BasePlugin baseScript

// Variables available for use in DSL code
def pluginName = args.pluginName
def upgradeAction = args.upgradeAction
def otherPluginName = args.otherPluginName

def pluginKey = getProject("/plugins/$pluginName/project").pluginKey
def pluginDir = getProperty("/projects/$pluginName/pluginDir").value

//List of procedure steps to which the plugin configuration credentials need to be attached
// ** steps with attached credentials
def stepsWithAttachedCredentials = [
  [procedureName: 'Get Active Situation Ids', stepName: 'Get Active Situation Ids'],
  [procedureName: 'Get Alert Details', stepName: 'Get Alert Details'],
  [procedureName: 'Get Alert Ids', stepName: 'Get Alert Ids'],
  [procedureName: 'Get Situation Alert Ids', stepName: 'Get Situation Alert Ids'],
  [procedureName: 'Get Situation Description', stepName: 'Get Situation Description'],
  [procedureName: 'Get Situation Details', stepName: 'Get Situation Details'],
  [procedureName: 'Get Situation Hosts', stepName: 'Get Situation Hosts'],
  [procedureName: 'Get Situation Ids', stepName: 'Get Situation Ids'],
  [procedureName: 'Get System Status', stepName: 'Get System Status'],
  [procedureName: 'Get System Summary', stepName: 'Get System Summary']
]
// ** end steps with attached credentials

project pluginName, {

	loadPluginProperties(pluginDir, pluginName)
	loadProcedures(pluginDir, pluginKey, pluginName, stepsWithAttachedCredentials)
	//plugin configuration metadata
	property 'ec_config', {
		form = '$[' + "/projects/${pluginName}/procedures/CreateConfiguration/ec_parameterForm]"
		property 'fields', {
			property 'desc', {
				property 'label', value: 'Description'
				property 'order', value: '1'
			}
		}
	}

}

// Copy existing plugin configurations from the previous
// version to this version. At the same time, also attach
// the credentials to the required plugin procedure steps.
upgrade(upgradeAction, pluginName, otherPluginName, stepsWithAttachedCredentials)
