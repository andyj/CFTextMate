<cfsetting enablecfoutputonly="Yes">
<!--- @@Copyright: Copyright (c) ${TM_YEAR} ${TM_ORGANIZATION_NAME}. All rights reserved. --->
<!--- @@License: --->

<cfif thistag.executionMode eq "Start">
	
</cfif>

<cfif thistag.executionmode eq "End">
	<cfexit method="exittag" />
</cfif>

<cfsetting enablecfoutputonly="No">