#!/bin/sh

ant clean -Doutput.name=ColdFusion-8

ant -Doutput.name=ColdFusion-8 \
	-Ddictionary.file=Resources/cf8.xml \
	-Dbundle.uuid=5542B766-BF1B-4C9C-819A-555606E2B52A \
	-Dsyntax.uuid=77E00F27-5C6F-4AC7-ACF1-494D9016CFB5 \
	-Dcmddoc.uuid=2DF46A31-45E7-4DF5-B8DA-E7C6D1FB3E37 \
	build
	
