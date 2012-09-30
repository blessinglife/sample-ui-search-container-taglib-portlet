<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/init.jsp" %>

<%
PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("mvcPath", "/basic.jsp");
%>

<!--
The headerNames attribute holds the title keys for the columns. 
IteratorURL holds the URL value for this page.  It can be initialized in
a number of ways, including as seen above.
-->
<liferay-ui:search-container
	headerNames="email-address,screen-name"
	iteratorURL="<%= portletURL %>" >
	
        <liferay-ui:search-container-results>
            <%

            /**
             * "results" variable is initialized by the taglib. Retrieve the list of items. 
             * This may vary depending on how you obtain or create the list.
             **/
	         results = UserLocalServiceUtil.getUsers(searchContainer.getStart(), searchContainer.getEnd()); 
                 
            /**
             * "total" is another variable initialized by the taglib. This variable simply
             * holds the total number of items the search container will hold. Change this line
             * as necessary to get the total number of items to display.
             **/
	         total = UserLocalServiceUtil.getUsersCount(); 

             // Set the proper page attributes based on the above information. No need to change this. 
             pageContext.setAttribute("results", results); 
             pageContext.setAttribute("total", total); 
                
             %> 
        </liferay-ui:search-container-results> 
        
    <!--
    The search container row tag sets up our object. Since we have a List of Users
    one single row represents one single User object. Therefore, our "className" is         
    User. Be sure to fully qualify the class name. The escapedModel value is set to "true"
    to make sure that any values returned are properly HTML escaped. The "modelVar" 
    represents any value you want to use in the column text. 
    The variable is initialized for you. 
    -->
	<liferay-ui:search-container-row 
            className="com.liferay.portal.model.User"  
            escapedModel="<%= true %>" 
            keyProperty="userId" 
            modelVar="curUser" > 

            <!--
            Create a column text tag for each column you want to display. 
            The name field is localized. Set a key that can be translated 
            from the Language.properties files. 
            -->
	        <liferay-ui:search-container-column-text 
                    name="email-address" 
                    property="emailAddress" /> 

                <liferay-ui:search-container-column-text 
                    name="screen-name" 
                    property="screenName" /> 

        </liferay-ui:search-container-row> 

        <!--
        Iterator will paginate your results as necessary. The "paginate"
        paramater is true by default. Set to false to make sure all your
        items appear on one page. Most of the time you will likely want
        to leave the default because you want to paginate your results.
        --> 
	<liferay-ui:search-iterator paginate="<%=false %>" /> 
</liferay-ui:search-container>

<div class="separator"></div>

<a href="<portlet:renderURL />">&laquo; Back</a>