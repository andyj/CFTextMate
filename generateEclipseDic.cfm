<!DOCTYPE html>
<cfsetting showdebugoutput="false" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Generate Railo's CFEclipse Dictionary</title>
	<meta name="author" content="Mark Drew">
</head>
<body>
	<h1 id="generate_cfeclipse_dictionary">Generate CFEclipse Dictionary</h1>
	<p>This file generates the current Railo Version's CFEclipse Dictionary</p>
	<form action="" method="post" accept-charset="utf-8">
		<p><input type="submit" name="btnContinue" value="Continue &rarr;"></p>
	</form>
	
	<cfif ListLen(StructKeyList(FORM))>
		<cfscript>
			aTags = getTagList();
			StructDelete(aTags.cf, "_");
			StructDelete(aTags.cf, "x_");
			aFuncs = getFunctionList();
		</cfscript>
		

		
		
<cfxml variable="dict">
<cfoutput>
<dictionary xmlns="http://www.cfeclipse.org/version1/dictionary" >			
	<tags> <cfloop collection="#aTags.cf#" item="t"> <cfset tagData = getTagData("cf", t)>
				<tag name="cf#t#">
					<help><![CDATA[#tagData.description#]]></help>
					<cfloop collection="#tagData.attributes#" item="a">
						<parameter name="#a#">
							<help><![CDATA[#tagData.attributes[a].description#]]></help>
							<values/>
						</parameter>						
					</cfloop>
				</tag>
		</cfloop>
	</tags>
	<functions><cfloop collection="#aFuncs#" item="f"><cfif !f.startsWith("_")><cfset funcData = getFunctionData(f)>
			<function name="#f#"></function></cfif>
</cfloop>	</functions>
	
	<cfset WriteOutput(FileRead("Resources/railo_scopes.xml"))>
</dictionary>			
</cfoutput>
</cfxml>
		<cfscript>
			FileWrite("Resources/railo3.2.xml", toString(dict));
		</cfscript>
	</cfif>
</body>
</html>
