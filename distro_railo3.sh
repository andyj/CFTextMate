#!/bin/sh

ant clean -Doutput.name=Railo-3.2

ant -Doutput.name=Railo-3.2 \
	-Ddictionary.file=Resources/railo3.2.xml \
	-Dxsl.file=railo_dictToBundle.xsl \
	-Ddoc.xsl.file=railo_dictToAPI.xsl \
	-Dbundle.uuid=30BE174E-C362-4139-A5AC2145D7584792 \
	-Dsyntax.uuid=6C4A2B26-2D23-4902-879246C6D6EF2368 \
	-Dcmddoc.uuid=4E5F6931-3BD8-4A04-87E1653B0A8F4028 \
	build
	


