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
	<cffunction name="init" output="no" returntype="void" hint="invoked after tag is constructed">
		<cfargument name="hasEndTag" type="boolean" required="yes">
		<cfargument name="parent" type="component" required="no" hint="the parent cfc custom tag, if there is one">
	</cffunction> 

	<cffunction name="onStartTag" output="yes" returntype="boolean">
		<cfargument name="attributes" type="struct">
		<cfargument name="caller" type="struct">    

		<cfreturn variables.hasEndTag />   
	</cffunction>

	<cffunction name="onEndTag" output="yes" returntype="boolean">
		<cfargument name="attributes" type="struct">
		<cfargument name="caller" type="struct">    
		<cfargument name="generatedContent" type="string">

		<cfreturn false/> 
	</cffunction>

	<!---  children   --->
	<cffunction name="onError" access="public" output="false" returntype="array">
		<cfargument name="cfcatch" type="struct">
		<cfargument name="source" type="string">    
	</cffunction>

</cfcomponent>
