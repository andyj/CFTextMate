/**
 * accessors "yes|no"
 * alias "ActionScript 3 type alias"
 * bindingname "binding element name"
 * displayname "string"
 * extends "component name"
 * hint "string"
 * implements "ColdFusion interface"
 * namespace "default service namespace"
 * output "no value|no|yes"
 * porttypename "port type element name"
 * Serializable "yes|no"
 * serviceaddress "service URL"
 * serviceportname "port element name"
 * style "rpc|document"
 * wsdlfile path
*/
component {

	/* application variables
	this.name = "Application Name";
	this.applicationtimeout = createTimeSpan(0,2,0,0);
	this.sessionmanagement = true;
	this.sessiontimeout = createTimeSpan(0,1,0,0);
	this.clientstorage = "cookie|registry|dsn";
	this.clientmanagement = true;
	this.datasource = "mydsn";
	this.googleMapKey = "GOOGLE_MAPS_API_KEY";
	this.loginstorage = "cookie|session";
	this.serverSideFormValidation = "yes|no";
	this.setclientcookies = "yes|no";
	this.setdomaincookies = "yes|no";
	this.scriptprotect = "all|none";
	this.welcomefilelist = "";
	this.smtpserversettings = {server="",username="",password=""};
	this.timeout = "60";
	this.debuggingipaddress = "127.0.0.1";
	this.enablerobustexception  = "yes|no";
	this.securejson = true;
	this.securejsonprefix = "//";
	this.mappings["/mapping_name"] = getDirectoryFromPath(getCurrentTemplatePath());
	this.customtagpaths = "tags";
	*/
	
	/* orm settings
	this.ormEnabled = true;
	this.ormsettings = {
		autoGenMap=true,
		cacheConfig="Ehcache|JBossCache|Hashtable|SwarmCache|OSCache",
		catalog="",
		cfclocation="",
		datasource="",
		dbcreate="update|dropcreate|none",
		dialect="",
		eventhandling=false,
		flushAtRequestEnd=true,
		logsql=false,
		ormconfig="",
		savemapping=false,
		schema="",
		secondaryCacheEnabled=false,
		sqlscript="",
		useDbForMapping=true
	};
	*/
	
	// methods

	/**
	 * @hint The application first starts: the first request for a page is processed or the first CFC method is invoked by an event gateway instance, or a web services or Flash Remoting CFC.
	 */
	public boolean function onApplicationStart(){
		return true;
	}

	/**
	 * @hint The application ends: the application times out, or the server is stopped
	 */
	public void function onApplicationEnd(ApplicationScope){

	}

	/**
	 * @hint The onRequestStart method finishes. (This method can filter request contents.)
	 */
	public void function onRequest(String targetPage){
		include arguments.targetPage;
	}

	/**
	 * @hint A request starts
	 */
	public boolean function onRequestStart(String targetPage){

		return true;
	}

	/**
	 * @hint All pages in the request have been processed:
	 */
	public void function onRequestEnd(String targetPage){

	}

	/**
	 * @hint A session starts
	 */
	public void function onSessionStart(){

	}

	/**
	 * @hint A session ends
	 */
	public void function onSessionEnd(SessionScope,ApplicationScope){

	}

	/**
	 * @hint ColdFusion received a request for a non-existent page.
	 */
	public boolean function onMissingTemplate(String targetPage) {

		return true;
	}

	/**
	 * @hint An exception that is not caught by a try/catch block occurs.
	 */
	public void function onError(Exception,EventName) {

	}

	/**
	 * @hint Handles missing method exceptions
	 */
	public void function onMissingMethod(String method,Struct args) {

	}

	/**
	 * @hint HTTP or AMF calls are made to an application.
	 */
	public void function onCFCRequest(String cfcname,String method,Struct args){

	}
}