#!/bin/sh

ant clean -Doutput.name=ColdFusion-5

ant -Doutput.name=ColdFusion-5 \
	-Ddictionary.file=Resources/cfml5.xml \
	-Dbundle.uuid=F1E04FB5-BC5C-4F7D-8C3A-BA57840C9F67 \
	-Dsyntax.uuid=F8252600-A1B4-4A3D-A00A-E15518D6DFF5 \
	-Dcmddoc.uuid=E9D2E2D0-9FD1-4F20-AF4D-0E5E33A27C2A \
	build
	
