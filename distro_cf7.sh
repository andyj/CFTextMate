#!/bin/sh

ant clean -Doutput.name=ColdFusion-7

ant -Doutput.name=ColdFusion-7 \
	-Ddictionary.file=Resources/cfml7.xml \
	-Dbundle.uuid=7E0B6266-EF5F-47C2-97A6-C109B3ACD1CE \
	-Dsyntax.uuid=73AEAF76-C984-4D97-8ACC-F988169D549B \
	-Dcmddoc.uuid=E03CB152-F2C7-4F54-BA6A-CA09ADCEF4E9 \
	build
	
