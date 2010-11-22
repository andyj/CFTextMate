<?xml version="1.0" encoding="UTF-8" ?>
<!--
	dictToBundle
	Created by Rob Rohan on 2008-11-22.
	Copyright (c) 2008-2009 Rob Rohan. All rights reserved.
	
	The default output from this process is the info.plist file.  However, this also
	generates the files for the tag completion and for the default snippets.
	The snippets wind up in the Snippets directory and the tag and attribute lists wind
	up in the Preferences folder.
-->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:dic="http://www.cfeclipse.org/version1/dictionary"
	xmlns:util="java:java.util.UUID"
	version="2.0"
	exclude-result-prefixes="xsl dic util">
	
	<xsl:output method="xml" indent="yes" />
	<xsl:output method="xml" indent="yes" name="plistxml" 
		exclude-result-prefixes="xsl dic util" />
	
	<!-- <xsl:param name="bundle-dir" select="'ColdFusion.bun'" /> -->
	<xsl:param name="bundle-uuid" select="'1A09BE0B-E81A-4CB7-AF69-AFC845162D1F'" />
	<xsl:param name="bundle-name" select="'ColdFusion'" />
	
	<xsl:param name="syntax-uuid" select="''" />
	<xsl:param name="cmddoc-uuid" select="''" />
	<xsl:param name="tagcomplete-uuid" select="''" />
	<xsl:param name="attcomplete-uuid" select="''" />
	
	<xsl:variable name="NL">
		<xsl:text>
</xsl:text>
	</xsl:variable>
	<xsl:variable name="TAB">
		<xsl:text>	</xsl:text>
	</xsl:variable>
	
	<!-- writes out the plist, and kicks off the snippet writting -->
	<xsl:template match="/">
		<plist version="1.0">
		<dict>
			<key>contactEmailRot13</key>
			<string>ebo@qnrzba.pbz.nh</string>

			<key>contactName</key>
			<string>Rob Rohan</string>

			<key>description</key>
			<string>Support for the CFML web development environment.</string>

			<key>mainMenu</key>
			<dict>
				<key>items</key>
				<array>
					<string>C8F9D7A6-D447-4C16-B566-BE46335B1067</string>
					<string>1202B1E1-6A18-4C9E-AB30-70A0E046CDB7</string>
					<string>------------------------------------</string>
					<string>59075941-A690-46FC-BFA6-58B81E1B18B0</string>
					<string>0CA09D51-8DE8-48A0-A178-02D7D8285802</string>
					<string>1519328F-1308-4DC8-9E71-2B7473F9080F</string>
					<string>------------------------------------</string>
					<string>54C16A2E-3B74-41AC-BEB1-352F9E42B7EE</string>
					<string>FFDC5F11-5575-4C8C-9CAC-4DFC1163CFEA</string>
					<string>0DEA11CD-931E-4087-984A-784A2D825EF2</string>
					<string>7EC225A6-93C8-4A2E-906A-3ADA1FD3C172</string>
					<string>8D2B412E-56DF-4728-AB74-C1C674277E22</string>
					<string><xsl:value-of select="$cmddoc-uuid" /></string>
					<string><xsl:value-of select="$tagcomplete-uuid" /></string>
					<string><xsl:value-of select="$attcomplete-uuid" /></string>
					<!-- Now that we have written out the plist file and the snippets -->
					<!-- fire off the bit that does the tag and attribute completion  -->
					<xsl:call-template name="write-tag-completion-list" />
					<xsl:call-template name="write-attribute-completion-list" />
				</array>
				
				<key>submenus</key>
				<dict>
					<key>1202B1E1-6A18-4C9E-AB30-70A0E046CDB7</key>
					<dict>
						<key>items</key>
						<array>
							<xsl:comment>FUNCTIONS</xsl:comment><xsl:value-of select="$NL" />
							<xsl:apply-templates select="/dic:dictionary/dic:functions/dic:function" />
						</array>
						<key>name</key>
						<string>ColdFusion Functions</string>
					</dict>
					<key>C8F9D7A6-D447-4C16-B566-BE46335B1067</key>
					<dict>
						<key>items</key>
						<array>
							<xsl:comment>TAGS</xsl:comment><xsl:value-of select="$NL" />
							<xsl:apply-templates select="/dic:dictionary/dic:tags/dic:tag" />
						</array>
						<key>name</key>
						<string>ColdFusion Tags</string>
					</dict>
				</dict>
			</dict>
			
			<key>name</key>
			<string><xsl:value-of select="$bundle-name" /></string>
			
			<key>ordering</key>
			<array>
				<!-- <string>00D00AD7-3C05-46E0-B8B9-0F5CCAC04F57</string>
				<string>904C79F1-5730-4D8D-986A-0D71587B2C1F</string> -->
			</array>

			<key>uuid</key>
			<string><xsl:value-of select="$bundle-uuid" /></string>
		</dict>
		</plist>
	</xsl:template>
	
	<!-- Formats the functions. Writes the plist too. -->
	<xsl:template match="dic:function">
		<xsl:variable name="filename" select="translate(@name,':','-')" />
		
		<xsl:variable name="uid" select="util:randomUUID()"/>
		<string><xsl:value-of select="util:toString($uid)"/></string>
		<xsl:value-of select="$NL" />
		
		<!-- {$bundle-dir}/ -->
		<xsl:result-document 
			href="Snippets/gen-{$filename}.tmSnippet" format="plistxml">
			<plist version="1.0">
			<dict>
				<key>content</key>
				<string><xsl:value-of select="@name" />
					<xsl:text>(${1:</xsl:text>
					<xsl:for-each select="./dic:parameter">
						<xsl:call-template name="param-with-placement">
							<xsl:with-param name="placement" select="position()+1" />
							<xsl:with-param name="separator" select="''" />
							<xsl:with-param name="preparator" select="', '" />
							<xsl:with-param name="use-equals" select="'false'" />
							<xsl:with-param name="total-param-count" select="count(../dic:parameter)" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:text>})</xsl:text></string>
				
				<key>name</key>
				<string><xsl:value-of select="@name"/></string>
				
				<key>scope</key>
				<string>text.html.cfm</string>
				
				<key>tabTrigger</key>
				<string><xsl:value-of select="@name"/></string>
				
				<key>uuid</key>
				<string><xsl:value-of select="util:toString($uid)"/></string>
			</dict>
			</plist>
		</xsl:result-document>
	</xsl:template>
	
	<!-- Formats the tags. Writes out the plist file too -->
	<xsl:template match="dic:tag">
		<xsl:variable name="filename" select="translate(@name,':','-')" /> 
		
		<xsl:variable name="uid" select="util:randomUUID()"/>
		<string><xsl:value-of select="util:toString($uid)"/></string>
		<xsl:value-of select="$NL" />
		
		<!-- {$bundle-dir}/ -->
		<xsl:result-document 
			href="Snippets/gen-{$filename}.tmSnippet" format="plistxml">
			<plist version="1.0">
			<dict>
				<key>content</key>
				<string><xsl:text>&lt;</xsl:text>
				<xsl:value-of select="@name" />
				<xsl:text> ${1:</xsl:text>
				<xsl:for-each select="./dic:parameter">
					<xsl:call-template name="param-with-placement">
						<xsl:with-param name="placement" select="position()+position()" />
						<xsl:with-param name="separator" select="' '" />
						<xsl:with-param name="preparator" select="''" />
						<xsl:with-param name="use-equals" select="'true'" />
						<xsl:with-param name="total-param-count" select="count(../dic:parameter)" />
						<!-- <xsl:with-param name="element" select="." /> -->
					</xsl:call-template>
				</xsl:for-each>
				<xsl:text>}</xsl:text>

				<xsl:choose>
					<xsl:when test="@single = 'true'">
						<xsl:text> /&gt;$0</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>&gt;</xsl:text>
						<xsl:value-of select="$NL" />
						<xsl:value-of select="$TAB" />
						<xsl:text>$0</xsl:text>
						<xsl:value-of select="$NL" />
						<xsl:text>&lt;/</xsl:text>
						<xsl:value-of select="@name" />
						<xsl:text>&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose></string>
				
				<key>name</key>
				<string><xsl:value-of select="@name"/></string>
				
				<key>scope</key>
				<string>text.html.cfm</string>
				
				<key>tabTrigger</key>
				<string>
					<xsl:choose>
						<xsl:when test="contains(@name,':')">
							<xsl:value-of select="substring-before(@name,':')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@name" />
						</xsl:otherwise>
					</xsl:choose>
				</string>
				
				<key>uuid</key>
				<string><xsl:value-of select="util:toString($uid)"/></string>
			</dict>
			</plist>
		</xsl:result-document>
	</xsl:template>
	
	<!-- handles doing the tag and function params. Takes 3 params.
		placement = where to start the textmate $N variables from
		separator = what to tack on to the end of each paramenter
		total-param-count = total number of params, so we don't add the
		separator to the last item.
	-->
	<xsl:template name="param-with-placement">
		<xsl:param name="placement" />
		<xsl:param name="separator" />
		<xsl:param name="preparator" />
		<xsl:param name="use-equals" />
		<xsl:param name="total-param-count" />
		
		<xsl:choose>
			<xsl:when test="$use-equals = 'true'">
				<xsl:text>$</xsl:text>
				<xsl:text>{</xsl:text>
				<xsl:value-of select="$placement" />
				<xsl:text>:</xsl:text>

				<xsl:value-of select="$preparator" />
				
				<xsl:value-of select="@name" /><xsl:text>="$</xsl:text>
				<xsl:value-of select="$placement+1" />
				<xsl:text>"</xsl:text>
				<xsl:if test="position() != $total-param-count">
					<xsl:value-of select="$separator" />
				</xsl:if>
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@required = 'true'">
					<xsl:if test="position() != 1">
						<xsl:value-of select="$preparator" />
					</xsl:if>
					
					<xsl:if test="@type = 'String'">
						<xsl:text>"</xsl:text>
					</xsl:if>
				</xsl:if>
				
				<xsl:text>${</xsl:text>
				<xsl:value-of select="$placement" />
				<xsl:text>:</xsl:text>
				
				<xsl:if test="@required = 'false'">
					<xsl:if test="position() != 1">
						<xsl:value-of select="$preparator" />
					</xsl:if>
				</xsl:if>
				<xsl:if test="@required = 'false'"><xsl:text>[</xsl:text></xsl:if>
				<xsl:value-of select="@name" />
				<xsl:if test="@required = 'false'"><xsl:text>]</xsl:text></xsl:if>
				
				<xsl:text>}</xsl:text>
				
				<xsl:if test="@required = 'true'">
					<xsl:if test="@type = 'String'">
						<xsl:text>"</xsl:text>
					</xsl:if>
				</xsl:if>
				
			</xsl:otherwise>
		</xsl:choose>
		
		
	</xsl:template>
	
	<!-- make a list of tags in the format textmate expects for code completion -->
	<xsl:template name="write-tag-completion-list">
		<xsl:variable name="uid" select="util:randomUUID()"/>
		<string><xsl:value-of select="util:toString($uid)"/></string>
		
		<xsl:result-document 
			href="Preferences/Completion%20Tags.tmPreferences" format="plistxml">
			<plist version="1.0">
			<dict>
				<key>name</key>
				<string>Completions Tags</string>
				
				<key>scope</key>
				<!-- text.html.cfm, invalid.illegal.incomplete.html -->
				<string>text.html -(meta.tag | source), invalid.illegal.incomplete.html -source</string>
				
				<key>settings</key>
				<dict>
					<key>shellVariables</key>
					<array>
						<dict>
							<key>name</key>
							<string>TM_COMPLETION_split</string>
							<key>value</key>
							<string>,</string>
						</dict>

						<dict>
							<key>name</key>
							<string>TM_COMPLETIONS</string>
							<key>value</key>
							<string>
								<xsl:for-each select="//dic:tag">
									<xsl:value-of select="replace(./@name,'^cf','')" /><xsl:text>,</xsl:text>
								</xsl:for-each>
							</string>
						</dict>
					</array>
				</dict>

				<key>uuid</key>
				<string><xsl:value-of select="util:toString($uid)"/></string>
				<!-- <string><xsl:value-of select="$tagcomplete-uuid" /></string> -->
			</dict>
			</plist>
		</xsl:result-document>
	</xsl:template>
	
	<xsl:template name="write-attribute-completion-list">
		<xsl:variable name="uid" select="util:randomUUID()"/>
		<string><xsl:value-of select="util:toString($uid)"/></string>
		
		<xsl:result-document 
			href="Preferences/Completion%20Attributes.tmPreferences" format="plistxml">
			<plist version="1.0">
			<dict>
				<key>name</key>
				<string>Completions Attributes</string>

				<key>scope</key>
				<!-- text.html meta.tag -(entity.other.attribute-name | punctuation.definition.tag.begin | source | entity.name.tag | string | invalid.illegal.incomplete.html)-->
				<string>text.html.cfm meta.tag.other.html</string>

				<key>settings</key>
				<dict>
					<key>completions</key>
					<array>
						<xsl:for-each select="//dic:tag">
							<string><xsl:value-of select="./@name" /></string>
							<string><xsl:value-of select="translate(@name,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" /></string>
						</xsl:for-each>
					</array>
					<key>disableDefaultCompletion</key>
					<integer>0</integer>
					<key>shellVariables</key>
					<array>
						<dict>
							<key>name</key>
							<string>TM_COMPLETION_split</string>
							<key>value</key>
							<string>,</string>
						</dict>
						<dict>
							<key>name</key>
							<string>TM_COMPLETION_scope</string>
							<key>value</key>
							<string>html_attributes</string>
						</dict>
						<dict>
							<key>name</key>
							<string>TM_COMPLETIONS</string>
							<key>value</key>
							<string>
								<xsl:for-each select="//dic:tag/dic:parameter">
									<xsl:text>&lt;</xsl:text>
									<xsl:value-of select="../@name" /><xsl:text> </xsl:text>
									<xsl:value-of select="./@name" />
									<xsl:text>=&quot;&quot;</xsl:text>
									<xsl:text>,</xsl:text>
								</xsl:for-each>
							</string>
						</dict>
					</array>
				</dict>
				
				<key>uuid</key>
				<string><xsl:value-of select="util:toString($uid)"/></string>
			</dict>
			</plist>
		</xsl:result-document>
	</xsl:template>
	
	
	<xsl:template match="text()" />
</xsl:stylesheet>