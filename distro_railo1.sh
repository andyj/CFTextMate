#!/bin/sh

ant clean -Doutput.name=Railo-1

ant -Doutput.name=Railo-1 \
	-Ddictionary.file=Resources/railo1.xml \
	-Dbundle.uuid=2E937CBE-9B70-42C6-974A-987E8848251E \
	-Dsyntax.uuid=888FB6E0-4CBC-4521-A51C-3D03AAB85F01 \
	-Dcmddoc.uuid=632D2425-1F06-4944-9712-7EEA5FE7AE54 \
	build
	
