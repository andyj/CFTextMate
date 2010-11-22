#!/bin/sh

ant clean -Doutput.name=BlueDragon-7.0

ant -Doutput.name=BlueDragon-7.0 \
	-Ddictionary.file=Resources/cfmlBD70.xml \
	-Dbundle.uuid=EA6D9495-D926-4EE9-BEE3-F49F63A5C5D0 \
	-Dsyntax.uuid=2B5E29C4-68BA-4F0D-9994-3970C9497ADD \
	-Dcmddoc.uuid=1C98FC52-4F0A-42D8-9AA8-F1713842EE05 \
	build
	
