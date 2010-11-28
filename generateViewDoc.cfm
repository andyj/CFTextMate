<cfscript>	
	raw = FileRead("Resources/railo3.2.xml");
	xml = XMLParse(raw);
//	xslt = FileRead("railo_dictToAPI.xsl");
	trans = XMLTransform(xml,"railo_dictToAPI.xsl");
	WriteOutput(trans);
</cfscript>