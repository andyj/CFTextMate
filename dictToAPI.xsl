<?xml version="1.0" encoding="UTF-8" ?>
<!-- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au -->
<!-- @@License:
    This file is part of FarCry.

    FarCry is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FarCry.  If not, see <http://www.gnu.org/licenses/>.

	On Mac you can run this by typing the following at the Terminal:
	 $ xsltproc api.xsl farcry51.xml > farcry5-1-doc.html
	After an apt-get (or what have you) you can do that on Linux as well.
	As for windows, you'll need to grab your favorite XSLT transforming
	application. You can do it in an ant build script as well.
	
-->
<!-- @@displayname: api.xsl -->
<!-- @@description: Turns a cfeclipse dictionary into a simple web page-->
<!-- @@author: Rob Rohan (rob@daemon.com.au) -->

<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:d="http://www.cfeclipse.org/version1/dictionary"
>
	<xsl:output encoding="UTF-8" indent="yes" method="html" />

	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="style.css" />
			</head>
			<body>
				<xsl:call-template name="makeTOC"/>
				
				<xsl:apply-templates select="/d:dictionary/d:tags" />
				<xsl:apply-templates select="/d:dictionary/d:functions" />
				<xsl:apply-templates select="/d:dictionary/d:scopes" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="makeTOC">
		<h1>Available Tags and Functions</h1>
		<div class="tocWrapper">
			<h2>Tags</h2>
			<div class="tagTOCWrapper">
				<xsl:for-each select="//d:tag">
					<xsl:sort select="@name" data-type="text" 
						order="ascending" case-order="lower-first"/>
					<a href="#{@name}"><xsl:value-of select="@name" /></a> &#160;
				</xsl:for-each>
			</div>
			
			<h2>Functions</h2>
			<div class="functionTOCWrapper">
				<xsl:for-each select="//d:function">
					<xsl:sort select="@name" data-type="text" 
						order="ascending" case-order="lower-first"/>
					<a href="#{@name}"><xsl:value-of select="@name" /></a> &#160;
				</xsl:for-each>
			</div>
		</div>
		
	</xsl:template>
	
	<xsl:template match="d:tags">
		<h1>Tags</h1>
		<xsl:apply-templates select="d:tag" />
	</xsl:template>
	
	<xsl:template match="d:functions">
		<h1>Functions</h1>
		<xsl:apply-templates select="d:function" />
	</xsl:template>
	
	<xsl:template match="d:scopes">
		<h1>Scopes</h1>
		<xsl:apply-templates select="d:scope" />
	</xsl:template>
	
	<xsl:template match="d:tag">
		<a name="{@name}"></a>
		<div class="tag">
			<div class="tagName"><xsl:value-of select="@name" /></div>
			<div class="tagHelp"><xsl:value-of select="d:help" /></div>
			
			<div class="paramWrapper">
				<xsl:apply-templates select="d:parameter" />
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="d:function">
		<a name="{@name}"></a>
		<div class="function">
			<div class="functionName"><xsl:value-of select="@name" /></div>
			<div class="functionHelp"><xsl:value-of select="d:help" /></div>
			
			<div class="paramWrapper">
				<xsl:apply-templates select="d:parameter" />
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="d:parameter">
		<div class="param">
			<div class="paramName"><xsl:value-of select="@name" /></div>
			<div class="paramType"><xsl:value-of select="@type" /></div>
			<div class="paramRequired"><xsl:value-of select="@required" /></div>
			<div class="paramHelp"><xsl:value-of select="d:help" /></div>
		</div>
	</xsl:template>
	
	<xsl:template match="d:scope">
		<div class="scope">
			<xsl:value-of select="@value" />
		</div>
	</xsl:template>
	
	<xsl:template match="text()" />
	
</xsl:stylesheet>
