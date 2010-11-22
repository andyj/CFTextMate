#!/bin/sh

ant clean -Doutput.name=ColdFusion-6.1

ant -Doutput.name=ColdFusion-6.1 \
	-Ddictionary.file=Resources/cfml61.xml \
	-Dbundle.uuid=94CAE6E0-460A-49B9-86A2-5ED54D895B2C \
	-Dsyntax.uuid=6B36B371-7CFB-4DB7-95D7-A58F4DDC2B8D \
	-Dcmddoc.uuid=9BFEC409-C77E-44E4-8CC3-FCD819461F33 \
	build
	
