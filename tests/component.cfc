component output="false"{
	variable.aFactory = createObject('component', 'some.path.to.cfc').init();
	
	public any function init(){
		return this;
	}

	public any function new(){
		return new models.claims();
	}

	public any function list(int clientid){

		var cloneqry = new Query();
		cloneqry.setSQL("SELECT * FROM table WHERE column = :cid ORDER BY anothercolumn LIMIT 0,500" );

		cloneqry.addParam(name = "cid", value = arguments.clientid, cfsqltype = "cf_sql_integer");

		return cloneqry.execute().getResult();
	}

	remote function getTodos() returnformat="json" returntype="any" output="false"{
		return somethingHere
	}

}