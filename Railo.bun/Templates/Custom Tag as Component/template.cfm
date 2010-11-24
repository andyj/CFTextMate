<!--- @@Copyright: Copyright (c) ${TM_YEAR} ${TM_ORGANIZATION_NAME}. All rights reserved. --->
<!--- @@License: --->
<cfcomponent name="MyCustomTag">

<!--- Meta data --->
<!---
<cfset this.metadata.attributetype="fixed">
   <cfset this.metadata.attributes={
 name:    {required:false,type:"string",default:"MyCustomTag"},
 onLoad :    {required:false,type:"string",default:""},
 onNotFound :   {required:false,type:"string",default:""},
 onError :    {required:false,type:"string",default:""}
}>
     --->

	<!---
		This function is called when the Tag is initialized. 
		The argument "parent" contains (if present) the parent CFC based component.
		The argument "hasEndTag" defines whether the tag has an end tag or not.
	--->
	<cffunction name="init" output="no" returntype="void" hint="invoked after tag is constructed">
		<cfargument name="hasEndTag" type="boolean" required="yes">
		<cfargument name="parent" type="component" required="no" hint="the parent cfc custom tag, if there is one">
	</cffunction> 

	<!---
		This function is called before the body is executed. 
		The argument "attributes" holds the attributes defined in the start tag.
		The argument "caller" represents the callers variables scope. 
		With the help of the return value you can define whether the body will be executed or not.
	--->
	<cffunction name="onStartTag" output="yes" returntype="boolean">
		<cfargument name="attributes" type="struct">
		<cfargument name="caller" type="struct">    

		<cfreturn variables.hasEndTag />   
	</cffunction>


	<!---
		This function is called after the body is executed.
		The argument "attributes" holds the attributes defined in the start tag.
		The argument "caller" represents the callers variables scope.
		This argument "generatedContent" contains the content generated between start and end tag, it is up to this function to define what will happen to the generatedContent.
		The boolean return value helps you can define if the body should be re executed again or not.
	--->
	<cffunction name="onEndTag" output="yes" returntype="boolean">
		<cfargument name="attributes" type="struct">
		<cfargument name="caller" type="struct">    
		<cfargument name="generatedContent" type="string">

		<cfreturn false/> 
	</cffunction>

	<!---  
		This function is called when an exception is thrown inside start/end tag or the component body.
		The argument "cfcatch" holds the information about the exception.
		The argument "source" defines where the exception was thrown (start, end, body).
		The boolean return value helps you define whether the exception will be rethrown or not.
	--->
	<cffunction name="onError" access="public" output="false" returntype="array">
		<cfargument name="cfcatch" type="struct">
		<cfargument name="source" type="string">    
	</cffunction>
	
	
	<!---
		This function will be called after the tag has been executed (if this function is present).
		This function will be called  whether an uncaught excpetion is thrown before or not
	--->
	<cffunction name="onFinally" access="public" output="false" returntype="void">
		
	</cffunction>
	

</cfcomponent>
