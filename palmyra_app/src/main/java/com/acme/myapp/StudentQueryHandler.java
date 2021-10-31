package com.acme.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zitlab.palmyra.api2db.base.annotations.ApiMapping;
import com.zitlab.palmyra.api2db.handler.QueryHandler;
import com.zitlab.palmyra.cinch.pojo.QueryFilter;
import com.zitlab.palmyra.cinch.pojo.Tuple;
import com.zitlab.palmyra.cinch.security.ACLRights;
import com.zitlab.palmyra.cinch.security.UserProvider;
import com.zitlab.palmyra.sqlbuilder.condition.BinaryCondition;

@Component
@ApiMapping("Student")
public class StudentQueryHandler implements QueryHandler{
    
	private UserProvider userProvider;
	
	
    public StudentQueryHandler(@Autowired UserProvider userProvider) {
		super();
		this.userProvider = userProvider;
	}

	public int aclCheck(String type, String action, Tuple item)   {
        return ACLRights.READ;
    }

    public QueryFilter applyPreFilter(QueryFilter filter){    
    	String loggedUser = userProvider.getUser();
//    	filter.addCondition(BinaryCondition.equals("studentCode",loggedUser));
        return filter;
    }
}