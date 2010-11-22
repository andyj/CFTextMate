#!/bin/sh

ant clean -Doutput.name=BlueDragon-6.2

ant -Doutput.name=BlueDragon-6.2 \
	-Ddictionary.file=Resources/cfmlBD621.xml \
	-Dbundle.uuid=4E1ABDD8-CE67-4192-9D76-1103D3639D47 \
	-Dsyntax.uuid=AE4BC6F4-4EE1-471C-B509-85E683F94BA6 \
	-Dcmddoc.uuid=6FCD2CF3-D0CE-4191-A750-BE5D5196AFEF \
	build
	

	