component persistent="true"{

	property name="id" index="true" fieldtype="id" ormtype="char" length="35";
	property name="username" ormtype="string";
	property name="password" ormtype="string";
	property name="isadmin" ormtype="int";
	property name="dateCreated" ormtype="timestamp";
	property name="clientid" ormtype="int";

	public void function setid(){
		variables.id = createUUID();
	}

	public void function setUsername(String Username){
		variables.Username = arguments.Username;
	}

	public void function setPassword(String Password){
		variables.Password = hash(arguments.Password);
	}

	public void function setIsadmin(Numeric Isadmin){
		variables.Isadmin = arguments.Isadmin;
	}

	public void function setclientid(Numeric clientid){
		variables.clientid = arguments.clientid;
	}

	public void function setdateCreated(any dateCreated){
		if(NOT isDate(arguments.dateCreated)) variables.dateCreated = now();
		else variables.dateCreated = arguments.dateCreated;
	}

}